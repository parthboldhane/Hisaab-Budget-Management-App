import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:csv/csv.dart';
import 'package:drift/drift.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import '../domain/backend_errors.dart';
import '../domain/ledger_models.dart';
import '../domain/repository_contracts.dart';
import '../domain/service_contracts.dart';
import 'app_database.dart';

class LocalFileServices implements CsvDataService, LocalBackupService {
  LocalFileServices({
    required this.database,
    required this.transactions,
    required this.candidates,
    Uuid? uuid,
    Future<Directory> Function()? directoryProvider,
  }) : _uuid = uuid ?? const Uuid(),
       _directoryProvider = directoryProvider ?? getApplicationSupportDirectory;

  final AppDatabase database;
  final TransactionRepository transactions;
  final CandidateRepository candidates;
  final Uuid _uuid;
  final Future<Directory> Function() _directoryProvider;

  static const int _formatVersion = 1;
  static const List<String> _tableNames = <String>[
    'accounts',
    'categories',
    'subcategories',
    'payment_methods',
    'transactions',
    'budgets',
    'savings_goals',
    'savings_contributions',
    'recurring_plans',
    'detected_transaction_candidates',
    'candidate_duplicate_links',
    'candidate_fingerprints',
    'import_batches',
    'import_rows',
    'user_settings',
    'local_backup_metadata',
  ];

  Future<Directory> _outputDirectory(String child) async {
    final root = await _directoryProvider();
    final directory = Directory(path.join(root.path, 'hisaab', child));
    await directory.create(recursive: true);
    return directory;
  }

  String _dateKey(DateTime date) =>
      '${date.year.toString().padLeft(4, '0')}-'
      '${date.month.toString().padLeft(2, '0')}-'
      '${date.day.toString().padLeft(2, '0')}';

  String _timestampName(DateTime date) =>
      date.toUtc().toIso8601String().replaceAll(':', '-');

  String _stringCell(List<dynamic> row, int index) =>
      index < row.length ? (row[index]?.toString().trim() ?? '') : '';

  int? _positiveInteger(String value) {
    final parsed = int.tryParse(value);
    return parsed != null && parsed > 0 ? parsed : null;
  }

