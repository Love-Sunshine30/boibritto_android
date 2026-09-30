import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/errors/failure.dart';
import '../../../core/providers/database_provider.dart';
import '../../../core/providers/dio_provider.dart';
import 'messages_firestore_data_source.dart';
import 'messages_local_data_source.dart';
import 'messages_remote_data_source.dart';
import 'models/message.dart';
import 'models/thread_summary.dart';

class MessagesRepository {
  MessagesRepository(this._remote, this._local, this._firestore);
  final MessagesRemoteDataSource _remote;
  final MessagesLocalDataSource _local;
  final MessagesFirestoreDataSource _firestore;

  Future<List<ThreadSummary>> getCachedThreads() => _local.getAll();

  Future<List<ThreadSummary>> refreshThreads() async {
    try {
      final threads = await _remote.fetchThreads();
      await _local.upsertAll(threads);
      return threads;
    } catch (e) {
      throw Failure.from(e);
    }
  }

  Future<void> sendMessage(int requestId, String body) async {
    try {
      await _remote.sendMessage(requestId, body);
    } catch (e) {
      throw Failure.from(e);
    }
  }

  /// Not cache-first, not cached in Drift — Firestore's own offline
  /// persistence already covers reading while offline (architecture §8, §10).
  Stream<List<Message>> watchMessages(int requestId) => _firestore.watchMessages(requestId);
}

final messagesRemoteDataSourceProvider = Provider<MessagesRemoteDataSource>((ref) {
  return MessagesRemoteDataSource(ref.watch(dioProvider));
});

final messagesLocalDataSourceProvider = Provider<MessagesLocalDataSource>((ref) {
  return MessagesLocalDataSource(ref.watch(databaseProvider));
});

final messagesFirestoreDataSourceProvider = Provider<MessagesFirestoreDataSource>((ref) {
  return MessagesFirestoreDataSource(FirebaseFirestore.instance);
});

final messagesRepositoryProvider = Provider<MessagesRepository>((ref) {
  return MessagesRepository(
    ref.watch(messagesRemoteDataSourceProvider),
    ref.watch(messagesLocalDataSourceProvider),
    ref.watch(messagesFirestoreDataSourceProvider),
  );
});