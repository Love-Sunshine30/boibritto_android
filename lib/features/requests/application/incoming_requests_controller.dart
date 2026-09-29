import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../profile/application/own_profile_controller.dart';
import '../data/models/borrow_request.dart';
import '../data/requests_repository.dart';

class IncomingRequestsController extends AsyncNotifier<List<BorrowRequest>> {
  @override
  Future<List<BorrowRequest>> build() async {
    final profile = await ref.watch(ownProfileControllerProvider.future);
    final repo = ref.read(requestsRepositoryProvider);
    final cached = await repo.getCachedIncoming(profile.user.id);

    if (cached.isNotEmpty) {
      Future(() async {
        try {
          final fresh = await repo.refreshIncoming();
          if (ref.mounted) state = AsyncData(fresh);
        } catch (_) {
          // keep serving cached data
        }
      });
      return cached;
    }
    return repo.refreshIncoming();
  }

  Future<void> refresh() async {
    state = const AsyncLoading<List<BorrowRequest>>().copyWithPrevious(state);
    state = await AsyncValue.guard(() => ref.read(requestsRepositoryProvider).refreshIncoming());
  }
}

final incomingRequestsControllerProvider =
    AsyncNotifierProvider<IncomingRequestsController, List<BorrowRequest>>(
  IncomingRequestsController.new,
);