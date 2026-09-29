import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// Debug-only request/response logging. Redacts the `Authorization` header
/// so a Firebase ID token never ends up in logcat.
class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      final headers = Map<String, dynamic>.from(options.headers);
      if (headers.containsKey('Authorization')) {
        headers['Authorization'] = '<redacted>';
      }
      debugPrint(
        '→ ${options.method} ${options.uri}\n'
        '  headers: $headers\n'
        '  data: ${options.data}',
      );
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint(
        '← ${response.statusCode} ${response.requestOptions.uri}\n'
        '  data: ${response.data}',
      );
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint(
        '✗ ${err.requestOptions.method} ${err.requestOptions.uri}\n'
        '  error: ${err.error ?? err.message}',
      );
    }
    handler.next(err);
  }
}