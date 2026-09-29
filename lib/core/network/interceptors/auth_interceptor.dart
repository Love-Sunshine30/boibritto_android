import 'package:dio/dio.dart';

/// Decouples AuthInterceptor from FirebaseAuth directly, so it can be unit
/// tested with a fake. `core/auth/firebase_auth_service.dart` supplies the
/// real Firebase-backed implementation.
abstract interface class TokenProvider {
  /// The current cached ID token, or null if signed out.
  Future<String?> currentToken();

  /// Forces a refresh and returns the new token, or null if signed out.
  Future<String?> refreshToken();
}

class AuthInterceptor extends Interceptor {
  AuthInterceptor({
    required this.dio,
    required this.tokenProvider,
    this.onReauthFailed,
  });

  final Dio dio;
  final TokenProvider tokenProvider;
  final Future<void> Function()? onReauthFailed;

  static const _retriedKey = 'boibritto_auth_retried';

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await tokenProvider.currentToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final alreadyRetried = err.requestOptions.extra[_retriedKey] == true;
    if (err.response?.statusCode != 401 || alreadyRetried) {
      handler.next(err);
      return;
    }

    final freshToken = await tokenProvider.refreshToken();
    if (freshToken == null) {
      handler.next(err);
      return;
    }

    try {
      final retryOptions = err.requestOptions
        ..headers['Authorization'] = 'Bearer $freshToken'
        ..extra[_retriedKey] = true;
      handler.resolve(await dio.fetch(retryOptions));
    } on DioException catch (retryError) {
      if (retryError.response?.statusCode == 401) {
        await onReauthFailed?.call();
      }
      handler.next(retryError);
    } catch (_) {
      handler.next(err);
    }
  }
}