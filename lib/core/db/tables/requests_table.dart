import 'package:drift/drift.dart';

@DataClassName('BorrowRequestRow')
class Requests extends Table {
  IntColumn get id => integer()();
  IntColumn get bookId => integer()();
  TextColumn get bookTitle => text()();
  IntColumn get requesterId => integer()();
  TextColumn get requesterName => text()();
  TextColumn get message => text()();
  IntColumn get ownerId => integer()();
  TextColumn get status => text()();
  BoolColumn get ownerConfirmed => boolean()();
  BoolColumn get borrowerConfirmed => boolean()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}