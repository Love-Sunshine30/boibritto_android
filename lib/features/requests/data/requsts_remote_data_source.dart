import 'package:dio/dio.dart';

import '../../../core/network/api_endpoints.dart';
import 'models/borrow_request.dart';

class RequestsRemoteDataSource {
  RequestsRemoteDataSource(this._dio);
  final Dio _dio;

  Future<List<BorrowRequest>> fetchSent() async {
    final response = await _dio.get<Map<String, dynamic>>(ApiEndpoints.requestsSent);
    return (response.data!['data'] as List)
        .map((e) => BorrowRequest.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<List<BorrowRequest>> fetchIncoming() async {
    final response = await _dio.get<Map<String, dynamic>>(ApiEndpoints.requestsIncoming);
    return (response.data!['data'] as List)
        .map((e) => BorrowRequest.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<BorrowRequest> create(int bookId, {String? message}) async {
    final response = await _dio.post<Map<String, dynamic>>(
      ApiEndpoints.bookRequests(bookId),
      data: message == null || message.isEmpty ? null : {'message': message},
    );
    return BorrowRequest.fromJson(response.data!['data'] as Map<String, dynamic>);
  }

  Future<BorrowRequest> updateStatus(int id, String status) async {
    final response = await _dio.patch<Map<String, dynamic>>(
      ApiEndpoints.request(id),
      data: {'status': status},
    );
    return BorrowRequest.fromJson(response.data!['data'] as Map<String, dynamic>);
  }

  Future<BorrowRequest> confirm(int id) async {
    final response = await _dio.post<Map<String, dynamic>>(ApiEndpoints.requestConfirm(id));
    return BorrowRequest.fromJson(response.data!['data'] as Map<String, dynamic>);
  }

  Future<BorrowRequest> markReturned(int id) async {
    final response = await _dio.post<Map<String, dynamic>>(ApiEndpoints.requestReturn(id));
    return BorrowRequest.fromJson(response.data!['data'] as Map<String, dynamic>);
  }
}