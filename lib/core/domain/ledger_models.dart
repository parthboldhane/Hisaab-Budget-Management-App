enum LedgerKind { income, expense, transfer }

enum TransactionStatus { pending, successful, failed, refunded, reversed }

enum TransactionSource { manualEntry, notification, sms, import }

enum CandidateState {
  needsReview,
  confirmed,
  ignored,
  duplicateReviewPending,
}

enum BudgetMode { fixedAmount, allocationPercentage }

enum BudgetPeriod { daily, weekly, monthly, yearly, custom }

enum AllocationGroup { needs, wants, savings, custom }

enum IncomeBaseMode {
  allIncome,
  confirmedIncomeOnly,
  netMonthlyAmount,
  custom,
}

enum ReportPeriod { daily, weekly, monthly, yearly }

enum RecurringCadence { daily, weekly, monthly, yearly, custom }

enum RecurringStatus { active, paused, completed, archived }
enum ExpenseBehavior { fixed, variable }

enum TrackingPermissionState {
  notRequested,
  granted,
  denied,
  unavailable,
  disabledByPolicy,
}

String enumValue(Object value) =>
    value.toString().split('.').last.replaceAllMapped(
      RegExp('[A-Z]'),
      (match) => '_${match.group(0)!.toLowerCase()}',
    );

T enumFromValue<T extends Enum>(List<T> values, String value) {
  for (final item in values) {
    if (enumValue(item) == value) return item;
  }
  throw FormatException('Unknown ${T.toString()} value: $value');
}

class Money {
  const Money({required this.amountMinor, this.currencyCode = 'INR'})
    : assert(amountMinor >= 0);

  final int amountMinor;
  final String currencyCode;

  Money operator +(Money other) {
    _requireSameCurrency(other);
    return Money(
      amountMinor: amountMinor + other.amountMinor,
      currencyCode: currencyCode,
    );
  }

  Money operator -(Money other) {
    _requireSameCurrency(other);
    final result = amountMinor - other.amountMinor;
    if (result < 0) {
      throw StateError('Money subtraction cannot produce a negative amount.');
    }
    return Money(amountMinor: result, currencyCode: currencyCode);
  }

  void _requireSameCurrency(Money other) {
    if (currencyCode != other.currencyCode) {
      throw ArgumentError('Cannot combine different currencies.');
    }
  }

  @override
  bool operator ==(Object other) =>
      other is Money &&
      other.amountMinor == amountMinor &&
      other.currencyCode == currencyCode;

  @override
  int get hashCode => Object.hash(amountMinor, currencyCode);
}

class AccountBalance {
  const AccountBalance({
    required this.accountId,
    required this.name,
    required this.currencyCode,
    required this.balanceMinor,
    required this.isArchived,
  });

  final String accountId;
  final String name;
  final String currencyCode;
  final int balanceMinor;
  final bool isArchived;
}

class PeriodRange {
  const PeriodRange({required this.startDate, required this.endDate});

  final DateTime startDate;
  final DateTime endDate;
}

class TransactionFilter {
  const TransactionFilter({
    this.startDate,
    this.endDate,
    this.accountId,
    this.categoryId,
    this.kind,
    this.status,
    this.source,
    this.searchText,
    this.minAmountMinor,
    this.maxAmountMinor,
    this.includeDeleted = false,
  });

  final DateTime? startDate;
  final DateTime? endDate;
  final String? accountId;
  final String? categoryId;
  final LedgerKind? kind;
  final TransactionStatus? status;
  final TransactionSource? source;
  final String? searchText;
  final int? minAmountMinor;
  final int? maxAmountMinor;
  final bool includeDeleted;
}

class PageRequest {
  const PageRequest({this.offset = 0, this.limit = 50})
    : assert(offset >= 0),
      assert(limit > 0);

  final int offset;
  final int limit;
}

class TransactionInput {
  const TransactionInput({
    required this.kind,
    required this.amountMinor,
    required this.currencyCode,
    required this.occurredAtUtc,
    required this.localDateKey,
    required this.status,
    this.accountId,
    this.sourceAccountId,
    this.destinationAccountId,
    this.categoryId,
    this.subcategoryId,
    this.paymentMethodId,
    this.description,
    this.externalReference,
    this.occurredLocalOffsetMinutes,
    this.occurredTimezoneId,
    this.source = TransactionSource.manualEntry,
    this.expenseBehavior,
    this.allocationGroup,
    this.allocationGroupName,
  });

