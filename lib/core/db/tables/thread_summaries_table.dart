import 'package:drift/drift.dart';

/// Only thread *summaries* are cached — message bodies are deliberately
/// never stored in Drift. Firestore's own offline persistence (enabled in
/// main.dart) already handles that; duplicating it here would create a
/// second source of truth for the same data (architecture §8).
@DataClassName('ThreadSummaryRow')
class ThreadSummaries extends Table {
  IntColumn get requestId => integer()();
  TextColumn get bookTitle => text()();
  TextColumn get otherParticipantName => text().nullable()();
  TextColumn get lastMessagePreview => text()();
  DateTimeColumn get lastMessageAt => dateTime()();

  @override
  Set<Column> get primaryKey => {requestId};
}