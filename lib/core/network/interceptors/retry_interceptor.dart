import 'dart:async';

import 'package:dio/dio.dart';

/// Retries GET requests on connectivity/timeout errors only — never on a
/// 4xx/5xx that actually reached the server. Exponential backoff, max 2
/// retries. Mutating calls (`POST`/`PATCH`/`DELETE`) are deliberately never
/// retried here — see architecture §5's idempotency note.
class RetryInterceptor extends Interceptor {
  RetryInterceptor({required this.dio, this.maxRetries = 2});

  final Dio dio;
  final int maxRetries;

  static const _retryCountKey = 'boibritto_retry_count';

  static const _retryableTypes = {
    DioExceptionType.connectionError,
    DioExceptionType.connectionTimeout,
    DioExceptionType.receiveTimeout,
    DioExceptionType.sendTimeout,
  };

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final options = err.requestOptions;
    final isGet = options.method.toUpperCase() == 'GET';
    final isRetryable = _retryableTypes.contains(err.type);
    final attempt = (options.extra[_retryCountKey] as int?) ?? 0;

    if (!isGet || !isRetryable || attempt >= maxRetries) {
      handler.next(err);
      return;
    }

    final delay = Duration(milliseconds: 300 * (1 << attempt)); // 300ms, 600ms
    await Future<void>.delayed(delay);

    try {
      options.extra[_retryCountKey] = attempt + 1;
      final response = await dio.fetch(options);
      handler.resolve(response);
    } on DioException catch (retryError) {
      handler.next(retryError);
    }
  }
}