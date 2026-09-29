import 'package:dio/dio.dart';

import '../config/app_config.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/error_interceptor.dart';
import 'interceptors/logging_interceptor.dart';
import 'interceptors/retry_interceptor.dart';

/// Builds the single [Dio] instance the app uses, with the fixed
/// interceptor order from architecture §5:
///   1. AuthInterceptor  — attach/refresh the Firebase ID token
///   2. ErrorInterceptor — map non-2xx responses to [ApiException]
///   3. RetryInterceptor — retry idempotent GETs on connectivity failure
///   4. LoggingInterceptor — debug-only

Dio buildDioClient({
  required TokenProvider tokenProvider,
  Future<void> Function()? onReauthFailed,
}) {
  final dio = Dio(
    BaseOptions(
      baseUrl: AppConfig.instance.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 15),
    ),
  );

  dio.interceptors.addAll([
    AuthInterceptor(dio: dio, tokenProvider: tokenProvider, onReauthFailed: onReauthFailed),
    ErrorInterceptor(),
    RetryInterceptor(dio: dio),
    LoggingInterceptor(),
  ]);

  return dio;
}