  @override
  Future<CsvImportPreview> previewCsv(
    String contents, {
    required String accountId,
    String defaultCurrencyCode = 'INR',
  }) async {
    if (!RegExp(r'^[A-Z]{3}$').hasMatch(defaultCurrencyCode)) {
      throw const ValidationException('Currency must be an ISO 4217 code.');
    }
    final account = (await database.select(database.accounts).get()).where(
      (row) => row.id == accountId && !row.isArchived,
    );
    if (account.isEmpty) {
      throw RecordNotFoundException(
        'Active import account $accountId was not found.',
      );
    }
    if (account.first.currencyCode != defaultCurrencyCode) {
      throw const ValidationException(
        'Import currency must match the selected account currency.',
      );
    }

    List<List<dynamic>> records;
    try {
      records = Csv(autoDetect: false).decode(contents);
    } on FormatException catch (error) {
      throw ValidationException('CSV could not be parsed: ${error.message}');
    }
    if (records.isEmpty) {
      throw const ValidationException('CSV file is empty.');
    }
    final headers = records.first
        .map((value) => value.toString().trim().toLowerCase())
        .toList(growable: false);
    final required = <String>{
      'kind',
      'amount_minor',
      'occurred_at',
      'local_date_key',
    };
    final missing = required.difference(headers.toSet());
    if (missing.isNotEmpty) {
      throw ValidationException(
        'CSV is missing required columns: ${missing.join(', ')}.',
      );
    }
    final indexes = <String, int>{
      for (var index = 0; index < headers.length; index++)
        headers[index]: index,
    };
    if (!indexes.containsKey('occurred_local_offset_minutes') &&
        !indexes.containsKey('occurred_timezone_id')) {
      throw const ValidationException(
        'CSV must include occurred_local_offset_minutes or occurred_timezone_id.',
      );
    }

    String cell(List<dynamic> row, String key) {
      final index = indexes[key];
      return index == null ? '' : _stringCell(row, index);
    }

    final result = <CsvImportPreviewRow>[];
    final existing = <LedgerTransaction>[];
    for (var offset = 1; offset < records.length; offset++) {
      final row = records[offset];
      if (row.every(
        (value) => value == null || value.toString().trim().isEmpty,
      )) {
        continue;
      }
      final rowNumber = offset + 1;
      final errors = <String>[];
      final rawKind = cell(row, 'kind').toLowerCase();
      LedgerKind? kind;
      for (final value in LedgerKind.values) {
        if (enumValue(value) == rawKind) kind = value;
      }
      if (kind == null) errors.add('Unknown kind "$rawKind".');

      final amount = _positiveInteger(cell(row, 'amount_minor'));
      if (amount == null) {
        errors.add('amount_minor must be a positive whole number of paise.');
      }

      final currency = cell(row, 'currency_code').isEmpty
          ? defaultCurrencyCode
          : cell(row, 'currency_code').toUpperCase();
      if (!RegExp(r'^[A-Z]{3}$').hasMatch(currency)) {
        errors.add('currency_code must be an ISO 4217 code.');
      } else if (currency != defaultCurrencyCode) {
        errors.add('Currency does not match the selected account.');
      }

      final occurred = DateTime.tryParse(cell(row, 'occurred_at'));
      if (occurred == null || !occurred.isUtc) {
        errors.add(
          'occurred_at must be an ISO 8601 instant with a UTC offset.',
        );
      }
      final localDateKey = cell(row, 'local_date_key');
      final localDate = DateTime.tryParse(localDateKey);
      if (localDateKey.length != 10 ||
          localDate == null ||
          _dateKey(localDate) != localDateKey) {
        errors.add('local_date_key must be YYYY-MM-DD.');
      }
      final offsetText = cell(row, 'occurred_local_offset_minutes');
      final localOffset = offsetText.isEmpty ? null : int.tryParse(offsetText);
      if (offsetText.isNotEmpty &&
          (localOffset == null || localOffset < -840 || localOffset > 840)) {
        errors.add('occurred_local_offset_minutes must be within 14 hours.');
      }
      final timezoneText = cell(row, 'occurred_timezone_id');
      final timezoneId = timezoneText.isEmpty ? null : timezoneText;
      if (localOffset == null && timezoneId == null) {
        errors.add('A captured local offset or timezone ID is required.');
      }
      if (occurred != null &&
          localOffset != null &&
          localDate != null &&
          _dateKey(occurred.toUtc().add(Duration(minutes: localOffset))) !=
              localDateKey) {
        errors.add('local_date_key does not match the captured UTC offset.');
      }

      final transferSource = cell(row, 'source_account_id');
      final transferDestination = cell(row, 'destination_account_id');
      final rowAccountId = cell(row, 'account_id').isEmpty
          ? accountId
          : cell(row, 'account_id');
      final resolvedAccount = kind == LedgerKind.transfer ? null : rowAccountId;
      final sourceAccount = kind == LedgerKind.transfer
          ? (transferSource.isEmpty ? accountId : transferSource)
          : null;
      final destinationAccount = kind == LedgerKind.transfer
          ? transferDestination
          : null;
      if (kind == LedgerKind.transfer &&
          (sourceAccount == null ||
              destinationAccount == null ||
              sourceAccount == destinationAccount)) {
        errors.add(
          'Transfers require distinct source_account_id and destination_account_id.',
        );
      }

      final categoryId = cell(row, 'category_id');
      final description = cell(row, 'description');
      final externalReference = cell(row, 'external_reference');
      final possibleDuplicates = <String>[];
      final possibleDuplicateCandidates = <String>[];
      if (kind != null && amount != null && occurred != null) {
        final from = DateTime(
          localDate?.year ?? occurred.year,
          localDate?.month ?? occurred.month,
          localDate?.day ?? occurred.day,
        ).subtract(const Duration(hours: 4));
        final to = from.add(const Duration(hours: 8));
        existing.addAll(
          await transactions.listTransactions(
            TransactionFilter(
              startDate: from,
              endDate: to,
              kind: kind,
              minAmountMinor: amount,
              maxAmountMinor: amount,
            ),
            page: const PageRequest(limit: 1000),
          ),
        );
        for (final transaction in existing) {
          if (transaction.amountMinor != amount ||
              transaction.currencyCode != currency ||
              transaction.kind != kind ||
              transaction.occurredAtUtc.difference(occurred).abs() >
                  const Duration(hours: 4)) {
            continue;
          }
          if (externalReference.isNotEmpty &&
              transaction.externalReference != null &&
              transaction.externalReference != externalReference) {
            continue;
          }
          possibleDuplicates.add(transaction.id);
        }
        final candidateRows =
            await (database.select(database.detectedTransactionCandidates)
                  ..where(
                    (candidate) =>
                        candidate.candidateState.isIn(<String>[
                          'needs_review',
                          'duplicate_review_pending',
                        ]) &
                        candidate.normalizedKind.equals(enumValue(kind!)) &
                        candidate.currencyCode.equals(currency) &
                        candidate.amountMinor.equals(amount),
                  ))
                .get();
        for (final candidate in candidateRows) {
          if (candidate.occurredAt.difference(occurred).abs() >
              const Duration(hours: 4)) {
            continue;
          }
          if (externalReference.isNotEmpty &&
              candidate.sourceReference != null &&
              candidate.sourceReference != externalReference) {
            continue;
          }
          if (candidate.accountId != null &&
              resolvedAccount != null &&
              candidate.accountId != resolvedAccount) {
            continue;
          }
          possibleDuplicateCandidates.add(candidate.id);
        }
      }
      result.add(
        CsvImportPreviewRow(
          rowNumber: rowNumber,
          isValid: errors.isEmpty,
          kind: kind,
          amountMinor: amount,
          currencyCode: currency,
          occurredAtUtc: occurred?.toUtc(),
          occurredLocalOffsetMinutes: localOffset,
          occurredTimezoneId: timezoneId,
          localDateKey: localDateKey,
          accountId: resolvedAccount,
          sourceAccountId: sourceAccount,
          destinationAccountId: destinationAccount,
          categoryId: categoryId.isEmpty ? null : categoryId,
          description: description.isEmpty ? null : description,
          externalReference: externalReference.isEmpty
              ? null
              : externalReference,
          errors: List<String>.unmodifiable(errors),
          possibleDuplicateTransactionIds: List<String>.unmodifiable(
            possibleDuplicates.toSet().toList(),
          ),
          possibleDuplicateCandidateIds: List<String>.unmodifiable(
            possibleDuplicateCandidates.toSet().toList(),
          ),
        ),
      );
    }
    return CsvImportPreview(
      rows: List<CsvImportPreviewRow>.unmodifiable(result),
      accountId: accountId,
      createdAt: DateTime.now().toUtc(),
    );
  }

