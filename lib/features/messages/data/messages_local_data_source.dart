import 'package:drift/drift.dart';

import '../../../core/db/app_database.dart';
import 'models/thread_summary.dart';

class MessagesLocalDataSource {
  MessagesLocalDataSource(this._db);
  final AppDatabase _db;

  ThreadSummary _toDomain(ThreadSummaryRow row) => ThreadSummary(
        requestId: row.requestId,
        bookTitle: row.bookTitle,
        otherParticipantName: row.otherParticipantName,
        lastMessagePreview: row.lastMessagePreview,
        lastMessageAt: row.lastMessageAt,
      );

  ThreadSummariesCompanion _toCompanion(ThreadSummary t) => ThreadSummariesCompanion.insert(
        requestId: Value(t.requestId),
        bookTitle: t.bookTitle,
        otherParticipantName: Value(t.otherParticipantName),
        lastMessagePreview: t.lastMessagePreview,
        lastMessageAt: t.lastMessageAt,
      );

  /// Server-ordered — never re-sorted client-side (architecture §11.8).
  Future<List<ThreadSummary>> getAll() async {
    final rows = await (_db.select(_db.threadSummaries)
          ..orderBy([(t) => OrderingTerm.desc(t.lastMessageAt)]))
        .get();
    return rows.map(_toDomain).toList();
  }

  Future<void> upsertAll(List<ThreadSummary> threads) {
    return _db.batch((batch) {
      for (final t in threads) {
        batch.insert(_db.threadSummaries, _toCompanion(t), mode: InsertMode.insertOrReplace);
      }
    });
  }
}