  final LedgerKind kind;
  final int amountMinor;
  final String currencyCode;
  final DateTime occurredAtUtc;
  final String localDateKey;
  final TransactionStatus status;
  final String? accountId;
  final String? sourceAccountId;
  final String? destinationAccountId;
  final String? categoryId;
  final String? subcategoryId;
  final String? paymentMethodId;
  final String? description;
  final String? externalReference;
  final int? occurredLocalOffsetMinutes;
  final String? occurredTimezoneId;
  final TransactionSource source;
  final ExpenseBehavior? expenseBehavior;
  final AllocationGroup? allocationGroup;
  final String? allocationGroupName;
}

class LedgerTransaction {
  const LedgerTransaction({
    required this.id,
    required this.kind,
    required this.amountMinor,
    required this.currencyCode,
    required this.occurredAtUtc,
    required this.localDateKey,
    required this.status,
    required this.source,
    required this.accountId,
    required this.sourceAccountId,
    required this.destinationAccountId,
    required this.categoryId,
    required this.subcategoryId,
    required this.paymentMethodId,
    required this.description,
    required this.externalReference,
    required this.createdAt,
    required this.updatedAt,
    required this.occurredLocalOffsetMinutes,
    required this.occurredTimezoneId,
    this.originalSourceId,
    this.expenseBehavior,
    this.allocationGroup,
    this.allocationGroupName,
  });

  final String id;
  final LedgerKind kind;
  final int amountMinor;
  final String currencyCode;
  final DateTime occurredAtUtc;
  final String localDateKey;
  final TransactionStatus status;
  final TransactionSource source;
  final String? accountId;
  final String? sourceAccountId;
  final String? destinationAccountId;
  final String? categoryId;
  final String? subcategoryId;
  final String? paymentMethodId;
  final String? description;
  final String? externalReference;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int? occurredLocalOffsetMinutes;
  final String? occurredTimezoneId;
  final String? originalSourceId;
  final ExpenseBehavior? expenseBehavior;
  final AllocationGroup? allocationGroup;
  final String? allocationGroupName;
}

class AccountInput {
  const AccountInput({
    required this.name,
    required this.kind,
    required this.currencyCode,
    this.openingBalanceMinor = 0,
  });

  final String name;
  final String kind;
  final String currencyCode;
  final int openingBalanceMinor;
}

class CategoryInput {
  const CategoryInput({
    required this.name,
    required this.kind,
    this.parentCategoryId,
  });

  final String name;
  final LedgerKind kind;
  final String? parentCategoryId;
}

class PaymentMethodInput {
  const PaymentMethodInput({
    required this.name,
    this.accountId,
    this.isActive = true,
  });

  final String name;
  final String? accountId;
  final bool isActive;
}

class NormalizedCandidateInput {
  const NormalizedCandidateInput({
    required this.source,
    required this.kind,
    required this.amountMinor,
    required this.currencyCode,
    required this.occurredAtUtc,
    required this.localDateKey,
    required this.status,
    this.accountId,
    this.categoryId,
    this.paymentMethodId,
    this.description,
    this.externalReference,
    this.sourceApp,
    this.partyDetails,
    this.sourceContext,
    this.sourceAccountId,
    this.destinationAccountId,
    this.confidence = 0,
    this.occurredLocalOffsetMinutes,
    this.occurredTimezoneId,
    this.expenseBehavior,
    this.allocationGroup,
    this.allocationGroupName,
  }) : assert(source != TransactionSource.manualEntry);

  final TransactionSource source;
  final LedgerKind kind;
  final int amountMinor;
  final String currencyCode;
  final DateTime occurredAtUtc;
  final String localDateKey;
  final TransactionStatus status;
  final String? accountId;
  final String? categoryId;
  final String? paymentMethodId;
  final String? description;
  final String? externalReference;
  final String? sourceApp;
  final String? partyDetails;
  final String? sourceContext;
  final String? sourceAccountId;
  final String? destinationAccountId;
  final double confidence;
  final int? occurredLocalOffsetMinutes;
  final String? occurredTimezoneId;
  final ExpenseBehavior? expenseBehavior;
  final AllocationGroup? allocationGroup;
  final String? allocationGroupName;
}

class CandidateMatch {
  const CandidateMatch({
    required this.relatedId,
    required this.relatedType,
    required this.reason,
    required this.confidence,
  });

  final String relatedId;
  final String relatedType;
  final String reason;
  final double confidence;
}

