import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/errors/failure.dart';
import '../../profile/application/own_profile_controller.dart';
import '../data/forum_repository.dart';
import '../data/models/post.dart';

class ForumThreadState {
  const ForumThreadState({
    required this.posts,
    required this.nextCursor,
    this.loadingMore = false,
  });

  final List<Post> posts;
  final DateTime? nextCursor;
  final bool loadingMore;

  bool get hasMore => nextCursor != null;

  ForumThreadState copyWith({
    List<Post>? posts,
    DateTime? Function()? nextCursor,
    bool? loadingMore,
  }) {
    return ForumThreadState(
      posts: posts ?? this.posts,
      nextCursor: nextCursor != null ? nextCursor() : this.nextCursor,
      loadingMore: loadingMore ?? this.loadingMore,
    );
  }
}

/// Cache-first first page (architecture §8), cursor-paginated like the book
/// feed (architecture §11.10). See this step's top-level note on the
/// optimistic-Drift-vs-optimistic-state scoping decision.
class ForumThreadController extends AsyncNotifier<ForumThreadState> {
  ForumThreadController(this.bookId);
  final int bookId;

  @override
  Future<ForumThreadState> build() async {
    final repo = ref.read(forumRepositoryProvider);
    final cached = await repo.getCached(bookId);

    if (cached.isNotEmpty) {
      Future(() async {
        try {
          final page = await repo.fetchFirstPage(bookId);
          if (ref.mounted) {
            state = AsyncData(ForumThreadState(
              posts: page.posts,
              nextCursor: page.nextCursor,
            ));
          }
        } catch (_) {
          // keep serving cached data
        }
      });
      return ForumThreadState(posts: cached, nextCursor: null);
    }

    final page = await repo.fetchFirstPage(bookId);
    return ForumThreadState(posts: page.posts, nextCursor: page.nextCursor);
  }

  Future<void> loadMore() async {
    final current = state.value;
    if (current == null || !current.hasMore || current.loadingMore) return;

    state = AsyncData(current.copyWith(loadingMore: true));
    try {
      final page = await ref
          .read(forumRepositoryProvider)
          .fetchNextPage(bookId, current.nextCursor!);
      state = AsyncData(
        current.copyWith(
          posts: [...current.posts, ...page.posts],
          nextCursor: () => page.nextCursor,
          loadingMore: false,
        ),
      );
    } catch (_) {
      state = AsyncData(current.copyWith(loadingMore: false));
    }
  }

  Future<void> refresh() async {
    // ignore: invalid_use_of_internal_member
    state = const AsyncLoading<ForumThreadState>().copyWithPrevious(state);
    state = await AsyncValue.guard(() async {
      final page = await ref.read(forumRepositoryProvider).fetchFirstPage(bookId);
      return ForumThreadState(posts: page.posts, nextCursor: page.nextCursor);
    });
  }

  /// Returns null on success, or the Failure on failure (state already
  /// rolled back by the time this returns).
  Future<Failure?> createPost(String body) async {
    final current = state.value;
    if (current == null) return const UnknownFailure();

    final ownProfile = await ref.read(ownProfileControllerProvider.future);
    if (ownProfile.user.whatsappNumber == null) {
      return const ForbiddenFailure();
    }

    final optimistic = Post(
      id: -DateTime.now().millisecondsSinceEpoch, // negative = clearly not a real server id
      bookId: bookId,
      userId: ownProfile.user.id,
      userName: ownProfile.user.name,
      body: body,
      edited: false,
      createdAt: DateTime.now(),
    );
    state = AsyncData(current.copyWith(posts: [...current.posts, optimistic]));

    try {
      final real = await ref.read(forumRepositoryProvider).create(bookId, body);
      final latest = state.value ?? current;
      state = AsyncData(
        latest.copyWith(
          posts: [for (final p in latest.posts) if (p.id != optimistic.id) p, real],
        ),
      );
      return null;
    } catch (e) {
      final latest = state.value ?? current;
      state = AsyncData(
        latest.copyWith(
          posts: latest.posts.where((p) => p.id != optimistic.id).toList(),
        ),
      );
      return Failure.from(e);
    }
  }

  Future<Failure?> editPost(int postId, String body) async {
    final current = state.value;
    if (current == null) return const UnknownFailure();
    final original = current.posts.firstWhere((p) => p.id == postId);

    state = AsyncData(
      current.copyWith(
        posts: [
          for (final p in current.posts)
            if (p.id == postId) p.copyWith(body: body, edited: true) else p,
        ],
      ),
    );

    try {
      final real = await ref.read(forumRepositoryProvider).update(postId, body);
      final latest = state.value ?? current;
      state = AsyncData(
        latest.copyWith(
          posts: [for (final p in latest.posts) if (p.id == postId) real else p],
        ),
      );
      return null;
    } catch (e) {
      final latest = state.value ?? current;
      state = AsyncData(
        latest.copyWith(
          posts: [for (final p in latest.posts) if (p.id == postId) original else p],
        ),
      );
      return Failure.from(e);
    }
  }

  Future<Failure?> deletePost(int postId) async {
    final current = state.value;
    if (current == null) return const UnknownFailure();
    final removed = current.posts.firstWhere((p) => p.id == postId);
    final index = current.posts.indexOf(removed);

    state = AsyncData(
      current.copyWith(
        posts: current.posts.where((p) => p.id != postId).toList(),
      ),
    );

    try {
      await ref.read(forumRepositoryProvider).delete(postId);
      return null;
    } catch (e) {
      final latest = state.value ?? current;
      final restored = [...latest.posts]
        ..insert(index.clamp(0, latest.posts.length), removed);
      state = AsyncData(latest.copyWith(posts: restored));
      return Failure.from(e);
    }
  }
}

final forumThreadControllerProvider =
    AsyncNotifierProvider.family<ForumThreadController, ForumThreadState, int>(
  ForumThreadController.new,
);