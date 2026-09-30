import 'package:drift/drift.dart';

import '../../../core/db/app_database.dart';
import 'models/post.dart';

class ForumLocalDataSource {
  ForumLocalDataSource(this._db);
  final AppDatabase _db;

  Post _toDomain(ForumPostRow row) => Post(
        id: row.id,
        bookId: row.bookId,
        userId: row.userId,
        userName: row.userName,
        body: row.body,
        edited: row.edited,
        createdAt: row.createdAt,
      );

  ForumPostsCompanion _toCompanion(Post p) => ForumPostsCompanion.insert(
        id: Value(p.id),
        bookId: p.bookId,
        userId: p.userId,
        userName: p.userName,
        body: p.body,
        edited: p.edited,
        createdAt: p.createdAt,
      );

  Future<List<Post>> getByBook(int bookId) async {
    final rows = await (_db.select(_db.forumPosts)
          ..where((t) => t.bookId.equals(bookId))
          ..orderBy([(t) => OrderingTerm.asc(t.createdAt)]))
        .get();
    return rows.map(_toDomain).toList();
  }

  Future<void> upsert(Post post) {
    return _db.into(_db.forumPosts).insertOnConflictUpdate(_toCompanion(post));
  }

  Future<void> upsertAll(List<Post> posts) {
    return _db.batch((batch) {
      for (final p in posts) {
        batch.insert(_db.forumPosts, _toCompanion(p), mode: InsertMode.insertOrReplace);
      }
    });
  }

  Future<void> remove(int id) {
    return (_db.delete(_db.forumPosts)..where((t) => t.id.equals(id))).go();
  }
}