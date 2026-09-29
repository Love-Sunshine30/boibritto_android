import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/errors/failure.dart';
import '../../books/application/book_detail_controller.dart';
import '../../books/application/book_feed_controller.dart';
import '../../profile/application/own_profile_controller.dart';
import '../data/models/borrow_request.dart';
import '../data/requests_repository.dart';
import 'incoming_requests_controller.dart';
import 'request_detail_controller.dart';
import 'sent_requests_controller.dart';

class RequestActionState {
  const RequestActionState({this.submitting = false, this.errorMessage});
  final bool submitting;
  final String? errorMessage;

  RequestActionState copyWith({bool? submitting, String? errorMessage}) {
    return RequestActionState(
      submitting: submitting ?? this.submitting,
      errorMessage: errorMessage,
    );
  }
}

/// One shared submitting flag — only one action button is ever shown at a
/// time per screen (architecture §11.5–§11.7).
class RequestActionController extends Notifier<RequestActionState> {
  @override
  RequestActionState build() => const RequestActionState();

  Future<bool> accept(int id) => _run(() => ref.read(requestsRepositoryProvider).accept(id));
  Future<bool> reject(int id) => _run(() => ref.read(requestsRepositoryProvider).reject(id));
  Future<bool> confirmHandoff(int id) =>
      _run(() => ref.read(requestsRepositoryProvider).confirmHandoff(id));
  Future<bool> markReturned(int id) =>
      _run(() => ref.read(requestsRepositoryProvider).markReturned(id));

  Future<bool> _run(Future<BorrowRequest> Function() action) async {
    state = state.copyWith(submitting: true, errorMessage: null);
    try {
      final updated = await action();
      ref.invalidate(requestDetailControllerProvider(updated.id));
      ref.invalidate(sentRequestsControllerProvider);
      ref.invalidate(incomingRequestsControllerProvider);
      // Only matters for confirmHandoff/markReturned (book availability
      // changed); harmless no-op invalidation otherwise.
      ref.invalidate(bookDetailControllerProvider(updated.bookId));
      ref.invalidate(bookFeedControllerProvider);
      ref.invalidate(ownProfileControllerProvider);
      state = state.copyWith(submitting: false);
      return true;
    } catch (e) {
      final failure = Failure.from(e);
      state = state.copyWith(
        submitting: false,
        errorMessage: (failure is ConflictFailure || failure is ValidationFailure)
            ? (failure as dynamic).message as String
            : 'Something went wrong. Please try again.',
      );
      return false;
    }
  }
}

final requestActionControllerProvider =
    NotifierProvider<RequestActionController, RequestActionState>(
  RequestActionController.new,
);