  @override
  Future<CsvImportResult> commitCsvPreview(
    CsvImportPreview preview,
    Set<int> selectedRowNumbers,
  ) async {
    final selected = <CsvImportPreviewRow>[];
    for (final row in preview.rows) {
      if (selectedRowNumbers.contains(row.rowNumber) && row.isValid) {
        selected.add(row);
      }
    }
    final batchId = _uuid.v4();
    final now = DateTime.now().toUtc();
    var imported = 0;
    var failed = preview.rows
        .where(
          (row) => selectedRowNumbers.contains(row.rowNumber) && !row.isValid,
        )
        .length;
    final skipped = preview.rows.length - selected.length - failed;
    final candidateIds = <String>[];

    await database.transaction(() async {
      await database
          .into(database.importBatches)
          .insert(
            ImportBatchesCompanion.insert(
              id: batchId,
              fileName: 'local-csv-import',
              status: 'preview',
              createdAt: now,
            ),
          );
      for (final row in preview.rows) {
        final isSelected = selectedRowNumbers.contains(row.rowNumber);
        final selectedValid = isSelected && row.isValid;
        final importRowId = _uuid.v4();
        await database
            .into(database.importRows)
            .insert(
              ImportRowsCompanion.insert(
                id: importRowId,
                batchId: batchId,
                rowNumber: row.rowNumber,
                parsedKind: Value(
                  row.kind == null ? null : enumValue(row.kind!),
                ),
                parsedAmountMinor: Value(row.amountMinor),
                parsedCurrencyCode: Value(row.currencyCode),
                parsedOccurredAt: Value(row.occurredAtUtc),
                parsedLocalOffsetMinutes: Value(row.occurredLocalOffsetMinutes),
                parsedTimezoneId: Value(row.occurredTimezoneId),
                localDateKey: Value(row.localDateKey),
                parsedAccountName: Value(row.accountId),
                parsedCategoryName: Value(row.categoryId),
                parseErrorsJson: Value(jsonEncode(row.errors)),
                duplicateOfTransactionId: Value(
                  row.possibleDuplicateTransactionIds.isEmpty
                      ? null
                      : row.possibleDuplicateTransactionIds.first,
                ),
                userDecision: Value(
                  selectedValid
                      ? 'accepted'
                      : isSelected
                      ? 'needs_review'
                      : 'pending',
                ),
                createdAt: now,
              ),
            );
        if (!selectedValid) continue;

        try {
          final candidate = await candidates.submitCandidate(
            NormalizedCandidateInput(
              source: TransactionSource.import,
              kind: row.kind!,
              amountMinor: row.amountMinor!,
              currencyCode: row.currencyCode!,
              occurredAtUtc: row.occurredAtUtc!,
              localDateKey: row.localDateKey!,
              status: TransactionStatus.successful,
              accountId: row.kind == LedgerKind.transfer
                  ? null
                  : row.accountId!,
              sourceAccountId: row.sourceAccountId,
              destinationAccountId: row.destinationAccountId,
              categoryId: row.categoryId,
              description: row.description,
              externalReference: row.externalReference,
              sourceContext: batchId,
              occurredLocalOffsetMinutes: row.occurredLocalOffsetMinutes,
              occurredTimezoneId: row.occurredTimezoneId,
            ),
          );
          candidateIds.add(candidate.id);
          imported++;
          await (database.update(database.importRows)
                ..where((importRow) => importRow.id.equals(importRowId)))
              .write(ImportRowsCompanion(candidateId: Value(candidate.id)));
        } on BackendException {
          failed++;
          await (database.update(
            database.importRows,
          )..where((importRow) => importRow.id.equals(importRowId))).write(
            const ImportRowsCompanion(userDecision: Value('needs_review')),
          );
        }
      }
      await (database.update(
        database.importBatches,
      )..where((batch) => batch.id.equals(batchId))).write(
        ImportBatchesCompanion(
          status: const Value('committed'),
          committedAt: Value(DateTime.now().toUtc()),
        ),
      );
    });
    return CsvImportResult(
      batchId: batchId,
      imported: imported,
      skipped: skipped,
      failed: failed,
      candidateIds: List<String>.unmodifiable(candidateIds),
    );
  }

