import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../domain/backend_errors.dart';
import '../domain/ledger_models.dart';
import '../domain/repository_contracts.dart';
import 'app_database.dart';

class DriftHisaabRepository
    implements
        AccountRepository,
        TransactionRepository,
        CatalogRepository,
        BudgetRepository,
        CandidateRepository,
        SettingsRepository {
  DriftHisaabRepository(this.database, {Uuid? uuid})
    : _uuid = uuid ?? const Uuid();

  final AppDatabase database;
  final Uuid _uuid;

  static const Duration defaultDuplicateWindow = Duration(hours: 4);

  String _newId() => _uuid.v4();

  DateTime _utcNow() => DateTime.now().toUtc();

  void _validateMoney(int amountMinor, String currencyCode) {
    if (amountMinor <= 0) {
      throw const ValidationException(
        'Amount must be greater than zero paise.',
      );
    }
    if (!RegExp(r'^[A-Z]{3}$').hasMatch(currencyCode)) {
      throw const ValidationException('Currency must be an ISO 4217 code.');
    }
  }

  void _validateDateKey(String key) {
    final date = DateTime.tryParse(key);
    if (key.length != 10 ||
        date == null ||
        '${date.year.toString().padLeft(4, '0')}-'
                '${date.month.toString().padLeft(2, '0')}-'
                '${date.day.toString().padLeft(2, '0')}' !=
            key) {
      throw const ValidationException('Reporting date must use YYYY-MM-DD.');
    }
  }

  void _validateDateContext({
    required DateTime occurredAtUtc,
    required String localDateKey,
    required int? localOffsetMinutes,
    required String? timezoneId,
  }) {
    if (localOffsetMinutes == null &&
        (timezoneId == null || timezoneId.trim().isEmpty)) {
      throw const ValidationException(
        'Reporting context requires a local offset or timezone ID.',
      );
    }
    if (localOffsetMinutes != null &&
        (localOffsetMinutes < -840 || localOffsetMinutes > 840)) {
      throw const ValidationException('Local UTC offset must be within 14 hours.');
    }
    if (localOffsetMinutes != null &&
        _dateKey(
              occurredAtUtc
                  .toUtc()
                  .add(Duration(minutes: localOffsetMinutes)),
            ) !=
            localDateKey) {
      throw const ValidationException(
        'Local reporting date does not match the captured UTC offset.',
      );
    }
  }

  void _validateTransactionInput(TransactionInput input) {
    _validateMoney(input.amountMinor, input.currencyCode);
    _validateDateKey(input.localDateKey);
    if (!input.occurredAtUtc.isUtc) {
      throw const ValidationException('Transaction instant must be UTC.');
    }
    _validateDateContext(
      occurredAtUtc: input.occurredAtUtc,
      localDateKey: input.localDateKey,
      localOffsetMinutes: input.occurredLocalOffsetMinutes,
      timezoneId: input.occurredTimezoneId,
    );
    if (input.kind == LedgerKind.transfer) {
      if (input.sourceAccountId == null ||
          input.destinationAccountId == null ||
          input.sourceAccountId == input.destinationAccountId ||
          input.accountId != null ||
          input.categoryId != null ||
          input.subcategoryId != null) {
        throw const ValidationException(
          'A transfer requires different source and destination accounts.',
        );
      }
    } else if (input.accountId == null ||
        input.sourceAccountId != null ||
        input.destinationAccountId != null) {
      throw const ValidationException(
        'Income and expense require exactly one account.',
      );
    }
    if (input.kind != LedgerKind.expense &&
        (input.expenseBehavior != null ||
            input.allocationGroup != null ||
            input.allocationGroupName != null)) {
      throw const ValidationException(
        'Expense classifications can only be set on expenses.',
      );
    }
    if (input.allocationGroup == AllocationGroup.custom &&
        (input.allocationGroupName == null ||
            input.allocationGroupName!.trim().isEmpty)) {
      throw const ValidationException(
        'Custom allocation groups require a group name.',
      );
    }
  }

  TransactionsCompanion _transactionCompanion(
    TransactionInput input, {
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? originalSourceId,
  }) {
    return TransactionsCompanion.insert(
      id: id,
      kind: enumValue(input.kind),
      amountMinor: input.amountMinor,
      currencyCode: Value(input.currencyCode),
      occurredAt: input.occurredAtUtc.toUtc(),
      occurredLocalOffsetMinutes: Value(input.occurredLocalOffsetMinutes),
      occurredTimezoneId: Value(input.occurredTimezoneId),
      localDateKey: input.localDateKey,
      status: enumValue(input.status),
      verification: const Value('confirmed'),
      source: enumValue(input.source),
      accountId: Value(input.accountId),
      sourceAccountId: Value(input.sourceAccountId),
      destinationAccountId: Value(input.destinationAccountId),
      categoryId: Value(input.categoryId),
      subcategoryId: Value(input.subcategoryId),
      paymentMethodId: Value(input.paymentMethodId),
      description: Value(input.description),
      externalReference: Value(input.externalReference),
      createdAt: createdAt,
      updatedAt: updatedAt,
      originalSourceId: Value(originalSourceId),
      expenseBehavior: Value(
        input.expenseBehavior == null
            ? null
            : enumValue(input.expenseBehavior!),
      ),
      allocationGroup: Value(
        input.allocationGroup == null
            ? null
            : enumValue(input.allocationGroup!),
      ),
      allocationGroupName: Value(input.allocationGroupName?.trim()),
    );
  }

  LedgerTransaction _toLedgerTransaction(Transaction row) {
    return LedgerTransaction(
      id: row.id,
      kind: enumFromValue(LedgerKind.values, row.kind),
      amountMinor: row.amountMinor,
      currencyCode: row.currencyCode,
      occurredAtUtc: row.occurredAt.toUtc(),
      localDateKey: row.localDateKey,
      status: enumFromValue(TransactionStatus.values, row.status),
      source: enumFromValue(TransactionSource.values, row.source),
      accountId: row.accountId,
      sourceAccountId: row.sourceAccountId,
      destinationAccountId: row.destinationAccountId,
      categoryId: row.categoryId,
      subcategoryId: row.subcategoryId,
      paymentMethodId: row.paymentMethodId,
      description: row.description,
      externalReference: row.externalReference,
      createdAt: row.createdAt.toUtc(),
      updatedAt: row.updatedAt.toUtc(),
      occurredLocalOffsetMinutes: row.occurredLocalOffsetMinutes,
      occurredTimezoneId: row.occurredTimezoneId,
      originalSourceId: row.originalSourceId,
      expenseBehavior: row.expenseBehavior == null
          ? null
          : enumFromValue(ExpenseBehavior.values, row.expenseBehavior!),
      allocationGroup: row.allocationGroup == null
          ? null
          : enumFromValue(AllocationGroup.values, row.allocationGroup!),
      allocationGroupName: row.allocationGroupName,
    );
  }

  @override
  Future<AccountBalance> createAccount(AccountInput input) async {
    final name = input.name.trim();
    if (name.isEmpty || input.openingBalanceMinor < 0) {
      throw const ValidationException(
        'Account name and opening balance are invalid.',
      );
    }
    if (!RegExp(r'^[A-Z]{3}$').hasMatch(input.currencyCode)) {
      throw const ValidationException('Currency must be an ISO 4217 code.');
    }
    final now = _utcNow();
    final id = _newId();
    await database
        .into(database.accounts)
        .insert(
          AccountsCompanion.insert(
            id: id,
            name: name,
            kind: input.kind.trim(),
            currencyCode: Value(input.currencyCode),
            openingBalanceMinor: Value(input.openingBalanceMinor),
            createdAt: now,
            updatedAt: now,
          ),
        );
    return (await listAccounts(includeArchived: true))
        .singleWhere((account) => account.accountId == id);
  }

  @override
  Future<void> updateAccount(String id, AccountInput input) async {
    final name = input.name.trim();
    if (name.isEmpty || input.openingBalanceMinor < 0) {
      throw const ValidationException(
        'Account name and opening balance are invalid.',
      );
    }
    if (!RegExp(r'^[A-Z]{3}$').hasMatch(input.currencyCode)) {
      throw const ValidationException('Currency must be an ISO 4217 code.');
    }
    final existing = await (database.select(
      database.accounts,
    )..where((account) => account.id.equals(id) & account.isArchived.equals(false))).getSingleOrNull();
    if (existing == null) {
      throw RecordNotFoundException('Account $id was not found.');
    }
    if (existing.currencyCode != input.currencyCode) {
      final referencedTransactions = await (database.select(
        database.transactions,
      )..where(
        (transaction) =>
            transaction.accountId.equals(id) |
            transaction.sourceAccountId.equals(id) |
            transaction.destinationAccountId.equals(id),
      )).get();
      if (referencedTransactions.isNotEmpty) {
        throw const ValidationException(
          'An account currency cannot change after transactions reference it.',
        );
      }
    }
    final updated =
        await (database.update(database.accounts)..where(
              (account) =>
                  account.id.equals(id) & account.isArchived.equals(false),
            ))
            .write(
              AccountsCompanion(
                name: Value(name),
                kind: Value(input.kind.trim()),
                currencyCode: Value(input.currencyCode),
                openingBalanceMinor: Value(input.openingBalanceMinor),
                updatedAt: Value(_utcNow()),
              ),
            );
    if (updated == 0) {
      throw RecordNotFoundException('Account $id was not found.');
    }
  }

  @override
  Future<void> archiveAccount(String id) async {
    final updated =
        await (database.update(database.accounts)..where(
              (account) =>
                  account.id.equals(id) & account.isArchived.equals(false),
            ))
            .write(
              AccountsCompanion(
                isArchived: const Value(true),
                updatedAt: Value(_utcNow()),
              ),
            );
    if (updated == 0) {
      throw RecordNotFoundException('Account $id was not found.');
    }
  }

  @override
  Future<List<AccountBalance>> listAccounts({
    bool includeArchived = false,
  }) async {
    final query = database.select(database.accounts);
    if (!includeArchived) {
      query.where((account) => account.isArchived.equals(false));
    }
    final rows = await query.get();
    final result = <AccountBalance>[];
    for (final account in rows) {
      result.add(
        AccountBalance(
          accountId: account.id,
          name: account.name,
          currencyCode: account.currencyCode,
          balanceMinor: await _accountBalanceMinor(account),
          isArchived: account.isArchived,
        ),
      );
    }
    return result;
  }

  @override
  Stream<List<AccountBalance>> watchAccounts({bool includeArchived = false}) {
    return database
        .customSelect(
          'SELECT 1',
          readsFrom: {
            database.accounts,
            database.transactions,
          },
        )
        .watch()
        .asyncMap((_) => listAccounts(includeArchived: includeArchived));
  }

  Future<int> _accountBalanceMinor(Account account) async {
    final entries =
        await (database.select(database.transactions)..where(
              (row) =>
                  row.deletedAt.isNull() &
                  row.status.equals(enumValue(TransactionStatus.successful)) &
                  (row.accountId.equals(account.id) |
                      row.sourceAccountId.equals(account.id) |
                      row.destinationAccountId.equals(account.id)),
            ))
            .get();
    var balance = account.openingBalanceMinor;
    for (final entry in entries) {
      if (entry.kind == enumValue(LedgerKind.income) &&
          entry.accountId == account.id) {
        balance += entry.amountMinor;
      } else if (entry.kind == enumValue(LedgerKind.expense) &&
          entry.accountId == account.id) {
        balance -= entry.amountMinor;
      } else if (entry.kind == enumValue(LedgerKind.transfer)) {
        if (entry.sourceAccountId == account.id) {
          balance -= entry.amountMinor;
        }
        if (entry.destinationAccountId == account.id) {
          balance += entry.amountMinor;
        }
      }
    }
    return balance;
  }

  @override
  Future<LedgerTransaction?> getTransaction(String id) async {
    final row = await (database.select(
      database.transactions,
    )..where((transaction) => transaction.id.equals(id))).getSingleOrNull();
    if (row == null) return null;
    return _toLedgerTransaction(row);
  }

  @override
  Future<List<LedgerTransaction>> listTransactions(
    TransactionFilter filter, {
    PageRequest page = const PageRequest(),
  }) async {
    final query = database.select(database.transactions)
      ..orderBy(<OrderingTerm Function(Transactions)>[
        (row) => OrderingTerm.desc(row.occurredAt),
        (row) => OrderingTerm.desc(row.createdAt),
      ])
      ..limit(page.limit, offset: page.offset);
    query.where((row) => _transactionPredicate(row, filter));
    return (await query.get())
        .map(_toLedgerTransaction)
        .toList(growable: false);
  }

  Expression<bool> _transactionPredicate(
    $TransactionsTable row,
    TransactionFilter filter,
  ) {
    Expression<bool> predicate = const Constant(true);
    if (!filter.includeDeleted) predicate = predicate & row.deletedAt.isNull();
    predicate = predicate & row.verification.equals('confirmed');
    if (filter.startDate != null) {
      predicate =
          predicate &
          row.localDateKey.isBiggerOrEqualValue(_dateKey(filter.startDate!));
    }
    if (filter.endDate != null) {
      predicate =
          predicate &
          row.localDateKey.isSmallerOrEqualValue(_dateKey(filter.endDate!));
    }
    if (filter.accountId != null) {
      predicate =
          predicate &
          (row.accountId.equals(filter.accountId!) |
              row.sourceAccountId.equals(filter.accountId!) |
              row.destinationAccountId.equals(filter.accountId!));
    }
    if (filter.categoryId != null) {
      predicate = predicate & row.categoryId.equals(filter.categoryId!);
    }
    if (filter.kind != null) {
      predicate = predicate & row.kind.equals(enumValue(filter.kind!));
    }
    if (filter.status != null) {
      predicate = predicate & row.status.equals(enumValue(filter.status!));
    }
    if (filter.source != null) {
      predicate = predicate & row.source.equals(enumValue(filter.source!));
    }
    if (filter.minAmountMinor != null) {
      predicate =
          predicate &
          row.amountMinor.isBiggerOrEqualValue(filter.minAmountMinor!);
    }
    if (filter.maxAmountMinor != null) {
      predicate =
          predicate &
          row.amountMinor.isSmallerOrEqualValue(filter.maxAmountMinor!);
    }
    final search = filter.searchText?.trim();
    if (search != null && search.isNotEmpty) {
      final pattern =
          '%${search.replaceAll('%', r'\%').replaceAll('_', r'\_')}%';
      predicate =
          predicate &
          (row.description.like(pattern) | row.externalReference.like(pattern));
    }
    return predicate;
  }

  String _dateKey(DateTime date) =>
      '${date.year.toString().padLeft(4, '0')}-'
      '${date.month.toString().padLeft(2, '0')}-'
      '${date.day.toString().padLeft(2, '0')}';

  @override
  Stream<List<LedgerTransaction>> watchTransactions(TransactionFilter filter) {
    final query = database.select(database.transactions)
      ..orderBy(<OrderingTerm Function(Transactions)>[
        (row) => OrderingTerm.desc(row.occurredAt),
        (row) => OrderingTerm.desc(row.createdAt),
      ]);
    query.where((row) => _transactionPredicate(row, filter));
    return query.watch().map(
      (rows) => rows.map(_toLedgerTransaction).toList(growable: false),
    );
  }

  @override
  Future<LedgerTransaction> createTransaction(TransactionInput input) async {
    _validateTransactionInput(input);
    final now = _utcNow();
    final id = _newId();
    await database.transaction(() async {
      await _validateAccountReferences(input);
      await database
          .into(database.transactions)
          .insert(
            _transactionCompanion(
              input,
              id: id,
              createdAt: now,
              updatedAt: now,
            ),
          );
    });
    return (await getTransaction(id))!;
  }

  @override
  Future<LedgerTransaction> updateTransaction(
    String id,
    TransactionInput input,
  ) async {
    _validateTransactionInput(input);
    final existing =
        await (database.select(database.transactions)..where(
              (row) =>
                  row.id.equals(id) &
                  row.deletedAt.isNull() &
                  row.verification.equals('confirmed'),
            ))
            .getSingleOrNull();
    if (existing == null) {
      throw RecordNotFoundException('Transaction $id was not found.');
    }
    await database.transaction(() async {
      await _validateAccountReferences(input);
      await database
          .into(database.transactions)
          .insertOnConflictUpdate(
            _transactionCompanion(
              input,
              id: id,
              createdAt: existing.createdAt,
              updatedAt: _utcNow(),
              originalSourceId: existing.originalSourceId,
            ),
          );
    });
    return (await getTransaction(id))!;
  }

  Future<void> _validateAccountReferences(TransactionInput input) async {
    final accountIds = <String>{
      if (input.accountId != null) input.accountId!,
      if (input.sourceAccountId != null) input.sourceAccountId!,
      if (input.destinationAccountId != null) input.destinationAccountId!,
    };
    for (final id in accountIds) {
      final account =
          await (database.select(database.accounts)..where(
                (row) => row.id.equals(id) & row.isArchived.equals(false),
              ))
              .getSingleOrNull();
      if (account == null) {
        throw RecordNotFoundException('Active account $id was not found.');
      }
      if (account.currencyCode != input.currencyCode) {
        throw const ValidationException(
          'Transaction and account currencies must match.',
        );
      }
    }
    if (input.categoryId != null) {
      final category = await (database.select(
        database.categories,
      )..where(
        (row) =>
            row.id.equals(input.categoryId!) &
            row.isArchived.equals(false) &
            row.kind.equals(enumValue(input.kind)),
      )).getSingleOrNull();
      if (category == null) {
        throw RecordNotFoundException(
          'Active ${enumValue(input.kind)} category ${input.categoryId} was not found.',
        );
      }
    }
    if (input.subcategoryId != null) {
      final subcategory = await (database.select(
        database.subcategories,
      )..where(
        (row) =>
            row.id.equals(input.subcategoryId!) &
            row.isArchived.equals(false),
      )).getSingleOrNull();
      if (subcategory == null ||
          subcategory.categoryId != input.categoryId) {
        throw const ValidationException(
          'Subcategory must be active and belong to the selected category.',
        );
      }
    }
    if (input.paymentMethodId != null) {
      final method = await (database.select(
        database.paymentMethods,
      )..where(
        (row) =>
            row.id.equals(input.paymentMethodId!) &
            row.isArchived.equals(false) &
            row.isActive.equals(true),
      )).getSingleOrNull();
      if (method == null) {
        throw RecordNotFoundException(
          'Active payment method ${input.paymentMethodId} was not found.',
        );
      }
      if (method.accountId != null &&
          input.accountId != method.accountId &&
          input.sourceAccountId != method.accountId &&
          input.destinationAccountId != method.accountId) {
        throw const ValidationException(
          'Payment method is assigned to a different account.',
        );
      }
    }
  }

  @override
  Future<void> deleteTransaction(String id) async {
    final updated =
        await (database.update(database.transactions)..where(
              (row) =>
                  row.id.equals(id) &
                  row.deletedAt.isNull() &
                  row.verification.equals('confirmed'),
            ))
            .write(
              TransactionsCompanion(
                deletedAt: Value(_utcNow()),
                updatedAt: Value(_utcNow()),
              ),
            );
    if (updated == 0) {
      throw RecordNotFoundException('Transaction $id was not found.');
    }
  }

  Future<List<Transaction>> _successfulEntries(PeriodRange period) async {
    final start = _dateKey(period.startDate);
    final end = _dateKey(period.endDate);
    return (database.select(database.transactions)..where(
          (row) =>
              row.deletedAt.isNull() &
              row.verification.equals('confirmed') &
              row.status.equals(enumValue(TransactionStatus.successful)) &
              row.localDateKey.isBiggerOrEqualValue(start) &
              row.localDateKey.isSmallerOrEqualValue(end),
        ))
        .get();
  }

  Future<FinanceReport> _buildReport(PeriodRange period) async {
    final transactions = await _successfulEntries(period);
    final currencyCode = await getSetting<String>('default_currency') ?? 'INR';
    var income = 0;
    var expenses = 0;
    final byCategory = <String?, int>{};
    final dayTotals = <String, int>{};
    var fixedExpenses = 0;
    var variableExpenses = 0;

    for (final transaction in transactions) {
      if (transaction.currencyCode != currencyCode) continue;
      if (transaction.kind == enumValue(LedgerKind.income)) {
        income += transaction.amountMinor;
      } else if (transaction.kind == enumValue(LedgerKind.expense)) {
        expenses += transaction.amountMinor;
        if (transaction.expenseBehavior == enumValue(ExpenseBehavior.fixed)) {
          fixedExpenses += transaction.amountMinor;
        } else if (transaction.expenseBehavior ==
            enumValue(ExpenseBehavior.variable)) {
          variableExpenses += transaction.amountMinor;
        }
        byCategory.update(
          transaction.categoryId,
          (value) => value + transaction.amountMinor,
          ifAbsent: () => transaction.amountMinor,
        );
        dayTotals.update(
          transaction.localDateKey,
          (value) => value + transaction.amountMinor,
          ifAbsent: () => transaction.amountMinor,
        );
      }
    }

    final categoryRows = await database.select(database.categories).get();
    final categoryNames = <String, String>{
      for (final category in categoryRows) category.id: category.name,
    };
    final categoryTotals =
        byCategory.entries
            .map(
              (entry) => CategoryTotal(
                categoryId: entry.key,
                categoryName: entry.key == null
                    ? 'Uncategorized'
                    : categoryNames[entry.key] ?? 'Archived category',
                amountMinor: entry.value,
              ),
            )
            .toList()
          ..sort((a, b) => b.amountMinor.compareTo(a.amountMinor));
    final dailyTrend =
        dayTotals.entries
            .map(
              (entry) =>
                  DailyTotal(localDateKey: entry.key, amountMinor: entry.value),
            )
            .toList()
          ..sort((a, b) => a.localDateKey.compareTo(b.localDateKey));
    final highestDay = dailyTrend.isEmpty
        ? null
        : dailyTrend.reduce(
            (current, next) =>
                next.amountMinor > current.amountMinor ? next : current,
          );
    final days = period.endDate.difference(period.startDate).inDays.abs() + 1;
    return FinanceReport(
      period: period,
      currencyCode: currencyCode,
      incomeMinor: income,
      expenseMinor: expenses,
      netMinor: income - expenses,
      averageDailySpendMinor: expenses ~/ days,
      highestSpendingDay: highestDay,
      categoryTotals: categoryTotals,
      dailyTrend: dailyTrend,
      fixedExpenseMinor: fixedExpenses,
      variableExpenseMinor: variableExpenses,
    );
  }

  @override
  Future<FinanceReport> getReport(PeriodRange period) => _buildReport(period);

  @override
  Future<PeriodComparison> comparePeriods(
    PeriodRange periodA,
    PeriodRange periodB,
  ) async => PeriodComparison(
    periodA: await _buildReport(periodA),
    periodB: await _buildReport(periodB),
  );

  @override
  Future<DashboardSummary> getDashboard(PeriodRange period) async {
    final report = await _buildReport(period);
    final currencyCode = report.currencyCode;
    final candidates =
        await (database.select(database.detectedTransactionCandidates)..where(
              (row) =>
                  row.candidateState.equals('needs_review') |
                  row.candidateState.equals('duplicate_review_pending'),
            ))
            .get();
    final contributions =
        await (database.select(database.savingsContributions)..where(
              (row) =>
                  row.occurredAt.isBiggerOrEqualValue(
                    DateTime.utc(
                      period.startDate.year,
                      period.startDate.month,
                      period.startDate.day,
                    ),
                  ) &
                  row.occurredAt.isSmallerOrEqualValue(
                    DateTime.utc(
                      period.endDate.year,
                      period.endDate.month,
                      period.endDate.day,
                      23,
                      59,
                      59,
                      999,
                    ),
                  ) &
          row.currencyCode.equals(currencyCode),
            ))
            .get();
    return DashboardSummary(
      period: period,
      currencyCode: currencyCode,
      incomeMinor: report.incomeMinor,
      expenseMinor: report.expenseMinor,
      netMinor: report.netMinor,
      accountBalances: await listAccounts(),
      openCandidateCount: candidates.length,
      savingsContributedMinor: contributions.fold<int>(
        0,
        (sum, contribution) => sum + contribution.amountMinor,
      ),
    );
  }

  @override
  Future<List<PeriodRange>> listAvailablePeriods(ReportPeriod period) async {
    final rows =
        await (database.select(database.transactions)..where(
              (row) =>
                  row.deletedAt.isNull() &
                  row.verification.equals('confirmed') &
                  row.status.equals(enumValue(TransactionStatus.successful)),
            ))
            .get();
    final keys =
        rows.map((row) => _periodKey(row.localDateKey, period)).toSet().toList()
          ..sort();
    return keys.map((key) => _rangeForPeriodKey(key, period)).toList();
  }

  String _periodKey(String dayKey, ReportPeriod period) {
    final date = DateTime.parse(dayKey);
    return switch (period) {
      ReportPeriod.daily => dayKey,
      ReportPeriod.weekly => _dateKey(
        date.subtract(Duration(days: date.weekday - DateTime.monday)),
      ),
      ReportPeriod.monthly =>
        '${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}',
      ReportPeriod.yearly => date.year.toString().padLeft(4, '0'),
    };
  }

  PeriodRange _rangeForPeriodKey(String key, ReportPeriod period) {
    final start = switch (period) {
      ReportPeriod.daily => DateTime.parse(key),
      ReportPeriod.weekly => DateTime.parse(key),
      ReportPeriod.monthly => DateTime(
        int.parse(key.substring(0, 4)),
        int.parse(key.substring(5, 7)),
      ),
      ReportPeriod.yearly => DateTime(int.parse(key)),
    };
    final end = switch (period) {
      ReportPeriod.daily => start,
      ReportPeriod.weekly => start.add(const Duration(days: 6)),
      ReportPeriod.monthly => DateTime(start.year, start.month + 1, 0),
      ReportPeriod.yearly => DateTime(start.year, 12, 31),
    };
    return PeriodRange(startDate: start, endDate: end);
  }

  @override
  Future<String> createCategory(CategoryInput input) async {
    final name = input.name.trim();
    if (name.isEmpty) {
      throw const ValidationException('Category name is required.');
    }
    final now = _utcNow();
    final id = _newId();
    await database
        .into(database.categories)
        .insert(
          CategoriesCompanion.insert(
            id: id,
            name: name,
            kind: Value(enumValue(input.kind)),
            parentCategoryId: Value(input.parentCategoryId),
            createdAt: now,
            updatedAt: now,
          ),
        );
    return id;
  }

  @override
  Future<void> updateCategory(String id, CategoryInput input) async {
    final updated =
        await (database.update(
              database.categories,
            )..where((row) => row.id.equals(id) & row.isArchived.equals(false)))
            .write(
              CategoriesCompanion(
                name: Value(input.name.trim()),
                kind: Value(enumValue(input.kind)),
                parentCategoryId: Value(input.parentCategoryId),
                updatedAt: Value(_utcNow()),
              ),
            );
    if (updated == 0) {
      throw RecordNotFoundException('Category $id was not found.');
    }
  }

  @override
  Future<void> archiveCategory(String id) async {
    final updated =
        await (database.update(
              database.categories,
            )..where((row) => row.id.equals(id) & row.isArchived.equals(false)))
            .write(
              CategoriesCompanion(
                isArchived: const Value(true),
                updatedAt: Value(_utcNow()),
              ),
            );
    if (updated == 0) {
      throw RecordNotFoundException('Category $id was not found.');
    }
  }

  @override
  Future<List<CategoryRecord>> listCategories({
    LedgerKind? kind,
    String? parentCategoryId,
    bool includeArchived = false,
  }) async {
    final query = database.select(database.categories);
    if (kind != null) query.where((row) => row.kind.equals(enumValue(kind)));
    if (parentCategoryId != null) {
      query.where((row) => row.parentCategoryId.equals(parentCategoryId));
    }
    if (!includeArchived) query.where((row) => row.isArchived.equals(false));
    final rows = await query.get();
    return rows
        .map(
          (row) => CategoryRecord(
            id: row.id,
            name: row.name,
            kind: enumFromValue(LedgerKind.values, row.kind),
            isBuiltin: row.isBuiltin,
            isArchived: row.isArchived,
            parentCategoryId: row.parentCategoryId,
          ),
        )
        .toList(growable: false);
  }

  @override
  Future<String> createSubcategory({
    required String categoryId,
    required String name,
  }) async {
    final category =
        await (database.select(database.categories)..where(
              (row) => row.id.equals(categoryId) & row.isArchived.equals(false),
            ))
            .getSingleOrNull();
    if (category == null) {
      throw RecordNotFoundException(
        'Active parent category $categoryId was not found.',
      );
    }
    if (name.trim().isEmpty) {
      throw const ValidationException('Subcategory name is required.');
    }
    final id = _newId();
    final now = _utcNow();
    await database
        .into(database.subcategories)
        .insert(
          SubcategoriesCompanion.insert(
            id: id,
            categoryId: categoryId,
            name: name.trim(),
            createdAt: now,
            updatedAt: now,
          ),
        );
    return id;
  }

  @override
  Future<void> archiveSubcategory(String id) async {
    final updated =
        await (database.update(
              database.subcategories,
            )..where((row) => row.id.equals(id) & row.isArchived.equals(false)))
            .write(
              SubcategoriesCompanion(
                isArchived: const Value(true),
                updatedAt: Value(_utcNow()),
              ),
            );
    if (updated == 0) {
      throw RecordNotFoundException('Subcategory $id was not found.');
    }
  }

  @override
  Future<List<SubcategoryRecord>> listSubcategories(
    String categoryId, {
    bool includeArchived = false,
  }) async {
    final query = database.select(database.subcategories)
      ..where((row) => row.categoryId.equals(categoryId));
    if (!includeArchived) query.where((row) => row.isArchived.equals(false));
    final rows = await query.get();
    return rows
        .map(
          (row) => SubcategoryRecord(
            id: row.id,
            categoryId: row.categoryId,
            name: row.name,
            isArchived: row.isArchived,
          ),
        )
        .toList(growable: false);
  }

  @override
  Future<String> createPaymentMethod(PaymentMethodInput input) async {
    final name = input.name.trim();
    if (name.isEmpty) {
      throw const ValidationException('Payment method name is required.');
    }
    if (input.accountId != null) {
      final account = await (database.select(
        database.accounts,
      )..where(
        (row) =>
            row.id.equals(input.accountId!) & row.isArchived.equals(false),
      )).getSingleOrNull();
      if (account == null) {
        throw RecordNotFoundException(
          'Active account ${input.accountId} was not found.',
        );
      }
    }
    final now = _utcNow();
    final id = _newId();
    await database
        .into(database.paymentMethods)
        .insert(
          PaymentMethodsCompanion.insert(
            id: id,
            name: name,
            accountId: Value(input.accountId),
            isActive: Value(input.isActive),
            createdAt: now,
            updatedAt: now,
          ),
        );
    return id;
  }

  @override
  Future<void> updatePaymentMethod(String id, PaymentMethodInput input) async {
    if (input.name.trim().isEmpty) {
      throw const ValidationException('Payment method name is required.');
    }
    if (input.accountId != null) {
      final account = await (database.select(
        database.accounts,
      )..where(
        (row) =>
            row.id.equals(input.accountId!) & row.isArchived.equals(false),
      )).getSingleOrNull();
      if (account == null) {
        throw RecordNotFoundException(
          'Active account ${input.accountId} was not found.',
        );
      }
    }
    final updated =
        await (database.update(
              database.paymentMethods,
            )..where((row) => row.id.equals(id) & row.isArchived.equals(false)))
            .write(
              PaymentMethodsCompanion(
                name: Value(input.name.trim()),
                accountId: Value(input.accountId),
                isActive: Value(input.isActive),
                updatedAt: Value(_utcNow()),
              ),
            );
    if (updated == 0) {
      throw RecordNotFoundException('Payment method $id was not found.');
    }
  }

  @override
  Future<void> archivePaymentMethod(String id) async {
    final updated =
        await (database.update(
              database.paymentMethods,
            )..where((row) => row.id.equals(id) & row.isArchived.equals(false)))
            .write(
              PaymentMethodsCompanion(
                isArchived: const Value(true),
                isActive: const Value(false),
                updatedAt: Value(_utcNow()),
              ),
            );
    if (updated == 0) {
      throw RecordNotFoundException('Payment method $id was not found.');
    }
  }

  @override
  Future<List<PaymentMethodRecord>> listPaymentMethods({
    bool includeArchived = false,
  }) async {
    final query = database.select(database.paymentMethods);
    if (!includeArchived) query.where((row) => row.isArchived.equals(false));
    final rows = await query.get();
    return rows
        .map(
          (row) => PaymentMethodRecord(
            id: row.id,
            name: row.name,
            accountId: row.accountId,
            isActive: row.isActive,
            isArchived: row.isArchived,
          ),
        )
        .toList(growable: false);
  }

  BudgetRecord _toBudgetRecord(Budget row) => BudgetRecord(
    id: row.id,
    periodType: enumFromValue(BudgetPeriod.values, row.periodType),
    periodKey: row.periodKey,
    mode: enumFromValue(BudgetMode.values, row.budgetMode),
    currencyCode: row.currencyCode,
    isActive: row.isActive,
    isArchived: row.isArchived,
    categoryId: row.categoryId,
    planId: row.planId,
    name: row.name,
    allocationGroup: row.allocationGroup == null
        ? null
        : enumFromValue(AllocationGroup.values, row.allocationGroup!),
    allocationPercentage: row.allocationPercentage,
    limitMinor: row.limitMinor,
    incomeBaseMode: row.incomeBaseMode == null
        ? null
        : enumFromValue(IncomeBaseMode.values, row.incomeBaseMode!),
    incomeBaseAmountMinor: row.incomeBaseAmountMinor,
    alertThresholdMinor: row.alertThresholdMinor,
  );

  void _validatePeriod(BudgetPeriod period, String key) {
    final trimmed = key.trim();
    if (trimmed.isEmpty || trimmed.length > 64) {
      throw const ValidationException('Budget period key is invalid.');
    }
    if (period == BudgetPeriod.daily || period == BudgetPeriod.weekly) {
      _validateDateKey(trimmed);
    }
    if (period == BudgetPeriod.monthly &&
        (!RegExp(r'^\d{4}-\d{2}$').hasMatch(trimmed) ||
            int.parse(trimmed.substring(5, 7)) < 1 ||
            int.parse(trimmed.substring(5, 7)) > 12)) {
      throw const ValidationException('Monthly period key must use YYYY-MM.');
    }
    if (period == BudgetPeriod.yearly &&
        !RegExp(r'^\d{4}$').hasMatch(trimmed)) {
      throw const ValidationException('Yearly period key must use YYYY.');
    }
    if (period == BudgetPeriod.custom) {
      _budgetDateRange(period, trimmed);
    }
  }

  @override
  Future<String> createFixedBudget(BudgetInput input) async {
    _validatePeriod(input.periodType, input.periodKey);
    if (input.mode != BudgetMode.fixedAmount ||
        input.categoryId == null ||
        input.limitMinor == null ||
        input.limitMinor! <= 0 ||
        input.allocationPercentage != null ||
        input.planId != null ||
        input.allocationGroup != null) {
      throw const ValidationException(
        'Fixed budgets require a category and positive limit only.',
      );
    }
    if (!RegExp(r'^[A-Z]{3}$').hasMatch(input.currencyCode)) {
      throw const ValidationException('Currency must be an ISO 4217 code.');
    }
    final category =
        await (database.select(database.categories)..where(
              (row) =>
                  row.id.equals(input.categoryId!) &
                  row.isArchived.equals(false) &
                  row.kind.equals(enumValue(LedgerKind.expense)),
            ))
            .getSingleOrNull();
    if (category == null) {
      throw RecordNotFoundException(
        'Active expense category ${input.categoryId} was not found.',
      );
    }
    final now = _utcNow();
    final id = _newId();
    await database
        .into(database.budgets)
        .insert(
          BudgetsCompanion.insert(
            id: id,
            periodType: enumValue(input.periodType),
            periodKey: input.periodKey,
            categoryId: Value(input.categoryId),
            name: Value(input.name?.trim()),
            budgetMode: enumValue(BudgetMode.fixedAmount),
            limitMinor: Value(input.limitMinor),
            currencyCode: Value(input.currencyCode),
            alertThresholdMinor: Value(input.alertThresholdMinor),
            createdAt: now,
            updatedAt: now,
          ),
        );
    return id;
  }

  @override
  Future<void> saveAllocationPlan(AllocationPlanInput input) async {
    _validatePeriod(input.periodType, input.periodKey);
    if (input.planId.trim().isEmpty || input.allocations.isEmpty) {
      throw const ValidationException(
        'Allocation plans require an ID and at least one allocation.',
      );
    }
    if (input.allocations.any(
      (allocation) => allocation.percentage < 1 || allocation.percentage > 100,
    )) {
      throw const ValidationException(
        'Allocation percentages must be greater than 0 and at most 100.',
      );
    }
    if (input.allocations.fold<int>(
          0,
          (sum, allocation) => sum + allocation.percentage,
        ) !=
        100) {
      throw const ValidationException(
        'Active allocations for a plan and period must total exactly 100%.',
      );
    }
    if (input.incomeBaseMode == IncomeBaseMode.custom) {
      if (input.customIncomeBaseMinor == null ||
          input.customIncomeBaseMinor! < 0) {
        throw const ValidationException(
          'Custom income bases require a non-negative paise amount.',
        );
      }
    } else if (input.customIncomeBaseMinor != null) {
      throw const ValidationException(
        'A custom income-base amount conflicts with the selected base mode.',
      );
    }
    final standardGroups = input.allocations
        .where((allocation) => allocation.group != AllocationGroup.custom)
        .map((allocation) => allocation.group)
        .toList();
    if (standardGroups.toSet().length != standardGroups.length ||
        input.allocations.any(
          (allocation) =>
              allocation.group == AllocationGroup.custom &&
              (allocation.name == null || allocation.name!.trim().isEmpty),
        )) {
      throw const ValidationException(
        'Allocation groups must be unique; custom groups require a name.',
      );
    }
    final customNames = input.allocations
        .where((allocation) => allocation.group == AllocationGroup.custom)
        .map((allocation) => allocation.name!.trim().toLowerCase())
        .toList();
    if (customNames.toSet().length != customNames.length) {
      throw const ValidationException(
        'Custom allocation group names must be unique.',
      );
    }
    final now = _utcNow();
    final currency = await getSetting<String>('default_currency') ?? 'INR';
    await database.transaction(() async {
      await (database.update(database.budgets)..where(
            (budget) =>
                budget.planId.equals(input.planId) &
                budget.periodType.equals(enumValue(input.periodType)) &
                budget.periodKey.equals(input.periodKey) &
                budget.isArchived.equals(false),
          ))
          .write(
            BudgetsCompanion(
              isActive: const Value(false),
              isArchived: const Value(true),
              updatedAt: Value(now),
            ),
          );
      for (final allocation in input.allocations) {
        await database
            .into(database.budgets)
            .insert(
              BudgetsCompanion.insert(
                id: _newId(),
                periodType: enumValue(input.periodType),
                periodKey: input.periodKey,
                planId: Value(input.planId.trim()),
                name: Value(allocation.name?.trim()),
                budgetMode: enumValue(BudgetMode.allocationPercentage),
                allocationGroup: Value(enumValue(allocation.group)),
                allocationPercentage: Value(allocation.percentage),
                currencyCode: Value(currency),
                incomeBaseMode: Value(enumValue(input.incomeBaseMode)),
                incomeBaseAmountMinor: Value(input.customIncomeBaseMinor),
                createdAt: now,
                updatedAt: now,
              ),
            );
      }
    });
  }

  @override
  Future<List<BudgetRecord>> listBudgets({
    required BudgetPeriod periodType,
    required String periodKey,
    bool includeArchived = false,
  }) async {
    final query = database.select(database.budgets)
      ..where(
        (row) =>
            row.periodType.equals(enumValue(periodType)) &
            row.periodKey.equals(periodKey),
      );
    if (!includeArchived) {
      query.where(
        (row) => row.isArchived.equals(false) & row.isActive.equals(true),
      );
    }
    final rows = await query.get();
    return rows.map(_toBudgetRecord).toList(growable: false);
  }

  @override
  Future<int> getBudgetActualMinor(String budgetId) async {
    final budget = await (database.select(
      database.budgets,
    )..where((row) => row.id.equals(budgetId))).getSingleOrNull();
    if (budget == null) {
      throw RecordNotFoundException('Budget $budgetId was not found.');
    }
    final range = _budgetDateRange(
      enumFromValue(BudgetPeriod.values, budget.periodType),
      budget.periodKey,
    );
    final query = database.select(database.transactions)
      ..where(
        (transaction) =>
            transaction.deletedAt.isNull() &
            transaction.verification.equals('confirmed') &
            transaction.status.equals(enumValue(TransactionStatus.successful)) &
            transaction.kind.equals(enumValue(LedgerKind.expense)) &
            transaction.localDateKey.isBiggerOrEqualValue(
              _dateKey(range.start),
            ) &
            transaction.localDateKey.isSmallerOrEqualValue(_dateKey(range.end)),
      );
    if (budget.budgetMode == enumValue(BudgetMode.fixedAmount)) {
      final categoryId = budget.categoryId;
      if (categoryId == null) {
        throw const BackendException('Fixed budget has no category.');
      }
      query.where((transaction) => transaction.categoryId.equals(categoryId));
    } else {
      final group = budget.allocationGroup;
      if (group == null) {
        throw const BackendException(
          'Allocation budget has no allocation group.',
        );
      }
      query.where((transaction) => transaction.allocationGroup.equals(group));
      if (group == enumValue(AllocationGroup.custom)) {
        final name = budget.name;
        if (name == null || name.trim().isEmpty) {
          throw const BackendException(
            'Custom allocation budget has no group name.',
          );
        }
        query.where(
          (transaction) =>
              transaction.allocationGroupName.equals(name.trim()),
        );
      }
    }
    query.where(
      (transaction) => transaction.currencyCode.equals(budget.currencyCode),
    );
    final rows = await query.get();
    return rows.fold<int>(0, (sum, row) => sum + row.amountMinor);
  }

  @override
  Future<int> getBudgetAllocationAmountMinor(String budgetId) async {
    final budget = await (database.select(
      database.budgets,
    )..where((row) => row.id.equals(budgetId))).getSingleOrNull();
    if (budget == null) {
      throw RecordNotFoundException('Budget $budgetId was not found.');
    }
    if (budget.budgetMode != enumValue(BudgetMode.allocationPercentage) ||
        budget.allocationPercentage == null) {
      throw const ValidationException(
        'Only percentage allocation budgets have an allocation target.',
      );
    }
    final range = _budgetDateRange(
      enumFromValue(BudgetPeriod.values, budget.periodType),
      budget.periodKey,
    );
    final entries = await _successfulEntries(
      PeriodRange(startDate: range.start, endDate: range.end),
    );
    var income = 0;
    var expenses = 0;
    for (final entry in entries) {
      if (entry.currencyCode != budget.currencyCode) continue;
      if (entry.kind == enumValue(LedgerKind.income)) {
        income += entry.amountMinor;
      } else if (entry.kind == enumValue(LedgerKind.expense)) {
        expenses += entry.amountMinor;
      }
    }
    final incomeBaseMode = enumFromValue(
      IncomeBaseMode.values,
      budget.incomeBaseMode ?? '',
    );
    final incomeBase = switch (incomeBaseMode) {
      IncomeBaseMode.allIncome || IncomeBaseMode.confirmedIncomeOnly => income,
      IncomeBaseMode.netMonthlyAmount => income - expenses,
      IncomeBaseMode.custom => budget.incomeBaseAmountMinor ??
          (throw const BackendException(
            'Custom allocation budget has no stored base amount.',
          )),
    };
    if (incomeBase < 0) {
      throw const ValidationException(
        'Income base is negative for this allocation period.',
      );
    }
    final percentage = budget.allocationPercentage!;
    return (incomeBase ~/ 100) * percentage +
        ((incomeBase % 100) * percentage ~/ 100);
  }

  ({DateTime start, DateTime end}) _budgetDateRange(
    BudgetPeriod period,
    String key,
  ) {
    if (period == BudgetPeriod.custom) {
      final parts = key.split('..');
      if (parts.length != 2 ||
          DateTime.tryParse(parts[0]) == null ||
          DateTime.tryParse(parts[1]) == null) {
        throw const ValidationException(
          'Custom budget periods must use YYYY-MM-DD..YYYY-MM-DD.',
        );
      }
      final start = DateTime.parse(parts[0]);
      final end = DateTime.parse(parts[1]);
      if (end.isBefore(start)) {
        throw const ValidationException(
          'Custom period end precedes its start.',
        );
      }
      return (start: start, end: end);
    }
    if (period == BudgetPeriod.daily) {
      final date = DateTime.parse(key);
      return (start: date, end: date);
    }
    if (period == BudgetPeriod.monthly) {
      final parts = key.split('-');
      final start = DateTime(int.parse(parts[0]), int.parse(parts[1]));
      return (start: start, end: DateTime(start.year, start.month + 1, 0));
    }
    if (period == BudgetPeriod.yearly) {
      final year = int.tryParse(key);
      if (year == null) {
        throw const ValidationException('Yearly period key must use YYYY.');
      }
      return (start: DateTime(year), end: DateTime(year, 12, 31));
    }
    final start = DateTime.tryParse(key);
    if (start == null) {
      throw const ValidationException('Weekly period key must be a date.');
    }
    return (start: start, end: start.add(const Duration(days: 6)));
  }

  @override
  Future<void> archiveBudget(String id) async {
    final updated =
        await (database.update(
              database.budgets,
            )..where((row) => row.id.equals(id) & row.isArchived.equals(false)))
            .write(
              BudgetsCompanion(
                isActive: const Value(false),
                isArchived: const Value(true),
                updatedAt: Value(_utcNow()),
              ),
            );
    if (updated == 0) {
      throw RecordNotFoundException('Budget $id was not found.');
    }
  }

  @override
  Future<String> createSavingsGoal(SavingsGoalInput input) async {
    if (input.name.trim().isEmpty || input.targetMinor <= 0) {
      throw const ValidationException(
        'Savings goal name and target are required.',
      );
    }
    if (!RegExp(r'^[A-Z]{3}$').hasMatch(input.currencyCode)) {
      throw const ValidationException('Currency must be an ISO 4217 code.');
    }
    final now = _utcNow();
    final id = _newId();
    await database
        .into(database.savingsGoals)
        .insert(
          SavingsGoalsCompanion.insert(
            id: id,
            name: input.name.trim(),
            targetMinor: input.targetMinor,
            currencyCode: Value(input.currencyCode),
            deadlineAt: Value(input.deadline?.toUtc()),
            accountId: Value(input.accountId),
            createdAt: now,
            updatedAt: now,
          ),
        );
    return id;
  }

  @override
  Future<void> archiveSavingsGoal(String id) async {
    final updated =
        await (database.update(database.savingsGoals)
              ..where((row) => row.id.equals(id) & row.status.equals('active')))
            .write(
              SavingsGoalsCompanion(
                status: const Value('archived'),
                updatedAt: Value(_utcNow()),
              ),
            );
    if (updated == 0) {
      throw RecordNotFoundException('Active savings goal $id was not found.');
    }
  }

  @override
  Future<List<SavingsGoalRecord>> listSavingsGoals({
    bool includeArchived = false,
  }) async {
    final query = database.select(database.savingsGoals);
    if (!includeArchived) query.where((row) => row.status.equals('active'));
    final rows = await query.get();
    final goals = <SavingsGoalRecord>[];
    for (final row in rows) {
      final contributions = await (database.select(
        database.savingsContributions,
      )..where((contribution) => contribution.goalId.equals(row.id))).get();
      goals.add(
        SavingsGoalRecord(
          id: row.id,
          name: row.name,
          targetMinor: row.targetMinor,
          currencyCode: row.currencyCode,
          status: row.status,
          contributedMinor: contributions.fold<int>(
            0,
            (sum, contribution) => sum + contribution.amountMinor,
          ),
          deadline: row.deadlineAt?.toUtc(),
          accountId: row.accountId,
        ),
      );
    }
    return goals;
  }

  @override
  Future<String> recordSavingsContribution(
    SavingsContributionInput input,
  ) async {
    _validateMoney(input.amountMinor, input.currencyCode);
    final goal =
        await (database.select(database.savingsGoals)..where(
              (row) =>
                  row.id.equals(input.goalId) & row.status.equals('active'),
            ))
            .getSingleOrNull();
    if (goal == null) {
      throw RecordNotFoundException(
        'Active savings goal ${input.goalId} was not found.',
      );
    }
    if (goal.currencyCode != input.currencyCode) {
      throw const ValidationException(
        'Savings contribution and goal currencies must match.',
      );
    }
    if (input.transactionId != null) {
      final transaction =
          await (database.select(database.transactions)..where(
                (row) =>
                    row.id.equals(input.transactionId!) &
                    row.deletedAt.isNull() &
                    row.verification.equals('confirmed'),
              ))
              .getSingleOrNull();
      if (transaction == null ||
          transaction.currencyCode != input.currencyCode) {
        throw const ValidationException(
          'Linked contribution transaction is invalid or has a different currency.',
        );
      }
    }
    final id = _newId();
    await database
        .into(database.savingsContributions)
        .insert(
          SavingsContributionsCompanion.insert(
            id: id,
            goalId: input.goalId,
            transactionId: Value(input.transactionId),
            amountMinor: input.amountMinor,
            currencyCode: Value(input.currencyCode),
            occurredAt: input.occurredAt.toUtc(),
            note: Value(input.note?.trim()),
            createdAt: _utcNow(),
          ),
        );
    return id;
  }

  @override
  Future<List<SavingsContributionRecord>> listSavingsContributions(
    String goalId,
  ) async {
    final rows =
        await (database.select(database.savingsContributions)
              ..where((row) => row.goalId.equals(goalId))
              ..orderBy([(row) => OrderingTerm.desc(row.occurredAt)]))
            .get();
    return rows
        .map(
          (row) => SavingsContributionRecord(
            id: row.id,
            goalId: row.goalId,
            amountMinor: row.amountMinor,
            currencyCode: row.currencyCode,
            occurredAt: row.occurredAt.toUtc(),
            transactionId: row.transactionId,
            note: row.note,
          ),
        )
        .toList(growable: false);
  }

  Map<String, Object?> _transactionToJson(TransactionInput input) => {
    'kind': enumValue(input.kind),
    'amountMinor': input.amountMinor,
    'currencyCode': input.currencyCode,
    'occurredAtUtc': input.occurredAtUtc.toUtc().toIso8601String(),
    'localDateKey': input.localDateKey,
    'status': enumValue(input.status),
    'accountId': input.accountId,
    'sourceAccountId': input.sourceAccountId,
    'destinationAccountId': input.destinationAccountId,
    'categoryId': input.categoryId,
    'subcategoryId': input.subcategoryId,
    'paymentMethodId': input.paymentMethodId,
    'description': input.description,
    'externalReference': input.externalReference,
    'occurredLocalOffsetMinutes': input.occurredLocalOffsetMinutes,
    'occurredTimezoneId': input.occurredTimezoneId,
    'source': enumValue(input.source),
    'expenseBehavior': input.expenseBehavior == null
        ? null
        : enumValue(input.expenseBehavior!),
    'allocationGroup': input.allocationGroup == null
        ? null
        : enumValue(input.allocationGroup!),
    'allocationGroupName': input.allocationGroupName,
  };

  TransactionInput _transactionFromJson(String json) {
    final map = jsonDecode(json) as Map<String, dynamic>;
    final expenseBehavior = map['expenseBehavior'] as String?;
    final allocationGroup = map['allocationGroup'] as String?;
    return TransactionInput(
      kind: enumFromValue(LedgerKind.values, map['kind'] as String),
      amountMinor: map['amountMinor'] as int,
      currencyCode: map['currencyCode'] as String,
      occurredAtUtc: DateTime.parse(map['occurredAtUtc'] as String).toUtc(),
      localDateKey: map['localDateKey'] as String,
      status: enumFromValue(TransactionStatus.values, map['status'] as String),
      accountId: map['accountId'] as String?,
      sourceAccountId: map['sourceAccountId'] as String?,
      destinationAccountId: map['destinationAccountId'] as String?,
      categoryId: map['categoryId'] as String?,
      subcategoryId: map['subcategoryId'] as String?,
      paymentMethodId: map['paymentMethodId'] as String?,
      description: map['description'] as String?,
      externalReference: map['externalReference'] as String?,
      occurredLocalOffsetMinutes: map['occurredLocalOffsetMinutes'] as int?,
      occurredTimezoneId: map['occurredTimezoneId'] as String?,
      source: enumFromValue(TransactionSource.values, map['source'] as String),
      expenseBehavior: expenseBehavior == null
          ? null
          : enumFromValue(ExpenseBehavior.values, expenseBehavior),
      allocationGroup: allocationGroup == null
          ? null
          : enumFromValue(AllocationGroup.values, allocationGroup),
      allocationGroupName: map['allocationGroupName'] as String?,
    );
  }

  @override
  Future<String> createRecurringPlan(RecurringPlanInput input) async {
    if (input.name.trim().isEmpty ||
        input.nextDueAt.isBefore(input.startAt) ||
        (input.endAt != null && input.endAt!.isBefore(input.startAt))) {
      throw const ValidationException(
        'Recurring plan dates or name are invalid.',
      );
    }
    _validateTransactionInput(input.template);
    final id = _newId();
    final now = _utcNow();
    await database
        .into(database.recurringPlans)
        .insert(
          RecurringPlansCompanion.insert(
            id: id,
            name: input.name.trim(),
            cadence: enumValue(input.cadence),
            startAt: input.startAt.toUtc(),
            nextDueAt: input.nextDueAt.toUtc(),
            endAt: Value(input.endAt?.toUtc()),
            templateKind: enumValue(input.template.kind),
            templateDataJson: jsonEncode(_transactionToJson(input.template)),
            createdAt: now,
            updatedAt: now,
          ),
        );
    return id;
  }

  @override
  Future<void> updateRecurringPlan(String id, RecurringPlanInput input) async {
    if (input.name.trim().isEmpty ||
        input.nextDueAt.isBefore(input.startAt) ||
        (input.endAt != null && input.endAt!.isBefore(input.startAt))) {
      throw const ValidationException(
        'Recurring plan dates or name are invalid.',
      );
    }
    _validateTransactionInput(input.template);
    final updated =
        await (database.update(database.recurringPlans)..where(
              (row) =>
                  row.id.equals(id) &
                  row.status.isIn(<String>['active', 'paused']),
            ))
            .write(
              RecurringPlansCompanion(
                name: Value(input.name.trim()),
                cadence: Value(enumValue(input.cadence)),
                startAt: Value(input.startAt.toUtc()),
                nextDueAt: Value(input.nextDueAt.toUtc()),
                endAt: Value(input.endAt?.toUtc()),
                templateKind: Value(enumValue(input.template.kind)),
                templateDataJson: Value(
                  jsonEncode(_transactionToJson(input.template)),
                ),
                updatedAt: Value(_utcNow()),
              ),
            );
    if (updated == 0) {
      throw RecordNotFoundException(
        'Editable recurring plan $id was not found.',
      );
    }
  }

  @override
  Future<void> setRecurringPlanStatus(String id, RecurringStatus status) async {
    if (status == RecurringStatus.completed ||
        status == RecurringStatus.archived) {
      throw const ValidationException(
        'Use archive for terminal recurring-plan states.',
      );
    }
    final updated =
        await (database.update(database.recurringPlans)..where(
              (row) =>
                  row.id.equals(id) &
                  row.status.isIn(<String>['active', 'paused']),
            ))
            .write(
              RecurringPlansCompanion(
                status: Value(enumValue(status)),
                updatedAt: Value(_utcNow()),
              ),
            );
    if (updated == 0) {
      throw RecordNotFoundException('Recurring plan $id was not found.');
    }
  }

  @override
  Future<List<RecurringPlanRecord>> listRecurringPlans({
    bool includeArchived = false,
  }) async {
    final query = database.select(database.recurringPlans)
      ..orderBy([(row) => OrderingTerm.asc(row.nextDueAt)]);
    if (!includeArchived) {
      query.where((row) => row.status.isIn(<String>['active', 'paused']));
    }
    final rows = await query.get();
    return rows
        .map(
          (row) => RecurringPlanRecord(
            id: row.id,
            name: row.name,
            cadence: enumFromValue(RecurringCadence.values, row.cadence),
            startAt: row.startAt.toUtc(),
            nextDueAt: row.nextDueAt.toUtc(),
            endAt: row.endAt?.toUtc(),
            status: enumFromValue(RecurringStatus.values, row.status),
            template: _transactionFromJson(row.templateDataJson),
          ),
        )
        .toList(growable: false);
  }

  NormalizedCandidateInput _candidateInputFromRow(
    DetectedTransactionCandidate row,
  ) {
    final evidence = jsonDecode(row.statusEvidence) as Map<String, dynamic>;
    final source = enumFromValue(TransactionSource.values, row.source);
    return NormalizedCandidateInput(
      source: source,
      kind: enumFromValue(LedgerKind.values, row.normalizedKind),
      expenseBehavior: row.expenseBehavior == null
          ? null
          : enumFromValue(ExpenseBehavior.values, row.expenseBehavior!),
      allocationGroup: row.allocationGroup == null
          ? null
          : enumFromValue(AllocationGroup.values, row.allocationGroup!),
      allocationGroupName: row.allocationGroupName,
      amountMinor: row.amountMinor,
      currencyCode: row.currencyCode,
      occurredAtUtc: row.occurredAt.toUtc(),
      localDateKey: row.localDateKey,
      status: enumFromValue(
        TransactionStatus.values,
        evidence['status'] as String,
      ),
      accountId: row.accountId,
      sourceAccountId: row.sourceAccountId,
      destinationAccountId: row.destinationAccountId,
      categoryId: row.categoryId,
      paymentMethodId: row.paymentMethodId,
      description: row.description,
      externalReference: row.sourceReference,
      sourceApp: row.sourceApp,
      partyDetails: row.partyDetails,
      sourceContext: row.sourceContext,
      confidence: row.confidence,
      occurredLocalOffsetMinutes: row.occurredLocalOffsetMinutes,
      occurredTimezoneId: row.occurredTimezoneId,
    );
  }

  Future<CandidateReviewItem> _toCandidateReview(
    DetectedTransactionCandidate row,
  ) async {
    final links = await (database.select(
      database.candidateDuplicateLinks,
    )..where((link) => link.candidateId.equals(row.id))).get();
    return CandidateReviewItem(
      id: row.id,
      state: enumFromValue(CandidateState.values, row.candidateState),
      input: _candidateInputFromRow(row),
      matches: links
          .map(
            (link) => CandidateMatch(
              relatedId: link.relatedTransactionId ?? link.relatedCandidateId!,
              relatedType: link.relatedTransactionId == null
                  ? 'candidate'
                  : 'transaction',
              reason: link.fingerprintType,
              confidence: link.similarityScore,
            ),
          )
          .toList(growable: false),
    );
  }

  String _fingerprint(NormalizedCandidateInput input) {
    final canonical = jsonEncode(<Object?>[
      enumValue(input.kind),
      input.amountMinor,
      input.currencyCode,
      input.localDateKey,
      input.externalReference?.trim().toLowerCase(),
      input.sourceApp?.trim().toLowerCase(),
      input.accountId,
      input.sourceAccountId,
      input.destinationAccountId,
    ]);
    return sha256.convert(utf8.encode(canonical)).toString();
  }

  bool _sameDirection(LedgerKind left, LedgerKind right) => left == right;

  bool _sameAccounts({
    required String? firstAccount,
    required String? firstSource,
    required String? firstDestination,
    required String? secondAccount,
    required String? secondSource,
    required String? secondDestination,
  }) {
    if (firstAccount != null && secondAccount != null) {
      return firstAccount == secondAccount;
    }
    if (firstSource != null &&
        firstDestination != null &&
        secondSource != null &&
        secondDestination != null) {
      return firstSource == secondSource &&
          firstDestination == secondDestination;
    }
    return false;
  }

  @override
  Future<CandidateReviewItem> submitCandidate(
    NormalizedCandidateInput input,
  ) async {
    _validateMoney(input.amountMinor, input.currencyCode);
    _validateDateKey(input.localDateKey);
    if (input.source == TransactionSource.manualEntry) {
      throw const ValidationException(
        'Manual entries are transactions, not import candidates.',
      );
    }
    if (!input.occurredAtUtc.isUtc) {
      throw const ValidationException('Candidate instant must be UTC.');
    }
    _validateDateContext(
      occurredAtUtc: input.occurredAtUtc,
      localDateKey: input.localDateKey,
      localOffsetMinutes: input.occurredLocalOffsetMinutes,
      timezoneId: input.occurredTimezoneId,
    );
    if (input.confidence < 0 || input.confidence > 1) {
      throw const ValidationException('Candidate confidence must be 0 to 1.');
    }
    if (input.kind != LedgerKind.expense &&
        (input.expenseBehavior != null ||
            input.allocationGroup != null ||
            input.allocationGroupName != null)) {
      throw const ValidationException(
        'Expense classifications can only be set on expense candidates.',
      );
    }
    if (input.allocationGroup == AllocationGroup.custom &&
        (input.allocationGroupName == null ||
            input.allocationGroupName!.trim().isEmpty)) {
      throw const ValidationException(
        'Custom allocation groups require a group name.',
      );
    }
    if (input.kind == LedgerKind.transfer) {
      if (input.sourceAccountId == null ||
          input.destinationAccountId == null ||
          input.sourceAccountId == input.destinationAccountId ||
          input.accountId != null ||
          input.categoryId != null) {
        throw const ValidationException(
          'Candidate transfer account pair is invalid.',
        );
      }
    } else if (input.accountId == null) {
      throw const ValidationException('Candidate requires an account.');
    }
    final now = _utcNow();
    final candidateId = _newId();
    final matches = <({String id, String type, String reason, double score})>[];
    await database.transaction(() async {
      if (input.sourceAccountId != null ||
          input.destinationAccountId != null ||
          input.accountId != null) {
        await _validateAccountReferences(
          TransactionInput(
            kind: input.kind,
            amountMinor: input.amountMinor,
            currencyCode: input.currencyCode,
            occurredAtUtc: input.occurredAtUtc,
            localDateKey: input.localDateKey,
            status: input.status,
            accountId: input.accountId,
            sourceAccountId: input.sourceAccountId,
            destinationAccountId: input.destinationAccountId,
            categoryId: input.categoryId,
            subcategoryId: null,
            paymentMethodId: input.paymentMethodId,
            occurredLocalOffsetMinutes: input.occurredLocalOffsetMinutes,
            occurredTimezoneId: input.occurredTimezoneId,
            source: input.source,
            expenseBehavior: input.expenseBehavior,
            allocationGroup: input.allocationGroup,
            allocationGroupName: input.allocationGroupName,
          ),
        );
      }
      final transactions =
          await (database.select(database.transactions)..where(
              (row) =>
                  row.deletedAt.isNull() & row.verification.equals('confirmed'),
            ))
            .get();
    for (final transaction in transactions) {
      final txKind = enumFromValue(LedgerKind.values, transaction.kind);
      if (transaction.amountMinor != input.amountMinor ||
          transaction.currencyCode != input.currencyCode ||
          !_sameDirection(txKind, input.kind) ||
          transaction.occurredAt.difference(input.occurredAtUtc).abs() >
              defaultDuplicateWindow) {
        continue;
      }
      if (input.externalReference != null &&
          transaction.externalReference != null &&
          input.externalReference != transaction.externalReference) {
        continue;
      }
      final sameAccount = _sameAccounts(
        firstAccount: input.accountId,
        firstSource: input.sourceAccountId,
        firstDestination: input.destinationAccountId,
        secondAccount: transaction.accountId,
        secondSource: transaction.sourceAccountId,
        secondDestination: transaction.destinationAccountId,
      );
      final exactReference =
          input.externalReference != null &&
          input.externalReference == transaction.externalReference;
      final sameSource =
          enumFromValue(TransactionSource.values, transaction.source) ==
          input.source;
      if (exactReference || sameAccount || sameSource) {
        matches.add((
          id: transaction.id,
          type: 'transaction',
          reason: exactReference
              ? 'external_reference'
              : sameAccount
              ? 'amount_time_account'
              : 'amount_time_source',
          score: exactReference ? 0.99 : sameAccount ? 0.88 : 0.8,
        ));
      } else {
        matches.add((
          id: transaction.id,
          type: 'transaction',
          reason: 'amount_time_review',
          score: 0.6,
        ));
      }
    }
    final candidates =
        await (database.select(database.detectedTransactionCandidates)..where(
              (row) => row.candidateState.isIn(<String>[
                'needs_review',
                'duplicate_review_pending',
              ]),
            ))
            .get();
    for (final candidate in candidates) {
      final otherInput = _candidateInputFromRow(candidate);
      if (candidate.amountMinor != input.amountMinor ||
          candidate.currencyCode != input.currencyCode ||
          !_sameDirection(otherInput.kind, input.kind) ||
          candidate.occurredAt.difference(input.occurredAtUtc).abs() >
              defaultDuplicateWindow) {
        continue;
      }
      if (input.externalReference != null &&
          candidate.sourceReference != null &&
          input.externalReference != candidate.sourceReference) {
        continue;
      }
      final exactReference =
          input.externalReference != null &&
          input.externalReference == candidate.sourceReference;
      final sameAccount = _sameAccounts(
        firstAccount: input.accountId,
        firstSource: input.sourceAccountId,
        firstDestination: input.destinationAccountId,
        secondAccount: candidate.accountId,
        secondSource: candidate.sourceAccountId,
        secondDestination: candidate.destinationAccountId,
      );
      final sameSourceApp =
          input.sourceApp != null &&
          candidate.sourceApp != null &&
          input.sourceApp!.trim().toLowerCase() ==
              candidate.sourceApp!.trim().toLowerCase();
      final sameSourceContext =
          input.sourceContext != null &&
          candidate.sourceContext != null &&
          input.sourceContext!.trim().toLowerCase() ==
              candidate.sourceContext!.trim().toLowerCase();
      final sameSource = sameSourceApp || sameSourceContext;
      matches.add((
        id: candidate.id,
        type: 'candidate',
        reason: exactReference
            ? 'external_reference'
            : sameAccount
            ? 'amount_time_account'
            : sameSource
            ? 'amount_time_source'
            : 'amount_time_review',
        score: exactReference
            ? 0.99
            : sameAccount
            ? 0.84
            : sameSource
            ? 0.8
            : 0.55,
      ));
    }
      await database
          .into(database.detectedTransactionCandidates)
          .insert(
            DetectedTransactionCandidatesCompanion.insert(
              id: candidateId,
              source: enumValue(input.source),
              sourceApp: Value(input.sourceApp),
              sourceReference: Value(input.externalReference),
              normalizedKind: enumValue(input.kind),
              expenseBehavior: Value(
                input.expenseBehavior == null
                    ? null
                    : enumValue(input.expenseBehavior!),
              ),
              allocationGroup: Value(
                input.allocationGroup == null
                    ? null
                    : enumValue(input.allocationGroup!),
              ),
              allocationGroupName: Value(input.allocationGroupName),
              amountMinor: input.amountMinor,
              currencyCode: Value(input.currencyCode),
              occurredAt: input.occurredAtUtc.toUtc(),
              occurredLocalOffsetMinutes: Value(
                input.occurredLocalOffsetMinutes,
              ),
              occurredTimezoneId: Value(input.occurredTimezoneId),
              localDateKey: input.localDateKey,
              accountId: Value(input.accountId),
              sourceAccountId: Value(input.sourceAccountId),
              destinationAccountId: Value(input.destinationAccountId),
              categoryId: Value(input.categoryId),
              paymentMethodId: Value(input.paymentMethodId),
              description: Value(input.description),
              partyDetails: Value(input.partyDetails),
              sourceContext: Value(input.sourceContext),
              confidence: Value(input.confidence),
              statusEvidence: jsonEncode(<String, Object>{
                'status': enumValue(input.status),
              }),
              candidateState: Value(
                matches.isEmpty ? 'needs_review' : 'duplicate_review_pending',
              ),
              receivedAt: now,
              createdAt: now,
              updatedAt: now,
            ),
          );
      await database
          .into(database.candidateFingerprints)
          .insert(
            CandidateFingerprintsCompanion.insert(
              id: _newId(),
              candidateId: candidateId,
              fingerprintHash: _fingerprint(input),
              createdAt: now,
            ),
          );
      for (final match in matches) {
        await database
            .into(database.candidateDuplicateLinks)
            .insert(
              CandidateDuplicateLinksCompanion.insert(
                id: _newId(),
                candidateId: candidateId,
                relatedTransactionId: Value(
                  match.type == 'transaction' ? match.id : null,
                ),
                relatedCandidateId: Value(
                  match.type == 'candidate' ? match.id : null,
                ),
                fingerprintType: match.reason,
                similarityScore: match.score,
                createdAt: now,
              ),
            );
      }
    });
    final row = await (database.select(
      database.detectedTransactionCandidates,
    )..where((candidate) => candidate.id.equals(candidateId))).getSingle();
    return _toCandidateReview(row);
  }

  @override
  Future<List<CandidateReviewItem>> listCandidates({
    Set<CandidateState>? states,
  }) async {
    final query = database.select(database.detectedTransactionCandidates)
      ..orderBy([(row) => OrderingTerm.desc(row.receivedAt)]);
    if (states != null && states.isNotEmpty) {
      query.where(
        (row) => row.candidateState.isIn(
          states.map(enumValue).toList(growable: false),
        ),
      );
    }
    final rows = await query.get();
    final result = <CandidateReviewItem>[];
    for (final row in rows) {
      result.add(await _toCandidateReview(row));
    }
    return result;
  }

  @override
  Future<LedgerTransaction> confirmCandidate(
    String id, {
    TransactionInput? corrections,
  }) async {
    final candidate = await (database.select(
      database.detectedTransactionCandidates,
    )..where((row) => row.id.equals(id))).getSingleOrNull();
    if (candidate == null) {
      throw RecordNotFoundException('Candidate $id was not found.');
    }
    if (candidate.candidateState == enumValue(CandidateState.ignored)) {
      throw const ValidationException(
        'An ignored candidate cannot be confirmed.',
      );
    }
    if (candidate.candidateState == enumValue(CandidateState.confirmed)) {
      if (candidate.confirmedTransactionId != null) {
        final existing = await getTransaction(
          candidate.confirmedTransactionId!,
        );
        if (existing != null) return existing;
      }
      throw const BackendException(
        'Candidate is already marked confirmed but has no linked transaction.',
      );
    }
    final sourceInput = corrections;
    final evidence = _candidateInputFromRow(candidate);
    final input = sourceInput == null
        ? TransactionInput(
            kind: evidence.kind,
            amountMinor: evidence.amountMinor,
            currencyCode: evidence.currencyCode,
            occurredAtUtc: evidence.occurredAtUtc,
            localDateKey: evidence.localDateKey,
            status: evidence.status,
            accountId: evidence.accountId,
            sourceAccountId: evidence.sourceAccountId,
            destinationAccountId: evidence.destinationAccountId,
            categoryId: evidence.categoryId,
            paymentMethodId: evidence.paymentMethodId,
            description: evidence.description,
            externalReference: evidence.externalReference,
            occurredLocalOffsetMinutes: evidence.occurredLocalOffsetMinutes,
            occurredTimezoneId: evidence.occurredTimezoneId,
            source: evidence.source,
            expenseBehavior: evidence.expenseBehavior,
            allocationGroup: evidence.allocationGroup,
            allocationGroupName: evidence.allocationGroupName,
          )
        : TransactionInput(
            kind: sourceInput.kind,
            amountMinor: sourceInput.amountMinor,
            currencyCode: sourceInput.currencyCode,
            occurredAtUtc: sourceInput.occurredAtUtc,
            localDateKey: sourceInput.localDateKey,
            status: sourceInput.status,
            accountId: sourceInput.accountId,
            sourceAccountId: sourceInput.sourceAccountId,
            destinationAccountId: sourceInput.destinationAccountId,
            categoryId: sourceInput.categoryId,
            subcategoryId: sourceInput.subcategoryId,
            paymentMethodId: sourceInput.paymentMethodId,
            description: sourceInput.description,
            externalReference: sourceInput.externalReference,
            occurredLocalOffsetMinutes: sourceInput.occurredLocalOffsetMinutes,
            occurredTimezoneId: sourceInput.occurredTimezoneId,
            source: evidence.source,
            expenseBehavior: sourceInput.expenseBehavior,
            allocationGroup: sourceInput.allocationGroup,
            allocationGroupName: sourceInput.allocationGroupName,
          );
    _validateTransactionInput(input);
    final now = _utcNow();
    final transactionId = _newId();
    await database.transaction(() async {
      final current = await (database.select(
        database.detectedTransactionCandidates,
      )..where((row) => row.id.equals(id))).getSingle();
      if (current.candidateState == enumValue(CandidateState.confirmed)) {
        throw const DuplicateRecordException(
          'Candidate was confirmed by another operation.',
        );
      }
      await _validateAccountReferences(input);
      await database
          .into(database.transactions)
          .insert(
            _transactionCompanion(
              input,
              id: transactionId,
              createdAt: now,
              updatedAt: now,
              originalSourceId: id,
            ),
          );
      await (database.update(
        database.detectedTransactionCandidates,
      )..where((row) => row.id.equals(id))).write(
        DetectedTransactionCandidatesCompanion(
          candidateState: Value(enumValue(CandidateState.confirmed)),
          confirmedTransactionId: Value(transactionId),
          updatedAt: Value(now),
        ),
      );
      await (database.update(
        database.importRows,
      )..where((row) => row.candidateId.equals(id))).write(
        ImportRowsCompanion(
          userDecision: const Value('accepted'),
          committedTransactionId: Value(transactionId),
        ),
      );
    });
    return (await getTransaction(transactionId))!;
  }

  @override
  Future<void> ignoreCandidate(String id) async {
    await database.transaction(() async {
      final updated =
          await (database.update(database.detectedTransactionCandidates)
                ..where(
                  (row) =>
                      row.id.equals(id) &
                      row.candidateState.isIn(<String>[
                        'needs_review',
                        'duplicate_review_pending',
                      ]),
                ))
              .write(
                DetectedTransactionCandidatesCompanion(
                  candidateState: Value(enumValue(CandidateState.ignored)),
                  updatedAt: Value(_utcNow()),
                ),
              );
      if (updated == 0) {
        throw RecordNotFoundException(
          'Reviewable candidate $id was not found or was already decided.',
        );
      }
      await (database.update(database.importRows)
            ..where((row) => row.candidateId.equals(id)))
          .write(const ImportRowsCompanion(userDecision: Value('rejected')));
    });
  }

  @override
  Future<T?> getSetting<T>(String key) async {
    final row = await (database.select(
      database.userSettings,
    )..where((setting) => setting.key.equals(key))).getSingleOrNull();
    if (row == null) return null;
    final value = jsonDecode(row.valueJson);
    if (value is! T) {
      throw ValidationException(
        'Setting $key has type ${value.runtimeType}, not $T.',
      );
    }
    return value;
  }

  @override
  Future<void> setSetting<T>(String key, T value) async {
    if (key.trim().isEmpty) {
      throw const ValidationException('Setting key is required.');
    }
    final now = _utcNow();
    await database
        .into(database.userSettings)
        .insertOnConflictUpdate(
          UserSettingsCompanion.insert(
            key: key,
            valueJson: jsonEncode(value),
            updatedAt: now,
          ),
        );
  }

  @override
  Future<Map<String, Object?>> getAllSettings() async {
    final rows = await database.select(database.userSettings).get();
    return <String, Object?>{
      for (final row in rows) row.key: jsonDecode(row.valueJson),
    };
  }
}
