import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/errors/failure.dart';
import '../data/models/borrow_request.dart';
import '../data/requests_repository.dart';

/// See this feature's top-level note — no GET /requests/{id} exists, so
/// this reads the local cache only, populated by Sent/Incoming or by a
/// create/action response.
class RequestDetailController extends AsyncNotifier<BorrowRequest> {
  RequestDetailController(this.requestId);
  final int requestId;

  @override
  Future<BorrowRequest> build() async {
    final cached =
        await ref.read(requestsRepositoryProvider).getCached(requestId);
    if (cached == null) {
      throw const NotFoundFailure();
    }
    return cached;
  }
}

final requestDetailControllerProvider =
    AsyncNotifierProvider.family<RequestDetailController, BorrowRequest, int>(
  RequestDetailController.new,
);