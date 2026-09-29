import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/errors/failure.dart';
import '../../../core/network/api_endpoints.dart';
import '../../../core/providers/dio_provider.dart';
import 'models/own_profile.dart';
import 'models/public_profile.dart';
import 'models/user.dart';

class ProfileRepository {
  ProfileRepository(this._dio);
  final Dio _dio;

  Future<OwnProfile> getOwnProfile() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(ApiEndpoints.me);
      return OwnProfile.fromJson(response.data!['data'] as Map<String, dynamic>);
    } catch (e) {
      throw Failure.from(e);
    }
  }

  /// NOTE: `PATCH /me`'s body schema (`UpdateProfileRequest`) isn't defined
  /// in openapi.yml yet — assuming `{ whatsapp_number }` since that's the
  /// only field architecture §11.9 calls editable. Confirm with backend.
  Future<User> updateWhatsappNumber(String whatsappNumber) async {
    try {
      final response = await _dio.patch<Map<String, dynamic>>(
        ApiEndpoints.me,
        data: {'whatsapp_number': whatsappNumber},
      );
      return User.fromJson(response.data!['data'] as Map<String, dynamic>);
    } catch (e) {
      throw Failure.from(e);
    }
  }

  Future<PublicProfile> getPublicProfile(int userId) async {
    try {
      final response =
          await _dio.get<Map<String, dynamic>>(ApiEndpoints.user(userId));
      return PublicProfile.fromJson(response.data!['data'] as Map<String, dynamic>);
    } catch (e) {
      throw Failure.from(e);
    }
  }
}

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  return ProfileRepository(ref.watch(dioProvider));
});