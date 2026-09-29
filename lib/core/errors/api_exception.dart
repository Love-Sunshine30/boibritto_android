/// Typed exception mirroring the backend's `apperror` sentinels. Thrown by
/// `ErrorInterceptor` for every non-2xx response; downstream code never
/// inspects raw status codes — it switches on [code].
class ApiException implements Exception {
  const ApiException({
    required this.code,
    required this.message,
    this.statusCode,
  });

  final String code;
  final String message;
  final int? statusCode;

  @override
  String toString() =>
      'ApiException(code: $code, statusCode: $statusCode, message: $message)';
}

/// Known `error.code` values from the backend's `ErrorEnvelope`. Not
/// exhaustive by design — anything unrecognized falls through to
/// [Failure.unknown] in `failure.dart`.
abstract class ApiErrorCode {
  static const validationFailed = 'validation_failed';
  static const unauthorized = 'unauthorized';
  static const forbidden = 'forbidden';
  static const notFound = 'not_found';
  static const conflict = 'conflict';
  static const internalError = 'internal_error';
  static const tooManyRequests = 'too_many_requests';
}