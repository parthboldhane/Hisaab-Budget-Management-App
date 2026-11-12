package com.hisaab.hisaab

import android.content.ActivityNotFoundException
import android.content.ComponentName
import android.content.Intent
import android.provider.Settings
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val channelName = "com.hisaab.local/notifications"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channelName)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "permissionStatus" -> result.success(
                        if (hasNotificationListenerAccess()) "granted" else "denied"
                    )
                    "trackingAvailable" -> result.success(false)
                    "openSettings" -> {
                        try {
                            startActivity(
                                Intent(Settings.ACTION_NOTIFICATION_LISTENER_SETTINGS)
                            )
                            result.success(null)
                        } catch (error: ActivityNotFoundException) {
                            result.error(
                                "settings_unavailable",
                                "Notification access settings are unavailable.",
                                null
                            )
                        }
                    }
                    else -> result.notImplemented()
                }
            }
    }

    private fun hasNotificationListenerAccess(): Boolean {
        val enabledListeners = Settings.Secure.getString(
            contentResolver,
            "enabled_notification_listeners"
        ) ?: return false
        return enabledListeners.split(':').any { flattened ->
            ComponentName.unflattenFromString(flattened)?.packageName == packageName
        }
    }
}
