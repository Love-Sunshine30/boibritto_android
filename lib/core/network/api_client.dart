import 'package:dio/dio.dart';

import '../config/app_config.dart';
import '../errors/api_exception.dart';
import 'auth_interceptor.dart';

class ApiClient {
  late final Dio _dio;

  ApiClient({
    required TokenProvider tokenProvider,
  }) {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.apiBaseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 15),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _dio.interceptors.add(
      AuthInterceptor(
        tokenProvider: tokenProvider,
      ),
    );
  }

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) {
    return _request(
      () => _dio.get<T>(
        path,
        queryParameters: queryParameters,
      ),
    );
  }

  Future<Response<T>> post<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) {
    return _request(
      () => _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
      ),
    );
  }

  Future<Response<T>> patch<T>(
    String path, {
    Object? data,
  }) {
    return _request(
      () => _dio.patch<T>(
        path,
        data: data,
      ),
    );
  }

  Future<Response<T>> delete<T>(
    String path, {
    Object? data,
  }) {
    return _request(
      () => _dio.delete<T>(
        path,
        data: data,
      ),
    );
  }

  Future<Response<T>> _request<T>(
    Future<Response<T>> Function() request,
  ) async {
    try {
      return await request();
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  ApiException _handleDioException(DioException exception) {
    final response = exception.response;

    if (response != null) {
      final data = response.data;

      if (data is Map<String, dynamic>) {
        final error = data['error'];

        if (error is Map<String, dynamic>) {
          return ApiException(
            statusCode: response.statusCode,
            code: error['code']?.toString() ?? 'unknown_error',
            message: error['message']?.toString() ?? 'Request failed',
          );
        }
      }

      return ApiException(
        statusCode: response.statusCode,
        code: 'http_error',
        message: 'Request failed with status ${response.statusCode}',
      );
    }

    return ApiException(
      code: 'network_error',
      message: _networkErrorMessage(exception),
    );
  }

  String _networkErrorMessage(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timed out';

      case DioExceptionType.sendTimeout:
        return 'Request timed out';

      case DioExceptionType.receiveTimeout:
        return 'Server took too long to respond';

      case DioExceptionType.connectionError:
        return 'Unable to connect to the server';

      case DioExceptionType.cancel:
        return 'Request was cancelled';

      default:
        return 'Something went wrong';
    }
  }
}