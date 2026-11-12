import 'ledger_models.dart';

abstract interface class AccountRepository {
  Future<AccountBalance> createAccount(AccountInput input);
  Future<void> updateAccount(String id, AccountInput input);
  Future<void> archiveAccount(String id);
  Future<List<AccountBalance>> listAccounts({bool includeArchived = false});
  Stream<List<AccountBalance>> watchAccounts({bool includeArchived = false});
}

abstract interface class TransactionRepository {
  Future<LedgerTransaction?> getTransaction(String id);
  Future<List<LedgerTransaction>> listTransactions(
    TransactionFilter filter, {
    PageRequest page = const PageRequest(),
  });
  Stream<List<LedgerTransaction>> watchTransactions(TransactionFilter filter);
  Future<LedgerTransaction> createTransaction(TransactionInput input);
  Future<LedgerTransaction> updateTransaction(
    String id,
    TransactionInput input,
  );
  Future<void> deleteTransaction(String id);
  Future<DashboardSummary> getDashboard(PeriodRange period);
  Future<FinanceReport> getReport(PeriodRange period);
  Future<PeriodComparison> comparePeriods(
    PeriodRange periodA,
    PeriodRange periodB,
  );
  Future<List<PeriodRange>> listAvailablePeriods(ReportPeriod period);
}

abstract interface class CatalogRepository {
  Future<String> createCategory(CategoryInput input);
  Future<void> updateCategory(String id, CategoryInput input);
  Future<void> archiveCategory(String id);
  Future<List<CategoryRecord>> listCategories({
    LedgerKind? kind,
    String? parentCategoryId,
    bool includeArchived = false,
  });
  Future<String> createSubcategory({
    required String categoryId,
    required String name,
  });
  Future<void> archiveSubcategory(String id);
  Future<List<SubcategoryRecord>> listSubcategories(
    String categoryId, {
    bool includeArchived = false,
  });
  Future<String> createPaymentMethod(PaymentMethodInput input);
  Future<void> updatePaymentMethod(String id, PaymentMethodInput input);
  Future<void> archivePaymentMethod(String id);
  Future<List<PaymentMethodRecord>> listPaymentMethods({
    bool includeArchived = false,
  });
}

abstract interface class BudgetRepository {
  Future<String> createFixedBudget(BudgetInput input);
  Future<void> saveAllocationPlan(AllocationPlanInput input);
  Future<List<BudgetRecord>> listBudgets({
    required BudgetPeriod periodType,
    required String periodKey,
    bool includeArchived = false,
  });
  Future<int> getBudgetActualMinor(String budgetId);
  Future<int> getBudgetAllocationAmountMinor(String budgetId);
  Future<void> archiveBudget(String id);
  Future<String> createSavingsGoal(SavingsGoalInput input);
  Future<void> archiveSavingsGoal(String id);
  Future<List<SavingsGoalRecord>> listSavingsGoals({
    bool includeArchived = false,
  });
  Future<String> recordSavingsContribution(SavingsContributionInput input);
  Future<List<SavingsContributionRecord>> listSavingsContributions(
    String goalId,
  );
  Future<String> createRecurringPlan(RecurringPlanInput input);
  Future<void> updateRecurringPlan(String id, RecurringPlanInput input);
  Future<void> setRecurringPlanStatus(String id, RecurringStatus status);
  Future<List<RecurringPlanRecord>> listRecurringPlans({
    bool includeArchived = false,
  });
}

abstract interface class CandidateRepository {
  Future<CandidateReviewItem> submitCandidate(NormalizedCandidateInput input);
  Future<List<CandidateReviewItem>> listCandidates({
    Set<CandidateState>? states,
  });
  Future<LedgerTransaction> confirmCandidate(
    String id, {
    TransactionInput? corrections,
  });
  Future<void> ignoreCandidate(String id);
}

abstract interface class SettingsRepository {
  Future<T?> getSetting<T>(String key);
  Future<void> setSetting<T>(String key, T value);
  Future<Map<String, Object?>> getAllSettings();
}

class CategoryRecord {
  const CategoryRecord({
    required this.id,
    required this.name,
    required this.kind,
    required this.isBuiltin,
    required this.isArchived,
    this.parentCategoryId,
  });

  final String id;
  final String name;
  final LedgerKind kind;
  final bool isBuiltin;
  final bool isArchived;
  final String? parentCategoryId;
}

class SubcategoryRecord {
  const SubcategoryRecord({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.isArchived,
  });

  final String id;
  final String categoryId;
  final String name;
  final bool isArchived;
}

class PaymentMethodRecord {
  const PaymentMethodRecord({
    required this.id,
    required this.name,
    required this.isActive,
    required this.isArchived,
    this.accountId,
  });

  final String id;
  final String name;
  final bool isActive;
  final bool isArchived;
  final String? accountId;
}

class BudgetRecord {
  const BudgetRecord({
    required this.id,
    required this.periodType,
    required this.periodKey,
    required this.mode,
    required this.currencyCode,
    required this.isActive,
    required this.isArchived,
    this.categoryId,
    this.planId,
    this.name,
    this.allocationGroup,
    this.allocationPercentage,
    this.limitMinor,
    this.incomeBaseMode,
    this.incomeBaseAmountMinor,
    this.alertThresholdMinor,
  });

  final String id;
  final BudgetPeriod periodType;
  final String periodKey;
  final BudgetMode mode;
  final String currencyCode;
  final bool isActive;
  final bool isArchived;
  final String? categoryId;
  final String? planId;
  final String? name;
  final AllocationGroup? allocationGroup;
  final int? allocationPercentage;
  final int? limitMinor;
  final IncomeBaseMode? incomeBaseMode;
  final int? incomeBaseAmountMinor;
  final int? alertThresholdMinor;
}

class SavingsGoalRecord {
  const SavingsGoalRecord({
    required this.id,
    required this.name,
    required this.targetMinor,
    required this.currencyCode,
    required this.status,
    required this.contributedMinor,
    this.deadline,
    this.accountId,
  });

  final String id;
  final String name;
  final int targetMinor;
  final String currencyCode;
  final String status;
  final int contributedMinor;
  final DateTime? deadline;
  final String? accountId;
}

class SavingsContributionRecord {
  const SavingsContributionRecord({
    required this.id,
    required this.goalId,
    required this.amountMinor,
    required this.currencyCode,
    required this.occurredAt,
    this.transactionId,
    this.note,
  });

  final String id;
  final String goalId;
  final int amountMinor;
  final String currencyCode;
  final DateTime occurredAt;
  final String? transactionId;
  final String? note;
}

class RecurringPlanRecord {
  const RecurringPlanRecord({
    required this.id,
    required this.name,
    required this.cadence,
    required this.startAt,
    required this.nextDueAt,
    required this.status,
    required this.template,
    this.endAt,
  });

  final String id;
  final String name;
  final RecurringCadence cadence;
  final DateTime startAt;
  final DateTime nextDueAt;
  final DateTime? endAt;
  final RecurringStatus status;
  final TransactionInput template;
}

class TransactionPage {
  const TransactionPage({required this.items, required this.hasMore});

  final List<LedgerTransaction> items;
  final bool hasMore;
}
