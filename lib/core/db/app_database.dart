import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

/// Drift database shell — no tables yet. Each feature adds its own table(s)
/// here as it's built (BooksTable in step 4, RequestsTable in step 5,
/// ThreadsTable in step 7, ProfileTable in step 3), per the build-out order
/// in architecture §14. Bump [schemaVersion] and add a migration whenever a
/// table is added.
@DriftDatabase(tables: [])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  AppDatabase.forTesting(super.executor);

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'boibritto.sqlite'));
      return NativeDatabase.createInBackground(file);
    });
  }
}