import '../domain/backend_errors.dart';
import '../domain/ledger_models.dart';
import '../domain/repository_contracts.dart';

class LedgerApplicationService {
  const LedgerApplicationService(this.repository);

  final TransactionRepository repository;

  Future<LedgerTransaction> createManualTransaction(
    TransactionInput input,
  ) async {
    if (input.source != TransactionSource.manualEntry) {
      throw const ValidationException(
        'Manual transaction creation requires a manual source.',
      );
    }
    if (input.kind == LedgerKind.transfer) {
      throw const ValidationException(
        'Use createManualTransfer for transfer entries.',
      );
    }
    return repository.createTransaction(input);
  }

  Future<LedgerTransaction> createManualTransfer(TransactionInput input) {
    if (input.source != TransactionSource.manualEntry ||
        input.kind != LedgerKind.transfer) {
      throw const ValidationException(
        'Manual transfer creation requires a manual transfer entry.',
      );
    }
    return repository.createTransaction(input);
  }

  Future<LedgerTransaction> update(String id, TransactionInput input) =>
      repository.updateTransaction(id, input);

  Future<void> delete(String id) => repository.deleteTransaction(id);

  Future<List<LedgerTransaction>> list(
    TransactionFilter filter, {
    PageRequest page = const PageRequest(),
  }) => repository.listTransactions(filter, page: page);

  Stream<List<LedgerTransaction>> watch(TransactionFilter filter) =>
      repository.watchTransactions(filter);

  Future<DashboardSummary> dashboard(PeriodRange period) =>
      repository.getDashboard(period);

  Future<FinanceReport> report(PeriodRange period) =>
      repository.getReport(period);

  Future<PeriodComparison> compare(PeriodRange first, PeriodRange second) =>
      repository.comparePeriods(first, second);
}

class CandidateApplicationService {
  const CandidateApplicationService(this.repository);

  final CandidateRepository repository;

  Future<List<CandidateReviewItem>> pendingReview() =>
      repository.listCandidates(
        states: const <CandidateState>{
          CandidateState.needsReview,
          CandidateState.duplicateReviewPending,
        },
      );

  Future<LedgerTransaction> confirm(
    String id, {
    TransactionInput? corrections,
  }) => repository.confirmCandidate(id, corrections: corrections);

  Future<void> ignore(String id) => repository.ignoreCandidate(id);
}

class BudgetApplicationService {
  const BudgetApplicationService(this.repository);

  final BudgetRepository repository;

  Future<String> createFixedBudget(BudgetInput input) {
    if (input.mode != BudgetMode.fixedAmount) {
      throw const ValidationException(
        'Fixed-budget use case does not accept percentage plans.',
      );
    }
    return repository.createFixedBudget(input);
  }

  Future<void> saveAllocationPlan(AllocationPlanInput input) =>
      repository.saveAllocationPlan(input);

  Future<int> actual(String budgetId) =>
      repository.getBudgetActualMinor(budgetId);

  Future<int> allocationAmount(String budgetId) =>
      repository.getBudgetAllocationAmountMinor(budgetId);
}

class LocalPreferencesService {
  const LocalPreferencesService(this.repository);

  final SettingsRepository repository;

  Future<String> themeMode() async =>
      await repository.getSetting<String>('theme_mode') ?? 'system';

  Future<void> setThemeMode(String value) async {
    if (!const <String>{'system', 'light', 'dark'}.contains(value)) {
      throw const ValidationException(
        'Theme mode must be system, light, or dark.',
      );
    }
    await repository.setSetting<String>('theme_mode', value);
  }

  Future<String> defaultCurrency() async =>
      await repository.getSetting<String>('default_currency') ?? 'INR';
}
