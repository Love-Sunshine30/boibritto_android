import 'package:dio/dio.dart';

import '../../../core/network/api_endpoints.dart';
import 'models/book.dart';

class BooksRemoteDataSource {
  BooksRemoteDataSource(this._dio);
  final Dio _dio;

  Future<BookPage> fetchPage({String? cursor, String? q, String? genre}) async {
    final response = await _dio.get<Map<String, dynamic>>(
      ApiEndpoints.books,
      queryParameters: {
        if (cursor != null) 'cursor': cursor,
        if (q != null && q.isNotEmpty) 'q': q,
        if (genre != null && genre.isNotEmpty) 'genre': genre,
      },
    );
    return BookPage.fromJson(response.data!['data'] as Map<String, dynamic>);
  }

  Future<Book> getById(int id) async {
    final response = await _dio.get<Map<String, dynamic>>(ApiEndpoints.book(id));
    return Book.fromJson(response.data!['data'] as Map<String, dynamic>);
  }

  Future<Book> create({
    required String title,
    required String author,
    String? genre,
    String? description,
    String? coverUrl,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      ApiEndpoints.books,
      data: {
        'title': title,
        'author': author,
        if (genre != null) 'genre': genre,
        if (description != null) 'description': description,
        if (coverUrl != null) 'cover_url': coverUrl,
      },
    );
    return Book.fromJson(response.data!['data'] as Map<String, dynamic>);
  }

  Future<Book> update(int id, Map<String, dynamic> changes) async {
    final response = await _dio.patch<Map<String, dynamic>>(
      ApiEndpoints.book(id),
      data: changes,
    );
    return Book.fromJson(response.data!['data'] as Map<String, dynamic>);
  }

  Future<void> delete(int id) {
    return _dio.delete<void>(ApiEndpoints.book(id));
  }
}