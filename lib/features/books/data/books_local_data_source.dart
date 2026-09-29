import 'package:drift/drift.dart';

import '../../../core/db/app_database.dart';
import 'models/book.dart';

/// Wraps Drift access for the `books` table — individual rows only. See
/// this feature's top-level note on why the feed's page ordering isn't
/// persisted here yet.
class BooksLocalDataSource {
  BooksLocalDataSource(this._db);
  final AppDatabase _db;

  Book _toDomain(BookRow row) => Book(
        id: row.id,
        title: row.title,
        author: row.author,
        genre: row.genre,
        description: row.description,
        coverUrl: row.coverUrl,
        available: row.available,
        ownerId: row.ownerId,
        ownerName: row.ownerName,
        createdAt: row.createdAt,
      );

  BooksCompanion _toCompanion(Book book) => BooksCompanion.insert(
        id: Value(book.id),
        title: book.title,
        author: book.author,
        genre: book.genre,
        description: book.description,
        coverUrl: book.coverUrl,
        available: book.available,
        ownerId: book.ownerId,
        ownerName: book.ownerName,
        createdAt: book.createdAt,
      );

  Future<Book?> getById(int id) async {
    final row = await (_db.select(_db.books)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
    return row == null ? null : _toDomain(row);
  }

  Future<void> upsert(Book book) {
    return _db.into(_db.books).insertOnConflictUpdate(_toCompanion(book));
  }

  Future<void> upsertAll(List<Book> books) {
    return _db.batch((batch) {
      for (final book in books) {
        batch.insert(_db.books, _toCompanion(book), mode: InsertMode.insertOrReplace);
      }
    });
  }

  Future<void> remove(int id) {
    return (_db.delete(_db.books)..where((t) => t.id.equals(id))).go();
  }

    /// Write-through patch used by RequestsRepository when a handoff confirms
  /// or a book is returned — updates availability without waiting on a
  /// refetch (architecture §8).
  Future<void> setAvailability(int bookId, bool available) {
    return (_db.update(_db.books)..where((t) => t.id.equals(bookId)))
        .write(BooksCompanion(available: Value(available)));
  }
}