  @override
  Future<LocalFileExport> exportTransactions(TransactionFilter filter) async {
    final rows = <LedgerTransaction>[];
    var offset = 0;
    const limit = 500;
    while (true) {
      final page = await transactions.listTransactions(
        filter,
        page: PageRequest(offset: offset, limit: limit),
      );
      rows.addAll(page);
      if (page.length < limit) break;
      offset += limit;
    }
    final converter = Csv();
    final csvRows = <List<Object?>>[
      <Object?>[
        'id',
        'kind',
        'amount_minor',
        'currency_code',
        'occurred_at',
        'occurred_local_offset_minutes',
        'occurred_timezone_id',
        'local_date_key',
        'status',
        'account_id',
        'source_account_id',
        'destination_account_id',
        'category_id',
        'subcategory_id',
        'payment_method_id',
        'description',
        'external_reference',
        'source',
      ],
      for (final row in rows)
        <Object?>[
          row.id,
          enumValue(row.kind),
          row.amountMinor,
          row.currencyCode,
          row.occurredAtUtc.toIso8601String(),
          row.occurredLocalOffsetMinutes,
          row.occurredTimezoneId,
          row.localDateKey,
          enumValue(row.status),
          row.accountId,
          row.sourceAccountId,
          row.destinationAccountId,
          row.categoryId,
          row.subcategoryId,
          row.paymentMethodId,
          row.description,
          row.externalReference,
          enumValue(row.source),
        ],
    ];
    final now = DateTime.now().toUtc();
    final name = 'hisaab-transactions-${_timestampName(now)}.csv';
    final directory = await _outputDirectory('exports');
    final file = File(path.join(directory.path, name));
    await file.writeAsString(converter.encode(csvRows), flush: true);
    return LocalFileExport(
      filePath: file.path,
      fileName: name,
      createdAt: now,
      sha256: sha256.convert(await file.readAsBytes()).toString(),
    );
  }

  Future<Map<String, Object?>> _readTables() async {
    final tables = <String, Object?>{};
    for (final name in _tableNames) {
      final rows = await database.customSelect('SELECT * FROM "$name"').get();
      tables[name] = rows.map((row) => row.data).toList(growable: false);
    }
    return tables;
  }

  Map<String, Object?> _payload(Map<String, Object?> tables) =>
      <String, Object?>{
        'formatVersion': _formatVersion,
        'schemaVersion': database.schemaVersion,
        'createdAt': DateTime.now().toUtc().toIso8601String(),
        'tables': tables,
      };

  String _encodeBackup(Map<String, Object?> payload) {
    final payloadJson = jsonEncode(payload);
    final digest = sha256.convert(utf8.encode(payloadJson)).toString();
    return jsonEncode(<String, Object>{
      'payload': payload,
      'sha256': digest,
      'checksumAlgorithm': 'SHA-256',
    });
  }

