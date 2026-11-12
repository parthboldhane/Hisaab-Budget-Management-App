import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../application/finance_services.dart';
import '../domain/service_contracts.dart';
import 'android_local_adapters.dart';
import 'app_database.dart';
import 'drift_hisaab_repository.dart';
import 'local_file_services.dart';

class DefaultHisaabServices implements HisaabServices {
  DefaultHisaabServices({
    required this._repository,
    required this.csv,
    required this.backups,
    required this.notificationTracking,
    required this.localSecurity,
  });

  final DriftHisaabRepository _repository;

  @override
  final CsvDataService csv;

  @override
  final LocalBackupService backups;

  @override
  final NotificationTrackingAdapter notificationTracking;

  @override
  final LocalSecurityService localSecurity;

  @override
  DriftHisaabRepository get accounts => _repository;

  @override
  DriftHisaabRepository get transactions => _repository;

  @override
  DriftHisaabRepository get catalog => _repository;

  @override
  DriftHisaabRepository get budgets => _repository;

  @override
  DriftHisaabRepository get candidates => _repository;

  @override
  DriftHisaabRepository get settings => _repository;
}

final localDatabaseProvider = FutureProvider<AppDatabase>((ref) async {
  final database = await openLocalDatabase();
  ref.onDispose(() => unawaited(database.close()));
  return database;
});

final hisaabServicesProvider = FutureProvider<HisaabServices>((ref) async {
  final database = await ref.watch(localDatabaseProvider.future);
  final repository = DriftHisaabRepository(database);
  final files = LocalFileServices(
    database: database,
    transactions: repository,
    candidates: repository,
  );
  return DefaultHisaabServices(
    repository: repository,
    csv: files,
    backups: files,
    notificationTracking: MethodChannelNotificationTrackingAdapter(),
    localSecurity: const DeferredLocalSecurityService(),
  );
});

final ledgerApplicationServiceProvider =
    Provider<AsyncValue<LedgerApplicationService>>(
      (ref) => ref
          .watch(hisaabServicesProvider)
          .whenData(
            (services) => LedgerApplicationService(services.transactions),
          ),
    );

final candidateApplicationServiceProvider =
    Provider<AsyncValue<CandidateApplicationService>>(
      (ref) => ref
          .watch(hisaabServicesProvider)
          .whenData(
            (services) => CandidateApplicationService(services.candidates),
          ),
    );

final budgetApplicationServiceProvider =
    Provider<AsyncValue<BudgetApplicationService>>(
      (ref) => ref
          .watch(hisaabServicesProvider)
          .whenData((services) => BudgetApplicationService(services.budgets)),
    );

final localPreferencesServiceProvider =
    Provider<AsyncValue<LocalPreferencesService>>(
      (ref) => ref
          .watch(hisaabServicesProvider)
          .whenData((services) => LocalPreferencesService(services.settings)),
    );

final candidateOnlyTrackingBridgeProvider =
    Provider<AsyncValue<CandidateOnlyTrackingBridge>>(
      (ref) => ref
          .watch(hisaabServicesProvider)
          .whenData(
            (services) => CandidateOnlyTrackingBridge(
              candidates: services.candidates,
              settings: services.settings,
            ),
          ),
    );
