import 'package:dio/dio.dart';

import '../../../core/network/api_endpoints.dart';
import 'models/post.dart';

class ForumRemoteDataSource {
  ForumRemoteDataSource(this._dio);
  final Dio _dio;

  Future<ForumPage> fetchPage(int bookId, {String? cursor}) async {
    final response = await _dio.get<Map<String, dynamic>>(
      ApiEndpoints.bookForum(bookId),
      queryParameters: {if (cursor != null) 'cursor': cursor},
    );
    return ForumPage.fromJson(response.data!['data'] as Map<String, dynamic>);
  }

  Future<Post> create(int bookId, String body) async {
    final response = await _dio.post<Map<String, dynamic>>(
      ApiEndpoints.bookForum(bookId),
      data: {'body': body},
    );
    return Post.fromJson(response.data!['data'] as Map<String, dynamic>);
  }

  Future<Post> update(int postId, String body) async {
    final response = await _dio.patch<Map<String, dynamic>>(
      ApiEndpoints.forumPost(postId),
      data: {'body': body},
    );
    return Post.fromJson(response.data!['data'] as Map<String, dynamic>);
  }

  Future<void> delete(int postId) {
    return _dio.delete<void>(ApiEndpoints.forumPost(postId));
  }
}