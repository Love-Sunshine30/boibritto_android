import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../db/app_database.dart';

/// The app-wide [AppDatabase] instance, closed when the provider is
/// disposed (in practice: never, for a `ProviderScope`-rooted provider —
/// this matters for tests, which override this provider with an
/// in-memory database per architecture §13).
final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});