import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/messages_repository.dart';
import '../data/models/thread_summary.dart';

class ThreadListController extends AsyncNotifier<List<ThreadSummary>> {
  @override
  Future<List<ThreadSummary>> build() async {
    final repo = ref.read(messagesRepositoryProvider);
    final cached = await repo.getCachedThreads();

    if (cached.isNotEmpty) {
      Future(() async {
        try {
          final fresh = await repo.refreshThreads();
          if (ref.mounted) state = AsyncData(fresh);
        } catch (_) {
          // keep serving cached data
        }
      });
      return cached;
    }
    return repo.refreshThreads();
  }

  Future<void> refresh() async {
    // ignore: invalid_use_of_internal_member
    state = const AsyncLoading<List<ThreadSummary>>().copyWithPrevious(state);
    state = await AsyncValue.guard(() => ref.read(messagesRepositoryProvider).refreshThreads());
  }
}

final threadListControllerProvider =
    AsyncNotifierProvider<ThreadListController, List<ThreadSummary>>(ThreadListController.new);