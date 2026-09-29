import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/errors/failure.dart';
import '../../../core/providers/database_provider.dart';
import '../../../core/providers/dio_provider.dart';
import '../../books/data/books_local_data_source.dart';
import 'models/borrow_request.dart';
import 'requests_local_data_source.dart';
import './requsts_remote_data_source.dart';

/// NOTE: depends on `features/books`'s local data source directly — a
/// deliberate exception to the usual one-feature-per-repository rule, for
/// the write-through book-availability patch architecture §8 describes.
class RequestsRepository {
  RequestsRepository(this._remote, this._local, this._booksLocal);
  final RequestsRemoteDataSource _remote;
  final RequestsLocalDataSource _local;
  final BooksLocalDataSource _booksLocal;

  Future<BorrowRequest?> getCached(int id) => _local.getById(id);
  Future<List<BorrowRequest>> getCachedSent(int userId) => _local.getByRequester(userId);
  Future<List<BorrowRequest>> getCachedIncoming(int userId) => _local.getByOwner(userId);

  Future<List<BorrowRequest>> refreshSent() async {
    try {
      final list = await _remote.fetchSent();
      await _local.upsertAll(list);
      return list;
    } catch (e) {
      throw Failure.from(e);
    }
  }

  Future<List<BorrowRequest>> refreshIncoming() async {
    try {
      final list = await _remote.fetchIncoming();
      await _local.upsertAll(list);
      return list;
    } catch (e) {
      throw Failure.from(e);
    }
  }

  Future<BorrowRequest> create(int bookId, {String? message}) async {
    try {
      final r = await _remote.create(bookId, message: message);
      await _local.upsert(r);
      return r;
    } catch (e) {
      throw Failure.from(e);
    }
  }

  Future<BorrowRequest> accept(int id) => _updateStatus(id, 'accepted');
  Future<BorrowRequest> reject(int id) => _updateStatus(id, 'rejected');

  Future<BorrowRequest> _updateStatus(int id, String status) async {
    try {
      final r = await _remote.updateStatus(id, status);
      await _local.upsert(r);
      return r;
    } catch (e) {
      throw Failure.from(e);
    }
  }

  Future<BorrowRequest> confirmHandoff(int id) async {
    try {
      final r = await _remote.confirm(id);
      await _local.upsert(r);
      // Matches backend behavior: once both sides confirm, status flips to
      // active and the book becomes unavailable — patch that locally
      // rather than waiting on a re-fetch (architecture §8).
      if (r.status == RequestStatus.active) {
        await _booksLocal.setAvailability(r.bookId, false);
      }
      return r;
    } catch (e) {
      throw Failure.from(e);
    }
  }

  Future<BorrowRequest> markReturned(int id) async {
    try {
      final r = await _remote.markReturned(id);
      await _local.upsert(r);
      await _booksLocal.setAvailability(r.bookId, true);
      return r;
    } catch (e) {
      throw Failure.from(e);
    }
  }
}

final requestsRemoteDataSourceProvider = Provider<RequestsRemoteDataSource>((ref) {
  return RequestsRemoteDataSource(ref.watch(dioProvider));
});

final requestsLocalDataSourceProvider = Provider<RequestsLocalDataSource>((ref) {
  return RequestsLocalDataSource(ref.watch(databaseProvider));
});

final booksLocalDataSourceProvider = Provider<BooksLocalDataSource>((ref){
  return BooksLocalDataSource(ref.watch(databaseProvider));
});

final requestsRepositoryProvider = Provider<RequestsRepository>((ref) {
  return RequestsRepository(
    ref.watch(requestsRemoteDataSourceProvider),
    ref.watch(requestsLocalDataSourceProvider),
    ref.watch(booksLocalDataSourceProvider),
  );
});