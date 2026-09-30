import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/firebase_providers.dart';
import '../data/push_repository.dart';

/// Registers (or re-registers, if the FCM token rotated) this device for
/// push — architecture §10. [register] is idempotent: it no-ops if the
/// cached token already matches the current one, so it's safe to call on
/// every login *and* every app-foreground event without spamming the
/// backend. [unregister] must be called (and awaited) before Firebase
/// sign-out completes — see AuthController.signOut.
class PushRegistrationController {
  PushRegistrationController(this._ref);
  final Ref _ref;

  Future<void> register() async {
    try {
      final fcm = _ref.read(fcmServiceProvider);
      await fcm.requestPermission();
      final token = await fcm.getToken();
      if (token == null) return;

      final storage = _ref.read(tokenStorageProvider);
      final cached = await storage.readCachedFcmToken();
      if (cached == token) return; // already registered with this token

      await _ref.read(pushRepositoryProvider).subscribe(token);
      await storage.writeCachedFcmToken(token);
    } catch (_) {
      // Best-effort — a failed push registration shouldn't block sign-in.
    }
  }

  Future<void> unregister() async {
    final storage = _ref.read(tokenStorageProvider);
    final cached = await storage.readCachedFcmToken();
    if (cached != null) {
      try {
        await _ref.read(pushRepositoryProvider).unsubscribe(cached);
      } catch (_) {
        // Best-effort — don't block sign-out on a network hiccup here.
      }
    }
    await storage.clearCachedFcmToken();
  }
}

final pushRegistrationControllerProvider = Provider<PushRegistrationController>((ref) {
  return PushRegistrationController(ref);
});