class CandidateReviewItem {
  const CandidateReviewItem({
    required this.id,
    required this.state,
    required this.input,
    required this.matches,
  });

  final String id;
  final CandidateState state;
  final NormalizedCandidateInput input;
  final List<CandidateMatch> matches;
}

class CategoryTotal {
  const CategoryTotal({
    required this.categoryId,
    required this.categoryName,
    required this.amountMinor,
  });

  final String? categoryId;
  final String categoryName;
  final int amountMinor;
}

class DailyTotal {
  const DailyTotal({required this.localDateKey, required this.amountMinor});

  final String localDateKey;
  final int amountMinor;
}

class FinanceReport {
  const FinanceReport({
    required this.period,
    required this.currencyCode,
    required this.incomeMinor,
    required this.expenseMinor,
    required this.netMinor,
    required this.averageDailySpendMinor,
    required this.highestSpendingDay,
    required this.categoryTotals,
    required this.dailyTrend,
    required this.fixedExpenseMinor,
    required this.variableExpenseMinor,
  });

  final PeriodRange period;
  final String currencyCode;
  final int incomeMinor;
  final int expenseMinor;
  final int netMinor;
  final int averageDailySpendMinor;
  final DailyTotal? highestSpendingDay;
  final List<CategoryTotal> categoryTotals;
  final List<DailyTotal> dailyTrend;
  final int fixedExpenseMinor;
  final int variableExpenseMinor;
}

class PeriodComparison {
  const PeriodComparison({required this.periodA, required this.periodB});

  final FinanceReport periodA;
  final FinanceReport periodB;
}

class BudgetInput {
  const BudgetInput({
    required this.periodType,
    required this.periodKey,
    required this.mode,
    required this.currencyCode,
    this.categoryId,
    this.planId,
    this.name,
    this.allocationGroup,
    this.allocationPercentage,
    this.limitMinor,
    this.incomeBaseMode,
    this.alertThresholdMinor,
  });

  final BudgetPeriod periodType;
  final String periodKey;
  final BudgetMode mode;
  final String currencyCode;
  final String? categoryId;
  final String? planId;
  final String? name;
  final AllocationGroup? allocationGroup;
  final int? allocationPercentage;
  final int? limitMinor;
  final IncomeBaseMode? incomeBaseMode;
  final int? alertThresholdMinor;
}

class AllocationPlanInput {
  const AllocationPlanInput({
    required this.planId,
    required this.periodType,
    required this.periodKey,
    required this.incomeBaseMode,
    required this.allocations,
    this.customIncomeBaseMinor,
  });

  final String planId;
  final BudgetPeriod periodType;
  final String periodKey;
  final IncomeBaseMode incomeBaseMode;
  final List<AllocationInput> allocations;
  final int? customIncomeBaseMinor;
}

class AllocationInput {
  const AllocationInput({
    required this.group,
    required this.percentage,
    this.name,
  });

  final AllocationGroup group;
  final int percentage;
  final String? name;
}

class SavingsGoalInput {
  const SavingsGoalInput({
    required this.name,
    required this.targetMinor,
    required this.currencyCode,
    this.deadline,
    this.accountId,
  });

  final String name;
  final int targetMinor;
  final String currencyCode;
  final DateTime? deadline;
  final String? accountId;
}

class SavingsContributionInput {
  const SavingsContributionInput({
    required this.goalId,
    required this.amountMinor,
    required this.currencyCode,
    required this.occurredAt,
    this.transactionId,
    this.note,
  });

  final String goalId;
  final int amountMinor;
  final String currencyCode;
  final DateTime occurredAt;
  final String? transactionId;
  final String? note;
}

class RecurringPlanInput {
  const RecurringPlanInput({
    required this.name,
    required this.cadence,
    required this.startAt,
    required this.nextDueAt,
    required this.template,
    this.endAt,
  });

  final String name;
  final RecurringCadence cadence;
  final DateTime startAt;
  final DateTime nextDueAt;
  final DateTime? endAt;
  final TransactionInput template;
}

class DashboardSummary {
  const DashboardSummary({
    required this.period,
    required this.currencyCode,
    required this.incomeMinor,
    required this.expenseMinor,
    required this.netMinor,
    required this.accountBalances,
    required this.openCandidateCount,
    required this.savingsContributedMinor,
  });

  final PeriodRange period;
  final String currencyCode;
  final int incomeMinor;
  final int expenseMinor;
  final int netMinor;
  final List<AccountBalance> accountBalances;
  final int openCandidateCount;
  final int savingsContributedMinor;
}
