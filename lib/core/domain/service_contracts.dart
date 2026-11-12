import 'ledger_models.dart';
import 'repository_contracts.dart';

class CsvImportPreviewRow {
  const CsvImportPreviewRow({
    required this.rowNumber,
    required this.isValid,
    required this.kind,
    required this.amountMinor,
    required this.currencyCode,
    required this.occurredAtUtc,
    required this.occurredLocalOffsetMinutes,
    required this.occurredTimezoneId,
    required this.localDateKey,
    required this.accountId,
    required this.sourceAccountId,
    required this.destinationAccountId,
    required this.categoryId,
    required this.description,
    required this.externalReference,
    required this.errors,
    required this.possibleDuplicateTransactionIds,
    required this.possibleDuplicateCandidateIds,
  });

  final int rowNumber;
  final bool isValid;
  final LedgerKind? kind;
  final int? amountMinor;
  final String? currencyCode;
  final DateTime? occurredAtUtc;
  final int? occurredLocalOffsetMinutes;
  final String? occurredTimezoneId;
  final String? localDateKey;
  final String? accountId;
  final String? sourceAccountId;
  final String? destinationAccountId;
  final String? categoryId;
  final String? description;
  final String? externalReference;
  final List<String> errors;
  final List<String> possibleDuplicateTransactionIds;
  final List<String> possibleDuplicateCandidateIds;
}

class CsvImportPreview {
  const CsvImportPreview({
    required this.rows,
    required this.accountId,
    required this.createdAt,
  });

  final List<CsvImportPreviewRow> rows;
  final String accountId;
  final DateTime createdAt;
}

class CsvImportResult {
  const CsvImportResult({
    required this.batchId,
    required this.imported,
    required this.skipped,
    required this.failed,
    required this.candidateIds,
  });

  final String batchId;
  final int imported;
  final int skipped;
  final int failed;
  final List<String> candidateIds;
}

class LocalFileExport {
  const LocalFileExport({
    required this.filePath,
    required this.fileName,
    required this.createdAt,
    required this.sha256,
  });

  final String filePath;
  final String fileName;
  final DateTime createdAt;
  final String sha256;
}

class LocalBackup {
  const LocalBackup({
    required this.filePath,
    required this.fileName,
    required this.createdAt,
    required this.sha256,
    required this.encrypted,
  });

  final String filePath;
  final String fileName;
  final DateTime createdAt;
  final String sha256;
  final bool encrypted;
}

class BackupValidation {
  const BackupValidation({
    required this.valid,
    required this.schemaVersion,
    required this.tableRowCounts,
    this.error,
  });

  final bool valid;
  final int? schemaVersion;
  final Map<String, int> tableRowCounts;
  final String? error;
}

abstract interface class CsvDataService {
  Future<CsvImportPreview> previewCsv(
    String contents, {
    required String accountId,
    String defaultCurrencyCode = 'INR',
  });

  Future<CsvImportResult> commitCsvPreview(
    CsvImportPreview preview,
    Set<int> selectedRowNumbers,
  );

  Future<LocalFileExport> exportTransactions(TransactionFilter filter);
}

abstract interface class LocalBackupService {
  Future<LocalBackup> createBackup({String? label});
  Future<BackupValidation> validateBackup(String backupContents);
  Future<void> restoreBackup(String backupContents, {required bool confirmed});
}

abstract interface class NotificationTrackingAdapter {
  Future<TrackingPermissionState> getPermissionState();
  Future<void> openSettings();
  bool get canReceiveNotifications;
}

abstract interface class LocalSecurityService {
  Future<bool> authenticate();
  Future<void> setPin(String pin);
  Future<void> clearPin();
}

abstract interface class HisaabServices {
  AccountRepository get accounts;
  TransactionRepository get transactions;
  CatalogRepository get catalog;
  BudgetRepository get budgets;
  CandidateRepository get candidates;
  SettingsRepository get settings;
  CsvDataService get csv;
  LocalBackupService get backups;
  NotificationTrackingAdapter get notificationTracking;
  LocalSecurityService get localSecurity;
}
