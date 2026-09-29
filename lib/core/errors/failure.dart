import 'package:dio/dio.dart';

import 'api_exception.dart';

/// The single type every screen switches on — never raw [DioException] or
/// [ApiException]. See architecture §12.
sealed class Failure {
  const Failure();

  /// Maps a caught error (typically an [ApiException] thrown by
  /// `ErrorInterceptor`, or a raw [DioException] for connectivity issues)
  /// into a [Failure]. Repositories call this instead of re-implementing the
  /// same switch — see architecture §12's "small mapping function in each
  /// repository", centralized here to avoid duplicating the code/message
  /// table per feature.
  factory Failure.from(Object error) {
    if (error is ApiException) {
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
    if (error is DioException) {
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