import 'package:drift/drift.dart';

/// `@DataClassName('BookRow')` — without this, Drift's default generated
/// row class would be named `Books` (from the table class), not a problem
/// on its own, but keeping it distinct from our domain `Book` (freezed)
/// model avoids any ambiguity between "raw cached row" and "API model".
@DataClassName('BookRow')
class Books extends Table {
  IntColumn get id => integer()();
  TextColumn get title => text()();
  TextColumn get author => text()();
  TextColumn get genre => text()();
  TextColumn get description => text()();
  TextColumn get coverUrl => text()();
  BoolColumn get available => boolean()();
  IntColumn get ownerId => integer()();
  TextColumn get ownerName => text()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}