  @override
  Future<LocalBackup> createBackup({String? label}) async {
    final payload = _payload(await _readTables());
    final contents = _encodeBackup(payload);
    final bytes = utf8.encode(contents);
    final now = DateTime.now().toUtc();
    final name = 'hisaab-backup-${_timestampName(now)}.json';
    final directory = await _outputDirectory('backups');
    final file = File(path.join(directory.path, name));
    await file.writeAsBytes(bytes, flush: true);
    final digest = sha256.convert(bytes).toString();
    await database
        .into(database.localBackupMetadata)
        .insert(
          LocalBackupMetadataCompanion.insert(
            id: _uuid.v4(),
            backupFileName: name,
            createdAt: now,
            fileHash: digest,
            checksumAlgorithm: 'SHA-256',
            encrypted: const Value(false),
            notes: Value(label?.trim()),
            valid: const Value(true),
          ),
        );
    return LocalBackup(
      filePath: file.path,
      fileName: name,
      createdAt: now,
      sha256: digest,
      encrypted: false,
    );
  }

  Map<String, Object?>? _readPayload(String contents) {
    try {
      final envelope = jsonDecode(contents);
      if (envelope is! Map<String, dynamic> ||
          envelope['payload'] is! Map<String, dynamic> ||
          envelope['sha256'] is! String ||
          envelope['checksumAlgorithm'] != 'SHA-256') {
        return null;
      }
      final payload = Map<String, Object?>.from(
        envelope['payload'] as Map<String, dynamic>,
      );
      final expected = sha256
          .convert(utf8.encode(jsonEncode(payload)))
          .toString();
      if (expected != envelope['sha256']) return null;
      if (payload['formatVersion'] != _formatVersion ||
          payload['schemaVersion'] != database.schemaVersion ||
          payload['tables'] is! Map<String, dynamic>) {
        return null;
      }
      final tables = payload['tables'] as Map<String, dynamic>;
      if (tables.keys.toSet().difference(_tableNames.toSet()).isNotEmpty ||
          _tableNames.any((name) => tables[name] is! List)) {
        return null;
      }
      for (final table in _tableNames) {
        for (final rawRow in tables[table] as List) {
          if (rawRow is! Map<String, dynamic> ||
              rawRow.keys.any((key) => key.isEmpty) ||
              rawRow.values.any((value) => value is Map || value is List)) {
            return null;
          }
        }
      }
      return payload;
    } on FormatException {
      return null;
    } on TypeError {
      return null;
    }
  }

  @override
  Future<BackupValidation> validateBackup(String backupContents) async {
    final payload = _readPayload(backupContents);
    if (payload == null) {
      return const BackupValidation(
        valid: false,
        schemaVersion: null,
        tableRowCounts: <String, int>{},
        error: 'Backup is invalid, corrupt, or incompatible.',
      );
    }
    final tables = payload['tables'] as Map<String, dynamic>;
    return BackupValidation(
      valid: true,
      schemaVersion: payload['schemaVersion'] as int,
      tableRowCounts: <String, int>{
        for (final table in _tableNames) table: (tables[table] as List).length,
      },
    );
  }

  @override
  Future<void> restoreBackup(
    String backupContents, {
    required bool confirmed,
  }) async {
    if (!confirmed) {
      throw const ValidationException(
        'Restore requires explicit user confirmation.',
      );
    }
    final payload = _readPayload(backupContents);
    if (payload == null) {
      throw const InvalidBackupException(
        'Backup is invalid, corrupt, or incompatible.',
      );
    }
    final tables = payload['tables'] as Map<String, dynamic>;
    await database.transaction(() async {
      for (final table in _tableNames.reversed) {
        await database.customStatement('DELETE FROM "$table"');
      }
      for (final table in _tableNames) {
        final rawRows = tables[table] as List;
        final columnsResult = await database
            .customSelect('PRAGMA table_info("$table")')
            .get();
        final columns = columnsResult
            .map((row) => row.data['name'] as String)
            .toSet();
        for (final rawRow in rawRows) {
          final row = Map<String, dynamic>.from(rawRow as Map);
          if (row.keys.any((column) => !columns.contains(column))) {
            throw InvalidBackupException(
              'Backup contains an unknown column for $table.',
            );
          }
          if (row.isEmpty) continue;
          final names = row.keys.map((column) => '"$column"').join(', ');
          final placeholders = List<String>.filled(row.length, '?').join(', ');
          await database.customStatement(
            'INSERT INTO "$table" ($names) VALUES ($placeholders)',
            row.values.toList(growable: false),
          );
        }
      }
    });
  }
}
