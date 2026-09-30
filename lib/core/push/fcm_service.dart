import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

/// Must be a top-level (or static) function — required by firebase_messaging
/// for background/terminated message handling on Android. No
/// Firebase.initializeApp() call needed here — the plugin re-initializes
/// the default app in its own background isolate.
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint('[fcm] background message: ${message.data}');
}

/// Thin wrapper over FirebaseMessaging — token fetch/refresh and the
/// foreground/background message streams. Doesn't decide what to *do* with
/// a message (that's notification_router.dart) or persist anything (that's
/// push_registration_controller.dart + TokenStorage).
class FcmService {
  FcmService(this._messaging);
  final FirebaseMessaging _messaging;

  Future<void> requestPermission() async {
    await _messaging.requestPermission(alert: true, badge: true, sound: true);
  }

  Future<String?> getToken() => _messaging.getToken();

  Stream<String> get onTokenRefresh => _messaging.onTokenRefresh;

  /// Fires while the app is in the foreground.
  Stream<RemoteMessage> get onForegroundMessage => FirebaseMessaging.onMessage;

  /// Fires when the user taps a notification and the app was backgrounded
  /// (not terminated).
  Stream<RemoteMessage> get onMessageOpenedApp => FirebaseMessaging.onMessageOpenedApp;

  /// The message that launched the app from a terminated state, if any —
  /// checked once at startup.
  Future<RemoteMessage?> getInitialMessage() => _messaging.getInitialMessage();
}