import 'package:dio/dio.dart';

import 'api_exception.dart';

/// The single type every screen switches on — never raw [DioException] or
/// [ApiException]. See architecture §12.
sealed class Failure {
  const Failure();

  /// Maps a caught error into a [Failure]. Handles three shapes: a raw
  /// [ApiException] (if something throws one directly), a [DioException]
  /// whose `.error` was set to an [ApiException] by `ErrorInterceptor`
  /// (the normal case for every API call), and a [DioException] with no
  /// `.error` set (connectivity/timeout, never reached the server).
  factory Failure.from(Object error) {
    if (error is ApiException) {
      return _fromApiException(error);
    }
    if (error is DioException) {
      final inner = error.error;
      if (inner is ApiException) {
        return _fromApiException(inner);
      }
      switch (error.type) {
        case DioExceptionType.connectionError:
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
          return const NetworkFailure();
        default:
          return const UnknownFailure();
      }
    }
    return const UnknownFailure();
  }
}

Failure _fromApiException(ApiException error) {
  return switch (error.code) {
    ApiErrorCode.validationFailed => ValidationFailure(error.message),
    ApiErrorCode.unauthorized => const AuthFailure(),
    ApiErrorCode.forbidden => const ForbiddenFailure(),
    ApiErrorCode.notFound => const NotFoundFailure(),
    ApiErrorCode.conflict => ConflictFailure(error.message),
    ApiErrorCode.internalError => const ServerFailure(),
    _ => const UnknownFailure(),
  };
}

/// No connectivity / timeout.
class NetworkFailure extends Failure {
  const NetworkFailure();
}

/// 401 that survived a token-refresh retry in `AuthInterceptor`.
class AuthFailure extends Failure {
  const AuthFailure();
}

/// 400 — carries the server message for inline display.
class ValidationFailure extends Failure {
  const ValidationFailure(this.message);
  final String message;
}

/// 403.
class ForbiddenFailure extends Failure {
  const ForbiddenFailure();
}

/// 404.
class NotFoundFailure extends Failure {
  const NotFoundFailure();
}

/// 409 — e.g. duplicate borrow request. Carries the server message so the UI
/// can show it inline instead of a generic error toast (architecture §11.4).
class ConflictFailure extends Failure {
  const ConflictFailure(this.message);
  final String message;
}

/// 5xx / internal_error.
class ServerFailure extends Failure {
  const ServerFailure();
}

class UnknownFailure extends Failure {
  const UnknownFailure();
}