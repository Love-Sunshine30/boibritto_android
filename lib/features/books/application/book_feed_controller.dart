import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/books_repository.dart';
import '../data/models/book.dart';

class BookFeedState {
  const BookFeedState({
    required this.books,
    required this.nextCursor,
    this.loadingMore = false,
    this.query = '',
    this.genre,
  });

  final List<Book> books;
  final DateTime? nextCursor;
  final bool loadingMore;
  final String query;
  final String? genre;

  bool get hasMore => nextCursor != null;

  BookFeedState copyWith({
    List<Book>? books,
    DateTime? Function()? nextCursor,
    bool? loadingMore,
    String? query,
    String? Function()? genre,
  }) {
    return BookFeedState(
      books: books ?? this.books,
      nextCursor: nextCursor != null ? nextCursor() : this.nextCursor,
      loadingMore: loadingMore ?? this.loadingMore,
      query: query ?? this.query,
      genre: genre != null ? genre() : this.genre,
    );
  }
}

/// Feed: search + genre filter + infinite scroll (architecture §11.2).
/// See this feature's top-level note — the first page is cache-first via
/// BooksRepository's Drift-backed row cache; `loadMore` and any filter
/// change always go to network.
class BookFeedController extends AsyncNotifier<BookFeedState> {
  @override
  Future<BookFeedState> build() async {
    final page = await ref.read(booksRepositoryProvider).fetchFirstPage();
    return BookFeedState(books: page.books, nextCursor: page.nextCursor);
  }

  Future<void> search(String query) => _reload(query: query);

  Future<void> filterByGenre(String? genre) => _reload(genre: genre);

  Future<void> refresh() => _reload();

  Future<void> _reload({String? query, String? genre}) async {
    final current = state.asData?.value;
    final effectiveQuery = query ?? current?.query ?? '';
    final effectiveGenre = genre ?? current?.genre;

    // ignore: invalid_use_of_internal_member
    state = const AsyncLoading<BookFeedState>().copyWithPrevious(state);
    state = await AsyncValue.guard(() async {
      final page = await ref.read(booksRepositoryProvider).fetchFirstPage(
            q: effectiveQuery.isEmpty ? null : effectiveQuery,
            genre: effectiveGenre,
          );
      return BookFeedState(
        books: page.books,
        nextCursor: page.nextCursor,
        query: effectiveQuery,
        genre: effectiveGenre,
      );
    });
  }

  Future<void> loadMore() async {
    final current = state.asData?.value;
    if (current == null || !current.hasMore || current.loadingMore) return;

    state = AsyncData(current.copyWith(loadingMore: true));
    try {
      final page = await ref.read(booksRepositoryProvider).fetchNextPage(
            cursor: current.nextCursor!,
            q: current.query.isEmpty ? null : current.query,
            genre: current.genre,
          );
      state = AsyncData(
        current.copyWith(
          books: [...current.books, ...page.books],
          nextCursor: () => page.nextCursor,
          loadingMore: false,
        ),
      );
    } catch (_) {
      // Keep existing books on screen — don't blow away good data with an
      // error for a failed "load more" (architecture §8).
      state = AsyncData(current.copyWith(loadingMore: false));
    }
  }
}

final bookFeedControllerProvider =
    AsyncNotifierProvider<BookFeedController, BookFeedState>(BookFeedController.new);