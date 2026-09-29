import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/books_repository.dart';
import '../data/models/book.dart';

/// Cache-first: emits the cached row immediately if present, then
/// refreshes from network in the background (architecture §8).
class BookDetailController extends AsyncNotifier<Book> {
  BookDetailController(this.bookId);
  final int bookId;

  @override
  Future<Book> build() async {
    final cached =
        await ref.read(booksRepositoryProvider).getCached(bookId);
    if (cached != null) {
      Future(() async {
        try {
          final fresh =
              await ref.read(booksRepositoryProvider).refresh(bookId);
          if (ref.mounted) state = AsyncValue.data(fresh);
        } catch (_) {
          // keep serving cached data
        }
      });
      return cached;
    }
    return ref.read(booksRepositoryProvider).refresh(bookId);
  }
}

final bookDetailControllerProvider =
    AsyncNotifierProvider.family<BookDetailController, Book, int>(
  BookDetailController.new,
);