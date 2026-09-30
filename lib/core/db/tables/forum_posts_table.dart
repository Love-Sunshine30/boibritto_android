import 'package:drift/drift.dart';

@DataClassName('ForumPostRow')
class ForumPosts extends Table {
  IntColumn get id => integer()();
  IntColumn get bookId => integer()();
  IntColumn get userId => integer()();
  TextColumn get userName => text()();
  TextColumn get body => text()();
  BoolColumn get edited => boolean()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}