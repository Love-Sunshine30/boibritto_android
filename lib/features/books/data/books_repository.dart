import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/errors/failure.dart';
import '../../../core/providers/database_provider.dart';
import '../../../core/providers/dio_provider.dart';
import 'books_local_data_source.dart';
import 'books_remote_data_source.dart';
import 'models/book.dart';

class BooksRepository {
  BooksRepository(this._remote, this._local);
  final BooksRemoteDataSource _remote;
  final BooksLocalDataSource _local;

  Future<BookPage> fetchFirstPage({String? q, String? genre}) async {
    try {
      final page = await _remote.fetchPage(q: q, genre: genre);
      await _local.upsertAll(page.books);
      return page;
    } catch (e) {
      throw Failure.from(e);
    }
  }

  Future<BookPage> fetchNextPage({
    required DateTime cursor,
    String? q,
    String? genre,
  }) async {
    try {
      final page = await _remote.fetchPage(
        cursor: cursor.toIso8601String(),
        q: q,
        genre: genre,
      );
      await _local.upsertAll(page.books);
      return page;
    } catch (e) {
      throw Failure.from(e);
    }
  }

  /// Cache-first for detail: read this synchronously first, then call
  /// [refresh] to get the current value from the network.
  Future<Book?> getCached(int id) => _local.getById(id);

  Future<Book> refresh(int id) async {
    try {
      final book = await _remote.getById(id);
      await _local.upsert(book);
      return book;
    } catch (e) {
      throw Failure.from(e);
    }
  }

  Future<Book> create({
    required String title,
    required String author,
    String? genre,
    String? description,
    String? coverUrl,
  }) async {
    try {
      final book = await _remote.create(
        title: title,
        author: author,
        genre: genre,
        description: description,
        coverUrl: coverUrl,
      );
      await _local.upsert(book);
      return book;
    } catch (e) {
      throw Failure.from(e);
    }
  }

  Future<Book> update(int id, Map<String, dynamic> changes) async {
    try {
      final book = await _remote.update(id, changes);
      await _local.upsert(book);
      return book;
    } catch (e) {
      throw Failure.from(e);
    }
  }

  Future<void> delete(int id) async {
    try {
      await _remote.delete(id);
      await _local.remove(id);
    } catch (e) {
      throw Failure.from(e);
    }
  }
}

final booksRemoteDataSourceProvider = Provider<BooksRemoteDataSource>((ref) {
  return BooksRemoteDataSource(ref.watch(dioProvider));
});

final booksLocalDataSourceProvider = Provider<BooksLocalDataSource>((ref) {
  return BooksLocalDataSource(ref.watch(databaseProvider));
});

final booksRepositoryProvider = Provider<BooksRepository>((ref) {
  return BooksRepository(
    ref.watch(booksRemoteDataSourceProvider),
    ref.watch(booksLocalDataSourceProvider),
  );
});