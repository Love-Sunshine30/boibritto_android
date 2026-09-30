import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'tables/books_table.dart';
import 'tables/forum_posts_table.dart';
import 'tables/requests_table.dart';
import 'tables/thread_summaries_table.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Books, Requests, ThreadSummaries, ForumPosts])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  AppDatabase.forTesting(super.executor);

  @override
  int get schemaVersion => 5;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) => m.createAll(),
        onUpgrade: (m, from, to) async {
          if (from < 2) await m.createTable(books);
          if (from < 3) await m.createTable(requests);
          if (from < 4) await m.createTable(threadSummaries);
          if (from < 5) await m.createTable(forumPosts);
        },
      );

  static QueryExecutor _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'boibritto.sqlite'));
      return NativeDatabase.createInBackground(file);
    });
  }
}