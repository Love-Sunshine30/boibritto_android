import '../../../core/db/app_database.dart';
import 'models/borrow_request.dart';

import 'package:drift/drift.dart';

class RequestsLocalDataSource {
  RequestsLocalDataSource(this._db);
  final AppDatabase _db;

  BorrowRequest _toDomain(BorrowRequestRow row) => BorrowRequest(
        id: row.id,
        bookId: row.bookId,
        bookTitle: row.bookTitle,
        requesterId: row.requesterId,
        requesterName: row.requesterName,
        message: row.message,
        ownerId: row.ownerId,
        status: RequestStatus.values.byName(row.status),
        ownerConfirmed: row.ownerConfirmed,
        borrowerConfirmed: row.borrowerConfirmed,
        createdAt: row.createdAt,
      );

  RequestsCompanion _toCompanion(BorrowRequest r) => RequestsCompanion.insert(
        id: Value<int>(r.id),
        bookId: r.bookId,
        bookTitle: r.bookTitle,
        requesterId: r.requesterId,
        requesterName: r.requesterName,
        message: r.message,
        ownerId: r.ownerId,
        status: r.status.name,
        ownerConfirmed: r.ownerConfirmed,
        borrowerConfirmed: r.borrowerConfirmed,
        createdAt: r.createdAt,
      );

  Future<BorrowRequest?> getById(int id) async {
    final row =
        await (_db.select(_db.requests)..where((t) => t.id.equals(id))).getSingleOrNull();
    return row == null ? null : _toDomain(row);
  }

  Future<List<BorrowRequest>> getByRequester(int userId) async {
    final rows =
        await (_db.select(_db.requests)..where((t) => t.requesterId.equals(userId))).get();
    return rows.map(_toDomain).toList();
  }

  Future<List<BorrowRequest>> getByOwner(int userId) async {
    final rows =
        await (_db.select(_db.requests)..where((t) => t.ownerId.equals(userId))).get();
    return rows.map(_toDomain).toList();
  }

  Future<void> upsert(BorrowRequest r) {
    return _db.into(_db.requests).insertOnConflictUpdate(_toCompanion(r));
  }

  Future<void> upsertAll(List<BorrowRequest> requests) {
    return _db.batch((batch) {
      for (final r in requests) {
        batch.insert(_db.requests, _toCompanion(r), mode: InsertMode.insertOrReplace);
      }
    });
  }
}