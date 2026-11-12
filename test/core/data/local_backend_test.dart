import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hisaab/core/application/finance_services.dart';
import 'package:hisaab/core/data/android_local_adapters.dart';
import 'package:hisaab/core/data/app_database.dart';
import 'package:hisaab/core/data/drift_hisaab_repository.dart';
import 'package:hisaab/core/data/local_file_services.dart';
import 'package:hisaab/core/domain/backend_errors.dart';
import 'package:hisaab/core/domain/ledger_models.dart';
import 'package:hisaab/core/domain/money_formatter.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AppDatabase database;
  late DriftHisaabRepository repository;

  setUp(() async {
    database = AppDatabase.forTesting();
    repository = DriftHisaabRepository(database);
  });

  tearDown(() async {
    await database.close();
  });

  DateTime utc(int year, int month, int day, [int hour = 12]) =>
      DateTime.utc(year, month, day, hour);

  TransactionInput entry({
    required LedgerKind kind,
    required int amount,
    required String accountId,
    required DateTime at,
    String? categoryId,
    String? externalReference,
    ExpenseBehavior? expenseBehavior,
    AllocationGroup? allocationGroup,
    String? allocationGroupName,
  }) => TransactionInput(
    kind: kind,
    amountMinor: amount,
    currencyCode: 'INR',
    occurredAtUtc: at,
    localDateKey:
        '${at.year.toString().padLeft(4, '0')}-'
        '${at.month.toString().padLeft(2, '0')}-'
        '${at.day.toString().padLeft(2, '0')}',
    status: TransactionStatus.successful,
    accountId: accountId,
    occurredLocalOffsetMinutes: 0,
    categoryId: categoryId,
    externalReference: externalReference,
    expenseBehavior: expenseBehavior,
    allocationGroup: allocationGroup,
    allocationGroupName: allocationGroupName,
  );

  NormalizedCandidateInput candidate({
    required String accountId,
    required int amount,
    required DateTime at,
    String? externalReference,
  }) => NormalizedCandidateInput(
    source: TransactionSource.notification,
    kind: LedgerKind.expense,
    amountMinor: amount,
    currencyCode: 'INR',
    occurredAtUtc: at,
    localDateKey:
        '${at.year.toString().padLeft(4, '0')}-'
        '${at.month.toString().padLeft(2, '0')}-'
        '${at.day.toString().padLeft(2, '0')}',
    status: TransactionStatus.successful,
    accountId: accountId,
    externalReference: externalReference,
    occurredLocalOffsetMinutes: 0,
  );

  test('money stays integer paise and INR formatting is exact', () {
    const first = Money(amountMinor: 12550);
    const second = Money(amountMinor: 50);
    expect((first + second).amountMinor, 12600);
    expect((first - second).amountMinor, 12500);
    expect(formatMoneyMinor(123456), '₹1,234.56');
    expect(formatMoneyMinor(1), '₹0.01');
  });

  test(
    'income, expenses, and one-row transfers update balances correctly',
    () async {
      final cash = await repository.createAccount(
        const AccountInput(
          name: 'Cash',
          kind: 'cash',
          currencyCode: 'INR',
          openingBalanceMinor: 10000,
        ),
      );
      final bank = await repository.createAccount(
        const AccountInput(name: 'Bank', kind: 'bank', currencyCode: 'INR'),
      );
      await repository.createTransaction(
        entry(
          kind: LedgerKind.income,
          amount: 5000,
          accountId: cash.accountId,
          at: utc(2025, 1, 1),
        ),
      );
      await repository.createTransaction(
        entry(
          kind: LedgerKind.expense,
          amount: 1200,
          accountId: cash.accountId,
          at: utc(2025, 1, 2),
        ),
      );
      await repository.createTransaction(
        TransactionInput(
          kind: LedgerKind.transfer,
          amountMinor: 3000,
          currencyCode: 'INR',
          occurredAtUtc: utc(2025, 1, 3),
          localDateKey: '2025-01-03',
          status: TransactionStatus.successful,
          sourceAccountId: cash.accountId,
          destinationAccountId: bank.accountId,
          occurredLocalOffsetMinutes: 0,
        ),
      );
      final accounts = await repository.listAccounts();
      expect(
        accounts
            .singleWhere((account) => account.accountId == cash.accountId)
            .balanceMinor,
        10800,
      );
      expect(
        accounts
            .singleWhere((account) => account.accountId == bank.accountId)
            .balanceMinor,
        3000,
      );
      expect(
        (await repository.listTransactions(const TransactionFilter())).length,
        3,
      );
      await expectLater(
        repository.createTransaction(
          TransactionInput(
            kind: LedgerKind.transfer,
            amountMinor: 500,
            currencyCode: 'INR',
            occurredAtUtc: utc(2025, 1, 4),
            localDateKey: '2025-01-04',
            status: TransactionStatus.successful,
            sourceAccountId: cash.accountId,
            destinationAccountId: 'missing-account',
            occurredLocalOffsetMinutes: 0,
          ),
        ),
        throwsA(isA<RecordNotFoundException>()),
      );
      expect(
        (await repository.listTransactions(const TransactionFilter())).length,
        3,
      );
      final report = await repository.getReport(
        PeriodRange(
          startDate: DateTime(2025, 1, 1),
          endDate: DateTime(2025, 1, 31),
        ),
      );
      expect(report.incomeMinor, 5000);
      expect(report.expenseMinor, 1200);
    },
  );

  test(
    'editing and deleting refresh ledger-derived balances and reports',
    () async {
      final account = await repository.createAccount(
        const AccountInput(name: 'Cash', kind: 'cash', currencyCode: 'INR'),
      );
      final transaction = await repository.createTransaction(
        entry(
          kind: LedgerKind.expense,
          amount: 1000,
          accountId: account.accountId,
          at: utc(2025, 2, 1),
        ),
      );
      await repository.updateTransaction(
        transaction.id,
        entry(
          kind: LedgerKind.expense,
          amount: 2500,
          accountId: account.accountId,
          at: utc(2025, 2, 1),
        ),
      );
      expect((await repository.listAccounts()).single.balanceMinor, -2500);
      expect(
        (await repository.getReport(
          PeriodRange(
            startDate: DateTime(2025, 2, 1),
            endDate: DateTime(2025, 2, 28),
          ),
        )).expenseMinor,
        2500,
      );
      await repository.deleteTransaction(transaction.id);
      expect((await repository.listAccounts()).single.balanceMinor, 0);
      expect(
        (await repository.listTransactions(const TransactionFilter())),
        isEmpty,
      );
    },
  );

  test(
    'account streams emit when ledger writes change derived balances',
    () async {
      final account = await repository.createAccount(
        const AccountInput(name: 'Cash', kind: 'cash', currencyCode: 'INR'),
      );
      final iterator = StreamIterator(repository.watchAccounts());
      expect(await iterator.moveNext(), isTrue);
      expect(iterator.current.single.balanceMinor, 0);

      final transaction = await repository.createTransaction(
        entry(
          kind: LedgerKind.income,
          amount: 700,
          accountId: account.accountId,
          at: utc(2025, 2, 1),
        ),
      );
      expect(await iterator.moveNext(), isTrue);
      expect(iterator.current.single.balanceMinor, 700);

      await repository.deleteTransaction(transaction.id);
      expect(await iterator.moveNext(), isTrue);
      expect(iterator.current.single.balanceMinor, 0);
      await iterator.cancel();
    },
  );

  test(
    'candidate duplicate routes to review and confirmation is idempotent',
    () async {
      final account = await repository.createAccount(
        const AccountInput(name: 'Cash', kind: 'cash', currencyCode: 'INR'),
      );
      await repository.createTransaction(
        entry(
          kind: LedgerKind.expense,
          amount: 2500,
          accountId: account.accountId,
          at: utc(2025, 3, 5),
          externalReference: 'statement-1',
        ),
      );
      final review = await repository.submitCandidate(
        candidate(
          accountId: account.accountId,
          amount: 2500,
          at: utc(2025, 3, 5, 13),
          externalReference: 'statement-1',
        ),
      );
      expect(review.state, CandidateState.duplicateReviewPending);
      expect(review.matches, hasLength(1));
      final confirmed = await repository.confirmCandidate(review.id);
      final confirmedAgain = await repository.confirmCandidate(review.id);
      expect(confirmed.id, confirmedAgain.id);
      expect(
        (await repository.listTransactions(const TransactionFilter())).length,
        2,
      );
    },
  );

  test('ignored candidate never affects balances or reports', () async {
    final account = await repository.createAccount(
      const AccountInput(name: 'Cash', kind: 'cash', currencyCode: 'INR'),
    );
    final review = await repository.submitCandidate(
      candidate(
        accountId: account.accountId,
        amount: 2500,
        at: utc(2025, 4, 5),
      ),
    );
    await repository.ignoreCandidate(review.id);
    expect((await repository.listAccounts()).single.balanceMinor, 0);
    expect(
      (await repository.getReport(
        PeriodRange(
          startDate: DateTime(2025, 4, 1),
          endDate: DateTime(2025, 4, 30),
        ),
      )).expenseMinor,
      0,
    );
  });

  test('reports preserve stored local date across month rollover', () async {
    final account = await repository.createAccount(
      const AccountInput(name: 'Cash', kind: 'cash', currencyCode: 'INR'),
    );
    await repository.createTransaction(
      entry(
        kind: LedgerKind.expense,
        amount: 110,
        accountId: account.accountId,
        at: utc(2024, 12, 31, 23),
      ),
    );
    await repository.createTransaction(
      TransactionInput(
        kind: LedgerKind.expense,
        amountMinor: 220,
        currencyCode: 'INR',
        occurredAtUtc: utc(2024, 12, 31, 20),
        localDateKey: '2025-01-01',
        status: TransactionStatus.successful,
        accountId: account.accountId,
        occurredLocalOffsetMinutes: 330,
        occurredTimezoneId: 'Asia/Kolkata',
      ),
    );
    final december = await repository.getReport(
      PeriodRange(
        startDate: DateTime(2024, 12, 1),
        endDate: DateTime(2024, 12, 31),
      ),
    );
    final january = await repository.getReport(
      PeriodRange(
        startDate: DateTime(2025, 1, 1),
        endDate: DateTime(2025, 1, 31),
      ),
    );
    expect(december.expenseMinor, 110);
    expect(january.expenseMinor, 220);
  });

  test(
    'archived payment methods retain historical transaction references',
    () async {
      final account = await repository.createAccount(
        const AccountInput(name: 'Bank', kind: 'bank', currencyCode: 'INR'),
      );
      final methodId = await repository.createPaymentMethod(
        PaymentMethodInput(name: 'UPI', accountId: account.accountId),
      );
      final transaction = await repository.createTransaction(
        TransactionInput(
          kind: LedgerKind.expense,
          amountMinor: 500,
          currencyCode: 'INR',
          occurredAtUtc: utc(2025, 4, 1),
          localDateKey: '2025-04-01',
          status: TransactionStatus.successful,
          accountId: account.accountId,
          paymentMethodId: methodId,
          occurredLocalOffsetMinutes: 0,
        ),
      );
      await repository.archivePaymentMethod(methodId);
      expect((await repository.listPaymentMethods()), isEmpty);
      expect(
        (await repository.listPaymentMethods(includeArchived: true)).single.id,
        methodId,
      );
      expect(
        (await repository.getTransaction(transaction.id))?.paymentMethodId,
        methodId,
      );
    },
  );

  test(
    'allocation plan enforces 100 percent and derives target from income',
    () async {
      final account = await repository.createAccount(
        const AccountInput(name: 'Bank', kind: 'bank', currencyCode: 'INR'),
      );
      await repository.createTransaction(
        entry(
          kind: LedgerKind.income,
          amount: 100000,
          accountId: account.accountId,
          at: utc(2025, 5, 10),
        ),
      );
      await repository.createTransaction(
        entry(
          kind: LedgerKind.expense,
          amount: 20000,
          accountId: account.accountId,
          at: utc(2025, 5, 12),
          allocationGroup: AllocationGroup.needs,
        ),
      );
      await expectLater(
        repository.saveAllocationPlan(
          const AllocationPlanInput(
            planId: 'plan',
            periodType: BudgetPeriod.monthly,
            periodKey: '2025-05',
            incomeBaseMode: IncomeBaseMode.confirmedIncomeOnly,
            allocations: <AllocationInput>[
              AllocationInput(group: AllocationGroup.needs, percentage: 50),
              AllocationInput(group: AllocationGroup.wants, percentage: 30),
            ],
          ),
        ),
        throwsA(isA<ValidationException>()),
      );
      await repository.saveAllocationPlan(
        const AllocationPlanInput(
          planId: 'plan',
          periodType: BudgetPeriod.monthly,
          periodKey: '2025-05',
          incomeBaseMode: IncomeBaseMode.confirmedIncomeOnly,
          allocations: <AllocationInput>[
            AllocationInput(group: AllocationGroup.needs, percentage: 50),
            AllocationInput(group: AllocationGroup.wants, percentage: 30),
            AllocationInput(group: AllocationGroup.savings, percentage: 20),
          ],
        ),
      );
      final budgets = await repository.listBudgets(
        periodType: BudgetPeriod.monthly,
        periodKey: '2025-05',
      );
      expect(budgets, hasLength(3));
      expect(
        await repository.getBudgetAllocationAmountMinor(budgets.first.id),
        50000,
      );
      final needs = budgets.singleWhere(
        (budget) => budget.allocationGroup == AllocationGroup.needs,
      );
      expect(await repository.getBudgetActualMinor(needs.id), 20000);
    },
  );

  test('savings contributions do not create income', () async {
    final account = await repository.createAccount(
      const AccountInput(name: 'Bank', kind: 'bank', currencyCode: 'INR'),
    );
    final goalId = await repository.createSavingsGoal(
      const SavingsGoalInput(
        name: 'Emergency fund',
        targetMinor: 100000,
        currencyCode: 'INR',
      ),
    );
    await repository.recordSavingsContribution(
      SavingsContributionInput(
        goalId: goalId,
        amountMinor: 15000,
        currencyCode: 'INR',
        occurredAt: utc(2025, 6, 1),
      ),
    );
    final report = await repository.getReport(
      PeriodRange(
        startDate: DateTime(2025, 6, 1),
        endDate: DateTime(2025, 6, 30),
      ),
    );
    expect(report.incomeMinor, 0);
    expect(
      (await repository.listSavingsGoals()).single.contributedMinor,
      15000,
    );
    expect(
      (await repository.listAccounts()).single.accountId,
      account.accountId,
    );
  });

  test(
    'CSV preview is non-mutating and commit creates only candidates',
    () async {
      final account = await repository.createAccount(
        const AccountInput(name: 'Bank', kind: 'bank', currencyCode: 'INR'),
      );
      final temp = await Directory.systemTemp.createTemp('hisaab-test-');
      final files = LocalFileServices(
        database: database,
        transactions: repository,
        candidates: repository,
        directoryProvider: () async => temp,
      );
      const csv =
          'kind,amount_minor,currency_code,occurred_at,occurred_local_offset_minutes,occurred_timezone_id,local_date_key,description\n'
          'expense,1299,INR,2025-07-01T10:00:00Z,0,UTC,2025-07-01,Groceries\n';
      final preview = await files.previewCsv(csv, accountId: account.accountId);
      expect(preview.rows.single.isValid, isTrue);
      expect(await repository.listCandidates(), isEmpty);
      expect(
        await repository.listTransactions(const TransactionFilter()),
        isEmpty,
      );
      final result = await files.commitCsvPreview(preview, <int>{
        preview.rows.single.rowNumber,
      });
      expect(result.imported, 1);
      expect(await repository.listCandidates(), hasLength(1));
      expect(
        await repository.listTransactions(const TransactionFilter()),
        isEmpty,
      );
      await temp.delete(recursive: true);
    },
  );

  test('invalid backup is rejected without replacing local records', () async {
    final account = await repository.createAccount(
      const AccountInput(name: 'Cash', kind: 'cash', currencyCode: 'INR'),
    );
    final temp = await Directory.systemTemp.createTemp('hisaab-backup-test-');
    final files = LocalFileServices(
      database: database,
      transactions: repository,
      candidates: repository,
      directoryProvider: () async => temp,
    );
    final invalid = await files.validateBackup('not a backup');
    expect(invalid.valid, isFalse);
    await expectLater(
      files.restoreBackup('not a backup', confirmed: true),
      throwsA(isA<InvalidBackupException>()),
    );
    expect(
      (await repository.listAccounts()).single.accountId,
      account.accountId,
    );
    await expectLater(
      files.restoreBackup('{}', confirmed: false),
      throwsA(isA<ValidationException>()),
    );
    await temp.delete(recursive: true);
  });

  test(
    'valid restore requires confirmation and restores the local snapshot',
    () async {
      final original = await repository.createAccount(
        const AccountInput(name: 'Cash', kind: 'cash', currencyCode: 'INR'),
      );
      final temp = await Directory.systemTemp.createTemp(
        'hisaab-valid-backup-',
      );
      final files = LocalFileServices(
        database: database,
        transactions: repository,
        candidates: repository,
        directoryProvider: () async => temp,
      );
      final backup = await files.createBackup(label: 'before change');
      final contents = await File(backup.filePath).readAsString();
      expect((await files.validateBackup(contents)).valid, isTrue);
      await repository.createAccount(
        const AccountInput(
          name: 'New account',
          kind: 'bank',
          currencyCode: 'INR',
        ),
      );
      await expectLater(
        files.restoreBackup(contents, confirmed: false),
        throwsA(isA<ValidationException>()),
      );
      await files.restoreBackup(contents, confirmed: true);
      final restored = await repository.listAccounts();
      expect(restored, hasLength(1));
      expect(restored.single.accountId, original.accountId);
      await temp.delete(recursive: true);
    },
  );

  test('denied tracking leaves manual transaction entry available', () async {
    final account = await repository.createAccount(
      const AccountInput(name: 'Cash', kind: 'cash', currencyCode: 'INR'),
    );
    final bridge = CandidateOnlyTrackingBridge(
      candidates: repository,
      settings: repository,
    );
    await expectLater(
      bridge.submitNotificationCandidate(
        candidate(
          accountId: account.accountId,
          amount: 100,
          at: utc(2025, 8, 1),
        ),
      ),
      throwsA(isA<PermissionDeniedException>()),
    );
    final service = LedgerApplicationService(repository);
    await service.createManualTransaction(
      entry(
        kind: LedgerKind.expense,
        amount: 100,
        accountId: account.accountId,
        at: utc(2025, 8, 1),
      ),
    );
    expect(
      (await repository.listTransactions(const TransactionFilter())),
      hasLength(1),
    );
  });

  test(
    'tracking adapter reports unavailable without a listener implementation',
    () async {
      const channel = MethodChannel('com.hisaab.local/notifications');
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (call) async {
            if (call.method == 'trackingAvailable') return false;
            if (call.method == 'permissionStatus') return 'denied';
            return null;
          });
      final adapter = MethodChannelNotificationTrackingAdapter(
        channel: channel,
        isAndroid: true,
      );
      expect(
        await adapter.getPermissionState(),
        TrackingPermissionState.unavailable,
      );
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, null);
    },
  );
}
