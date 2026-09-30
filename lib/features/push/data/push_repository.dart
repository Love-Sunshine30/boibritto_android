import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/errors/failure.dart';
import '../../../core/network/api_endpoints.dart';
import '../../../core/providers/dio_provider.dart';

class PushRepository {
  PushRepository(this._dio);
  final Dio _dio;

  Future<void> subscribe(String fcmToken) async {
    try {
      await _dio.post<void>(
        ApiEndpoints.pushSubscribe,
        data: {'platform': 'android', 'fcm_token': fcmToken},
      );
    } catch (e) {
      throw Failure.from(e);
    }
  }

  /// NOTE: assuming the same `{ fcm_token }` shape as subscribe — the
  /// exact `UnsubscribeRequest` fields need confirming against the
  /// contract (see this step's top-level note).
  Future<void> unsubscribe(String fcmToken) async {
    try {
      await _dio.post<void>(
        ApiEndpoints.pushUnsubscribe,
        data: {'fcm_token': fcmToken},
      );
    } catch (e) {
      throw Failure.from(e);
    }
  }
}

final pushRepositoryProvider = Provider<PushRepository>((ref) {
  return PushRepository(ref.watch(dioProvider));
});