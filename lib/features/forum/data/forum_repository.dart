import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/errors/failure.dart';
import '../../../core/providers/database_provider.dart';
import '../../../core/providers/dio_provider.dart';
import 'forum_local_data_source.dart';
import 'forum_remote_data_source.dart';
import 'models/post.dart';

class ForumRepository {
  ForumRepository(this._remote, this._local);
  final ForumRemoteDataSource _remote;
  final ForumLocalDataSource _local;

  Future<List<Post>> getCached(int bookId) => _local.getByBook(bookId);

  Future<ForumPage> fetchFirstPage(int bookId) async {
    try {
      final page = await _remote.fetchPage(bookId);
      await _local.upsertAll(page.posts);
      return page;
    } catch (e) {
      throw Failure.from(e);
    }
  }

  Future<ForumPage> fetchNextPage(int bookId, DateTime cursor) async {
    try {
      final page = await _remote.fetchPage(bookId, cursor: cursor.toIso8601String());
      await _local.upsertAll(page.posts);
      return page;
    } catch (e) {
      throw Failure.from(e);
    }
  }

  Future<Post> create(int bookId, String body) async {
    try {
      final post = await _remote.create(bookId, body);
      await _local.upsert(post);
      return post;
    } catch (e) {
      throw Failure.from(e);
    }
  }

  Future<Post> update(int postId, String body) async {
    try {
      final post = await _remote.update(postId, body);
      await _local.upsert(post);
      return post;
    } catch (e) {
      throw Failure.from(e);
    }
  }

  Future<void> delete(int postId) async {
    try {
      await _remote.delete(postId);
      await _local.remove(postId);
    } catch (e) {
      throw Failure.from(e);
    }
  }
}

final forumRemoteDataSourceProvider = Provider<ForumRemoteDataSource>((ref) {
  return ForumRemoteDataSource(ref.watch(dioProvider));
});

final forumLocalDataSourceProvider = Provider<ForumLocalDataSource>((ref) {
  return ForumLocalDataSource(ref.watch(databaseProvider));
});

final forumRepositoryProvider = Provider<ForumRepository>((ref) {
  return ForumRepository(
    ref.watch(forumRemoteDataSourceProvider),
    ref.watch(forumLocalDataSourceProvider),
  );
});