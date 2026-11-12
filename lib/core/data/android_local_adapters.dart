import 'dart:io';

import 'package:flutter/services.dart';

import '../domain/backend_errors.dart';
import '../domain/ledger_models.dart';
import '../domain/repository_contracts.dart';
import '../domain/service_contracts.dart';

class MethodChannelNotificationTrackingAdapter
    implements NotificationTrackingAdapter {
  MethodChannelNotificationTrackingAdapter({
    MethodChannel? channel,
    bool? isAndroid,
  }) : _channel =
           channel ?? const MethodChannel('com.hisaab.local/notifications'),
       _isAndroid = isAndroid ?? Platform.isAndroid;

  final MethodChannel _channel;
  final bool _isAndroid;

  @override
  bool get canReceiveNotifications => false;

  @override
  Future<TrackingPermissionState> getPermissionState() async {
    if (!_isAndroid) return TrackingPermissionState.unavailable;
    final status = await _channel.invokeMethod<String>('permissionStatus');
    final available = await _channel.invokeMethod<bool>('trackingAvailable');
    if (available != true) return TrackingPermissionState.unavailable;
    if (status == 'granted') return TrackingPermissionState.granted;
    if (status == 'denied') return TrackingPermissionState.denied;
    return TrackingPermissionState.notRequested;
  }

  @override
  Future<void> openSettings() async {
    if (!_isAndroid) {
      throw const BackendException(
        'Notification access settings are Android-only.',
      );
    }
    await _channel.invokeMethod<void>('openSettings');
  }
}

class CandidateOnlyTrackingBridge {
  const CandidateOnlyTrackingBridge({
    required this.candidates,
    required this.settings,
  });

  final CandidateRepository candidates;
  final SettingsRepository settings;

  Future<CandidateReviewItem> submitNotificationCandidate(
    NormalizedCandidateInput input,
  ) async {
    if (input.source != TransactionSource.notification) {
      throw const ValidationException(
        'Notification adapters may submit notification candidates only.',
      );
    }
    final enabled =
        await settings.getSetting<bool>('notification_tracking_enabled') ??
        false;
    if (!enabled) {
      throw const PermissionDeniedException(
        'Notification tracking is disabled in local settings.',
      );
    }
    return candidates.submitCandidate(input);
  }

  Future<CandidateReviewItem> submitPolicyEligibleSmsCandidate(
    NormalizedCandidateInput input,
  ) async {
    if (input.source != TransactionSource.sms) {
      throw const ValidationException(
        'SMS adapters may submit SMS candidates only.',
      );
    }
    final enabled =
        await settings.getSetting<bool>('sms_tracking_enabled') ?? false;
    final eligible =
        await settings.getSetting<bool>('sms_policy_eligible') ?? false;
    if (!enabled || !eligible) {
      throw const PermissionDeniedException(
        'SMS tracking is disabled or not policy-eligible.',
      );
    }
    return candidates.submitCandidate(input);
  }
}

class DeferredLocalSecurityService implements LocalSecurityService {
  const DeferredLocalSecurityService();

  @override
  Future<bool> authenticate() => Future<bool>.error(
    UnsupportedError('Biometric and PIN authentication are deferred.'),
  );

  @override
  Future<void> clearPin() => Future<void>.error(
    UnsupportedError('PIN management is deferred.'),
  );

  @override
  Future<void> setPin(String pin) => Future<void>.error(
    UnsupportedError('PIN management is deferred.'),
  );
}
