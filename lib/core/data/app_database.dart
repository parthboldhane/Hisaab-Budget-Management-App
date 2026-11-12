import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

class Accounts extends Table {
  TextColumn get id => text()();
  TextColumn get name => text().withLength(min: 1, max: 120)();
  TextColumn get kind => text().withLength(min: 1, max: 40)();
  TextColumn get currencyCode => text().withDefault(const Constant('INR'))();
  IntColumn get openingBalanceMinor =>
      integer().withDefault(const Constant(0))();
  BoolColumn get isArchived => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => <Column<Object>>{id};

  @override
  List<String> get customConstraints => <String>[
    'CHECK (opening_balance_minor >= 0)',
  ];
}

class Categories extends Table {
  TextColumn get id => text()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  TextColumn get kind => text().withDefault(const Constant('expense'))();
  TextColumn get parentCategoryId =>
      text().nullable().references(Categories, #id, onDelete: KeyAction.restrict)();
  BoolColumn get isBuiltin => boolean().withDefault(const Constant(false))();
  BoolColumn get isArchived => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => <Column<Object>>{id};

  @override
  List<String> get customConstraints => <String>[
    "CHECK (kind IN ('income', 'expense', 'transfer'))",
    'CHECK (parent_category_id IS NULL OR parent_category_id <> id)',
  ];
}

class Subcategories extends Table {
  TextColumn get id => text()();
  TextColumn get categoryId =>
      text().references(Categories, #id, onDelete: KeyAction.restrict)();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  BoolColumn get isArchived => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => <Column<Object>>{id};
}

class PaymentMethods extends Table {
  TextColumn get id => text()();
  TextColumn get name => text().withLength(min: 1, max: 80)();
  TextColumn get accountId =>
      text().nullable().references(Accounts, #id, onDelete: KeyAction.restrict)();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  BoolColumn get isArchived => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => <Column<Object>>{id};
}

class Transactions extends Table {
  TextColumn get id => text()();
  TextColumn get kind => text()();
  IntColumn get amountMinor => integer()();
  TextColumn get currencyCode => text().withDefault(const Constant('INR'))();
  DateTimeColumn get occurredAt => dateTime()();
  IntColumn get occurredLocalOffsetMinutes => integer().nullable()();
  TextColumn get occurredTimezoneId => text().nullable()();
  TextColumn get localDateKey => text().withLength(min: 10, max: 10)();
  TextColumn get status => text()();
  TextColumn get verification => text().withDefault(const Constant('confirmed'))();
  TextColumn get source => text()();
  @ReferenceName('ledgerTransactions')
  TextColumn get accountId =>
      text().nullable().references(Accounts, #id, onDelete: KeyAction.restrict)();
  @ReferenceName('outgoingTransfers')
  TextColumn get sourceAccountId =>
      text().nullable().references(Accounts, #id, onDelete: KeyAction.restrict)();
  @ReferenceName('incomingTransfers')
  TextColumn get destinationAccountId =>
      text().nullable().references(Accounts, #id, onDelete: KeyAction.restrict)();
  TextColumn get categoryId =>
      text().nullable().references(Categories, #id, onDelete: KeyAction.restrict)();
  TextColumn get subcategoryId =>
      text().nullable().references(Subcategories, #id, onDelete: KeyAction.restrict)();
  TextColumn get paymentMethodId =>
      text().nullable().references(PaymentMethods, #id, onDelete: KeyAction.restrict)();
  TextColumn get description => text().nullable()();
  TextColumn get externalReference => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  TextColumn get originalSourceId => text().nullable()();
  TextColumn get sourceMetadataJson => text().nullable()();
  TextColumn get expenseBehavior => text().nullable()();
  TextColumn get allocationGroup => text().nullable()();
  TextColumn get allocationGroupName => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => <Column<Object>>{id};

  @override
  List<String> get customConstraints => <String>[
    "CHECK (kind IN ('income', 'expense', 'transfer'))",
    "CHECK (status IN ('pending', 'successful', 'failed', 'refunded', 'reversed'))",
    "CHECK (verification = 'confirmed')",
    "CHECK (source IN ('manual_entry', 'notification', 'sms', 'import'))",
    "CHECK (expense_behavior IS NULL OR expense_behavior IN ('fixed', 'variable'))",
    "CHECK (allocation_group IS NULL OR allocation_group IN ('needs', 'wants', 'savings', 'custom'))",
    "CHECK (allocation_group <> 'custom' OR allocation_group_name IS NOT NULL)",
    'CHECK (amount_minor > 0)',
    '''
    CHECK (
      (kind IN ('income', 'expense') AND account_id IS NOT NULL AND source_account_id IS NULL AND destination_account_id IS NULL)
      OR
      (kind = 'transfer' AND account_id IS NULL AND source_account_id IS NOT NULL AND destination_account_id IS NOT NULL AND source_account_id <> destination_account_id)
    )
    ''',
  ];
}

class Budgets extends Table {
  TextColumn get id => text()();
  TextColumn get periodType => text()();
  TextColumn get periodKey => text()();
  TextColumn get categoryId =>
      text().nullable().references(Categories, #id, onDelete: KeyAction.restrict)();
  TextColumn get planId => text().nullable()();
  TextColumn get name => text().nullable()();
  TextColumn get budgetMode => text()();
  TextColumn get allocationGroup => text().nullable()();
  IntColumn get allocationPercentage => integer().nullable()();
  IntColumn get limitMinor => integer().nullable()();
  TextColumn get currencyCode => text().withDefault(const Constant('INR'))();
  TextColumn get incomeBaseMode => text().nullable()();
  IntColumn get incomeBaseAmountMinor => integer().nullable()();
  IntColumn get alertThresholdMinor => integer().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  BoolColumn get isArchived => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => <Column<Object>>{id};

  @override
  List<String> get customConstraints => <String>[
    "CHECK (period_type IN ('daily', 'weekly', 'monthly', 'yearly', 'custom'))",
    "CHECK (budget_mode IN ('fixed_amount', 'allocation_percentage'))",
    "CHECK (allocation_group IS NULL OR allocation_group IN ('needs', 'wants', 'savings', 'custom'))",
    'CHECK (limit_minor IS NULL OR limit_minor >= 0)',
    'CHECK (alert_threshold_minor IS NULL OR alert_threshold_minor >= 0)',
    'CHECK (income_base_amount_minor IS NULL OR income_base_amount_minor >= 0)',
    "CHECK (income_base_mode IS NULL OR income_base_mode IN ('all_income', 'confirmed_income_only', 'net_monthly_amount', 'custom'))",
    'CHECK (allocation_percentage IS NULL OR (allocation_percentage > 0 AND allocation_percentage <= 100))',
    '''
    CHECK (
      (budget_mode = 'fixed_amount' AND limit_minor IS NOT NULL AND allocation_percentage IS NULL)
      OR
      (budget_mode = 'allocation_percentage' AND allocation_percentage IS NOT NULL AND limit_minor IS NULL AND plan_id IS NOT NULL AND allocation_group IS NOT NULL)
    )
    ''',
    '''
    CHECK (
      (budget_mode = 'fixed_amount' AND income_base_amount_minor IS NULL)
      OR
      (budget_mode = 'allocation_percentage' AND income_base_mode = 'custom' AND income_base_amount_minor IS NOT NULL)
      OR
      (budget_mode = 'allocation_percentage' AND income_base_mode IN ('all_income', 'confirmed_income_only', 'net_monthly_amount') AND income_base_amount_minor IS NULL)
    )
    ''',
  ];
}

class SavingsGoals extends Table {
  TextColumn get id => text()();
  TextColumn get name => text().withLength(min: 1, max: 120)();
  IntColumn get targetMinor => integer()();
  TextColumn get currencyCode => text().withDefault(const Constant('INR'))();
  DateTimeColumn get deadlineAt => dateTime().nullable()();
  TextColumn get accountId =>
      text().nullable().references(Accounts, #id, onDelete: KeyAction.restrict)();
  TextColumn get status => text().withDefault(const Constant('active'))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => <Column<Object>>{id};

  @override
  List<String> get customConstraints => <String>[
    'CHECK (target_minor > 0)',
    "CHECK (status IN ('active', 'completed', 'archived'))",
  ];
}

class SavingsContributions extends Table {
  TextColumn get id => text()();
  TextColumn get goalId =>
      text().references(SavingsGoals, #id, onDelete: KeyAction.restrict)();
  TextColumn get transactionId =>
      text().nullable().references(Transactions, #id, onDelete: KeyAction.restrict)();
  IntColumn get amountMinor => integer()();
  TextColumn get currencyCode => text().withDefault(const Constant('INR'))();
  DateTimeColumn get occurredAt => dateTime()();
  TextColumn get note => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => <Column<Object>>{id};

  @override
  List<String> get customConstraints => <String>[
    'CHECK (amount_minor > 0)',
  ];
}

class RecurringPlans extends Table {
  TextColumn get id => text()();
  TextColumn get name => text().withLength(min: 1, max: 120)();
  TextColumn get cadence => text()();
  DateTimeColumn get startAt => dateTime()();
  DateTimeColumn get nextDueAt => dateTime()();
  DateTimeColumn get endAt => dateTime().nullable()();
  TextColumn get status => text().withDefault(const Constant('active'))();
  TextColumn get templateKind => text()();
  TextColumn get templateDataJson => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => <Column<Object>>{id};

  @override
  List<String> get customConstraints => <String>[
    "CHECK (cadence IN ('daily', 'weekly', 'monthly', 'yearly', 'custom'))",
    "CHECK (status IN ('active', 'paused', 'completed', 'archived'))",
    "CHECK (template_kind IN ('income', 'expense', 'transfer'))",
  ];
}

class DetectedTransactionCandidates extends Table {
  TextColumn get id => text()();
  TextColumn get source => text()();
  TextColumn get sourceApp => text().nullable()();
  TextColumn get sourceReference => text().nullable()();
  TextColumn get normalizedKind => text()();
  TextColumn get expenseBehavior => text().nullable()();
  TextColumn get allocationGroup => text().nullable()();
  TextColumn get allocationGroupName => text().nullable()();
  IntColumn get amountMinor => integer()();
  TextColumn get currencyCode => text().withDefault(const Constant('INR'))();
  DateTimeColumn get occurredAt => dateTime()();
  IntColumn get occurredLocalOffsetMinutes => integer().nullable()();
  TextColumn get occurredTimezoneId => text().nullable()();
  TextColumn get localDateKey => text().withLength(min: 10, max: 10)();
  @ReferenceName('accountCandidates')
  TextColumn get accountId =>
      text().nullable().references(Accounts, #id, onDelete: KeyAction.restrict)();
  @ReferenceName('sourceAccountCandidates')
  TextColumn get sourceAccountId =>
      text().nullable().references(Accounts, #id, onDelete: KeyAction.restrict)();
  @ReferenceName('destinationAccountCandidates')
  TextColumn get destinationAccountId =>
      text().nullable().references(Accounts, #id, onDelete: KeyAction.restrict)();
  TextColumn get categoryId =>
      text().nullable().references(Categories, #id, onDelete: KeyAction.restrict)();
  TextColumn get paymentMethodId =>
      text().nullable().references(PaymentMethods, #id, onDelete: KeyAction.restrict)();
  TextColumn get description => text().nullable()();
  TextColumn get partyDetails => text().nullable()();
  TextColumn get sourceContext => text().nullable()();
  RealColumn get confidence => real().withDefault(const Constant(0))();
  TextColumn get statusEvidence => text()();
  TextColumn get candidateState => text().withDefault(
    const Constant('needs_review'),
  )();
  @ReferenceName('candidateDuplicateReferences')
  TextColumn get duplicateOfTransactionId =>
      text().nullable().references(Transactions, #id, onDelete: KeyAction.restrict)();
  @ReferenceName('candidateConfirmedTransactions')
  TextColumn get confirmedTransactionId =>
      text().nullable().references(Transactions, #id, onDelete: KeyAction.restrict)();
  DateTimeColumn get receivedAt => dateTime()();
  TextColumn get sourceMetadataJson => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => <Column<Object>>{id};

  @override
  List<String> get customConstraints => <String>[
    "CHECK (source IN ('notification', 'sms', 'import'))",
    "CHECK (normalized_kind IN ('income', 'expense', 'transfer'))",
    "CHECK (expense_behavior IS NULL OR expense_behavior IN ('fixed', 'variable'))",
    "CHECK (allocation_group IS NULL OR allocation_group IN ('needs', 'wants', 'savings', 'custom'))",
    "CHECK (candidate_state IN ('needs_review', 'confirmed', 'ignored', 'duplicate_review_pending'))",
    "CHECK ((candidate_state = 'confirmed' AND confirmed_transaction_id IS NOT NULL) OR (candidate_state <> 'confirmed' AND confirmed_transaction_id IS NULL))",
    'CHECK (amount_minor > 0)',
    'CHECK (confidence >= 0 AND confidence <= 1)',
  ];
}

class CandidateDuplicateLinks extends Table {
  TextColumn get id => text()();
  @ReferenceName('candidateLinks')
  TextColumn get candidateId => text().references(
    DetectedTransactionCandidates,
    #id,
    onDelete: KeyAction.cascade,
  )();
  TextColumn get relatedTransactionId =>
      text().nullable().references(Transactions, #id, onDelete: KeyAction.restrict)();
  @ReferenceName('relatedCandidateLinks')
  TextColumn get relatedCandidateId => text()
      .nullable()
      .references(DetectedTransactionCandidates, #id, onDelete: KeyAction.restrict)();
  TextColumn get fingerprintType => text()();
  RealColumn get similarityScore => real()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => <Column<Object>>{id};

  @override
  List<String> get customConstraints => <String>[
    'CHECK ((related_transaction_id IS NULL) <> (related_candidate_id IS NULL))',
    'CHECK (similarity_score >= 0 AND similarity_score <= 1)',
  ];
}

class CandidateFingerprints extends Table {
  TextColumn get id => text()();
  TextColumn get candidateId => text().references(
    DetectedTransactionCandidates,
    #id,
    onDelete: KeyAction.cascade,
  )();
  TextColumn get fingerprintHash => text()();
  IntColumn get fingerprintVersion => integer().withDefault(const Constant(1))();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => <Column<Object>>{id};
}

class ImportBatches extends Table {
  TextColumn get id => text()();
  TextColumn get fileName => text()();
  TextColumn get sourceType => text().withDefault(const Constant('csv'))();
  TextColumn get status => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get committedAt => dateTime().nullable()();

  @override
  Set<Column<Object>> get primaryKey => <Column<Object>>{id};

  @override
  List<String> get customConstraints => <String>[
    "CHECK (status IN ('preview', 'committed', 'failed'))",
  ];
}

class ImportRows extends Table {
  TextColumn get id => text()();
  TextColumn get batchId =>
      text().references(ImportBatches, #id, onDelete: KeyAction.cascade)();
  IntColumn get rowNumber => integer()();
  TextColumn get parsedKind => text().nullable()();
  IntColumn get parsedAmountMinor => integer().nullable()();
  TextColumn get parsedCurrencyCode => text().nullable()();
  DateTimeColumn get parsedOccurredAt => dateTime().nullable()();
  IntColumn get parsedLocalOffsetMinutes => integer().nullable()();
  TextColumn get parsedTimezoneId => text().nullable()();
  TextColumn get localDateKey => text().nullable()();
  TextColumn get parsedAccountName => text().nullable()();
  TextColumn get parsedCategoryName => text().nullable()();
  TextColumn get parseErrorsJson => text().nullable()();
  @ReferenceName('importDuplicateReferences')
  TextColumn get duplicateOfTransactionId =>
      text().nullable().references(Transactions, #id, onDelete: KeyAction.restrict)();
  TextColumn get userDecision => text().withDefault(const Constant('pending'))();
  @ReferenceName('importCandidates')
  TextColumn get candidateId => text()
      .nullable()
      .references(DetectedTransactionCandidates, #id, onDelete: KeyAction.restrict)();
  @ReferenceName('importCommittedTransactions')
  TextColumn get committedTransactionId =>
      text().nullable().references(Transactions, #id, onDelete: KeyAction.restrict)();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => <Column<Object>>{id};

  @override
  List<String> get customConstraints => <String>[
    'CHECK (row_number > 0)',
    'CHECK (parsed_amount_minor IS NULL OR parsed_amount_minor > 0)',
    "CHECK (user_decision IN ('pending', 'accepted', 'rejected', 'needs_review', 'duplicate_review_pending'))",
  ];
}

class UserSettings extends Table {
  TextColumn get key => text()();
  TextColumn get valueJson => text()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => <Column<Object>>{key};
}

class LocalBackupMetadata extends Table {
  TextColumn get id => text()();
  TextColumn get backupFileName => text()();
  DateTimeColumn get createdAt => dateTime()();
  TextColumn get fileHash => text()();
  TextColumn get checksumAlgorithm => text()();
  BoolColumn get encrypted => boolean().withDefault(const Constant(false))();
  TextColumn get notes => text().nullable()();
  BoolColumn get valid => boolean().withDefault(const Constant(false))();

  @override
  Set<Column<Object>> get primaryKey => <Column<Object>>{id};
}

@DriftDatabase(
  tables: <Type>[
    Accounts,
    Categories,
    Subcategories,
    PaymentMethods,
    Transactions,
    Budgets,
    SavingsGoals,
    SavingsContributions,
    RecurringPlans,
    DetectedTransactionCandidates,
    CandidateDuplicateLinks,
    CandidateFingerprints,
    ImportBatches,
    ImportRows,
    UserSettings,
    LocalBackupMetadata,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.executor);

  AppDatabase.forTesting() : super(NativeDatabase.memory());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (migrator) async {
      await migrator.createAll();
      await _createIndexes();
      await _seedDefaults();
    },
    onUpgrade: (migrator, from, to) async {
      if (from < 1) {
        await migrator.createAll();
        await _createIndexes();
        await _seedDefaults();
      }
    },
    beforeOpen: (_) async {
      await customStatement('PRAGMA foreign_keys = ON');
      await customStatement('PRAGMA journal_mode = WAL');
    },
  );

  Future<void> _createIndexes() async {
    const indexes = <String>[
      'CREATE INDEX IF NOT EXISTS transactions_occurred_at_idx ON transactions(occurred_at)',
      'CREATE INDEX IF NOT EXISTS transactions_account_date_idx ON transactions(account_id, local_date_key)',
      'CREATE INDEX IF NOT EXISTS transactions_transfer_accounts_idx ON transactions(source_account_id, destination_account_id)',
      'CREATE INDEX IF NOT EXISTS transactions_category_date_idx ON transactions(category_id, local_date_key)',
      'CREATE INDEX IF NOT EXISTS transactions_status_verification_idx ON transactions(status, verification)',
      'CREATE UNIQUE INDEX IF NOT EXISTS transactions_candidate_source_idx ON transactions(original_source_id) WHERE original_source_id IS NOT NULL',
      'CREATE INDEX IF NOT EXISTS budgets_period_category_idx ON budgets(period_type, period_key, category_id)',
      'CREATE INDEX IF NOT EXISTS budgets_plan_period_idx ON budgets(plan_id, period_key, is_active)',
      'CREATE UNIQUE INDEX IF NOT EXISTS budgets_active_allocation_key_idx ON budgets(plan_id, period_type, period_key, allocation_group, COALESCE(name, \'\')) WHERE budget_mode = \'allocation_percentage\' AND is_active = 1 AND is_archived = 0',
      'CREATE INDEX IF NOT EXISTS savings_contributions_goal_date_idx ON savings_contributions(goal_id, occurred_at)',
      'CREATE INDEX IF NOT EXISTS candidates_state_received_idx ON detected_transaction_candidates(candidate_state, received_at)',
      'CREATE INDEX IF NOT EXISTS candidate_duplicate_links_candidate_idx ON candidate_duplicate_links(candidate_id)',
      'CREATE INDEX IF NOT EXISTS candidate_fingerprints_hash_idx ON candidate_fingerprints(fingerprint_hash)',
      'CREATE INDEX IF NOT EXISTS import_rows_batch_decision_idx ON import_rows(batch_id, user_decision)',
      'CREATE UNIQUE INDEX IF NOT EXISTS payment_methods_active_name_idx ON payment_methods(name COLLATE NOCASE, COALESCE(account_id, \'\')) WHERE is_active = 1 AND is_archived = 0',
      'CREATE UNIQUE INDEX IF NOT EXISTS categories_active_name_idx ON categories(kind, name COLLATE NOCASE, COALESCE(parent_category_id, \'\')) WHERE is_archived = 0',
      'CREATE UNIQUE INDEX IF NOT EXISTS subcategories_active_name_idx ON subcategories(category_id, name COLLATE NOCASE) WHERE is_archived = 0',
    ];
    for (final index in indexes) {
      await customStatement(index);
    }
  }

  Future<void> _seedDefaults() async {
    final now = DateTime.now().toUtc();
    const seedCategories = <(String, String)>[
      ('00000000-0000-4000-8000-000000000001', 'Food & Groceries'),
      ('00000000-0000-4000-8000-000000000002', 'Transportation'),
      ('00000000-0000-4000-8000-000000000003', 'Education'),
      ('00000000-0000-4000-8000-000000000004', 'Shopping'),
      ('00000000-0000-4000-8000-000000000005', 'Entertainment'),
      ('00000000-0000-4000-8000-000000000006', 'Healthcare'),
      ('00000000-0000-4000-8000-000000000007', 'Bills & Utilities'),
      ('00000000-0000-4000-8000-000000000008', 'Housing'),
      ('00000000-0000-4000-8000-000000000009', 'Personal Care'),
      ('00000000-0000-4000-8000-000000000010', 'Other/Custom'),
    ];
    await batch((batch) {
      for (final (id, name) in seedCategories) {
        batch.insert(
          categories,
          CategoriesCompanion.insert(
            id: id,
            name: name,
            isBuiltin: const Value(true),
            createdAt: now,
            updatedAt: now,
          ),
          mode: InsertMode.insertOrIgnore,
        );
      }
      const defaults = <String, Object>{
        'default_currency': 'INR',
        'theme_mode': 'system',
        'notification_tracking_enabled': false,
        'sms_tracking_enabled': false,
        'sms_policy_eligible': false,
        'app_lock_mode': 'off',
        'app_lock_timeout_minutes': 5,
        'hide_balances': false,
        'notification_preferences': <String, Object>{},
        'tracking_preferences': <String, Object>{},
      };
      for (final entry in defaults.entries) {
        batch.insert(
          userSettings,
          UserSettingsCompanion.insert(
            key: entry.key,
            valueJson: jsonEncode(entry.value),
            updatedAt: now,
          ),
          mode: InsertMode.insertOrIgnore,
        );
      }
    });
  }
}

Future<AppDatabase> openLocalDatabase() async {
  final directory = await getApplicationSupportDirectory();
  final file = File(p.join(directory.path, 'hisaab_local.sqlite'));
  return AppDatabase(
    NativeDatabase.createInBackground(file, setup: (database) {
      database.execute('PRAGMA foreign_keys = ON');
      database.execute('PRAGMA journal_mode = WAL');
    }),
  );
}
