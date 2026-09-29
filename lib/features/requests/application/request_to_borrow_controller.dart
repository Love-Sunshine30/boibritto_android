import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/errors/failure.dart';
import '../data/models/borrow_request.dart';
import '../data/requests_repository.dart';
import 'sent_requests_controller.dart';

class RequestToBorrowState {
  const RequestToBorrowState({this.submitting = false, this.errorMessage});
  final bool submitting;
  final String? errorMessage;

  RequestToBorrowState copyWith({bool? submitting, String? errorMessage}) {
    return RequestToBorrowState(
      submitting: submitting ?? this.submitting,
      errorMessage: errorMessage,
    );
  }
}

class RequestToBorrowController extends Notifier<RequestToBorrowState> {
  @override
  RequestToBorrowState build() => const RequestToBorrowState();

  /// Returns the created request on success, or null on failure (message
  /// left in state for the caller to show).
  Future<BorrowRequest?> submit(int bookId, {String? message}) async {
    state = state.copyWith(submitting: true, errorMessage: null);
    try {
      final request =
          await ref.read(requestsRepositoryProvider).create(bookId, message: message);
      ref.invalidate(sentRequestsControllerProvider);
      state = state.copyWith(submitting: false);
      return request;
    } catch (e) {
      final failure = Failure.from(e);
      // 409 ("already have a pending request for this book") is a named,
      // expected case shown inline (architecture §11.4). The error
      // envelope doesn't carry the existing request's id, so we can't
      // deep-link straight to it — just the message.
      state = state.copyWith(
        submitting: false,
        errorMessage: (failure is ConflictFailure || failure is ValidationFailure)
            ? (failure as dynamic).message as String
            : 'Something went wrong. Please try again.',
      );
      return null;
    }
  }
}

final requestToBorrowControllerProvider =
    NotifierProvider<RequestToBorrowController, RequestToBorrowState>(
  RequestToBorrowController.new,
);