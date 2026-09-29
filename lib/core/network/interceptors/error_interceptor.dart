import 'package:dio/dio.dart';

import '../../errors/api_exception.dart';

/// Parses every non-2xx response against the backend's
/// `ErrorEnvelope { error: { code, message } }` shape and rethrows it as a
/// typed [ApiException] (carried as `DioException.error`), so downstream
/// code never touches raw status codes.
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final data = err.response?.data;
    ApiException apiException;

    if (data is Map && data['error'] is Map) {
      final error = data['error'] as Map;
      apiException = ApiException(
        code: (error['code'] as String?) ?? 'unknown',
        message: (error['message'] as String?) ?? 'Something went wrong.',
        statusCode: err.response?.statusCode,
      );
    } else {
      apiException = ApiException(
        code: 'unknown',
        message: err.message ?? 'Something went wrong.',
        statusCode: err.response?.statusCode,
      );
    }

    handler.next(
      err.copyWith(error: apiException),
    );
  }
}