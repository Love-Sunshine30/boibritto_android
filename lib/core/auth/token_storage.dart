import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Thin wrapper over flutter_secure_storage (Android Keystore-backed). Used
/// for app-level secrets that aren't Firebase's job — currently just the
/// cached FCM token, wired up in features/push (step 6). The Firebase ID
/// token itself is never stored here — the SDK already caches/refreshes it.
class TokenStorage {
  TokenStorage([FlutterSecureStorage? storage])
      : _storage = storage ?? const FlutterSecureStorage();

  final FlutterSecureStorage _storage;

  static const _fcmTokenKey = 'cached_fcm_token';

  Future<String?> readCachedFcmToken() => _storage.read(key: _fcmTokenKey);

  Future<void> writeCachedFcmToken(String token) =>
      _storage.write(key: _fcmTokenKey, value: token);

  Future<void> clearCachedFcmToken() => _storage.delete(key: _fcmTokenKey);
}