import 'package:dio/dio.dart';

import '../../../core/network/api_endpoints.dart';
import 'models/thread_summary.dart';

class MessagesRemoteDataSource {
  MessagesRemoteDataSource(this._dio);
  final Dio _dio;

  Future<List<ThreadSummary>> fetchThreads() async {
    final response = await _dio.get<Map<String, dynamic>>(ApiEndpoints.threads);
    return (response.data!['data'] as List)
        .map((e) => ThreadSummary.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<void> sendMessage(int requestId, String body) {
    return _dio.post<void>(
      ApiEndpoints.threadMessages(requestId),
      data: {'body': body},
    );
  }
}