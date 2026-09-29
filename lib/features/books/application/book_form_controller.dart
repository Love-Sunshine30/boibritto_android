import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/errors/failure.dart';
import '../../profile/application/own_profile_controller.dart';
import '../data/books_repository.dart';
import 'book_detail_controller.dart';
import 'book_feed_controller.dart';

class BookFormState {
  const BookFormState({this.submitting = false, this.errorMessage});
  final bool submitting;
  final String? errorMessage;

  BookFormState copyWith({bool? submitting, String? errorMessage}) {
    return BookFormState(
      submitting: submitting ?? this.submitting,
      errorMessage: errorMessage,
    );
  }
}

class BookFormController extends Notifier<BookFormState> {
  @override
  BookFormState build() => const BookFormState();

  Future<bool> create({
    required String title,
    required String author,
    String? genre,
    String? description,
    String? coverUrl,
  }) {
    return _run(() async {
      await ref.read(booksRepositoryProvider).create(
            title: title,
            author: author,
            genre: genre,
            description: description,
            coverUrl: coverUrl,
          );
      // The repository already upserted this book into Drift, but the
      // feed's in-memory list and My Shelf's cached profile won't include
      // it until refetched — invalidate both so it appears immediately.
      ref.invalidate(bookFeedControllerProvider);
      ref.invalidate(ownProfileControllerProvider);
    });
  }

  Future<bool> update(
    int bookId, {
    String? title,
    String? author,
    String? genre,
    String? description,
    String? coverUrl,
    bool? available,
  }) {
    return _run(() async {
      final changes = <String, dynamic>{
        if (title != null) 'title': title,
        if (author != null) 'author': author,
        if (genre != null) 'genre': genre,
        if (description != null) 'description': description,
        if (coverUrl != null) 'cover_url': coverUrl,
        if (available != null) 'available': available,
      };
      await ref.read(booksRepositoryProvider).update(bookId, changes);
      ref.invalidate(bookFeedControllerProvider);
      ref.invalidate(bookDetailControllerProvider(bookId));
      ref.invalidate(ownProfileControllerProvider);
    });
  }

  Future<bool> _run(Future<void> Function() action) async {
    state = state.copyWith(submitting: true, errorMessage: null);
    try {
      await action();
      state = state.copyWith(submitting: false);
      return true;
    } catch (e) {
      final failure = Failure.from(e);
      state = state.copyWith(
        submitting: false,
        errorMessage: failure is ValidationFailure
            ? failure.message
            : 'Something went wrong. Please try again.',
      );
      return false;
    }
  }
}

final bookFormControllerProvider =
    NotifierProvider<BookFormController, BookFormState>(BookFormController.new);