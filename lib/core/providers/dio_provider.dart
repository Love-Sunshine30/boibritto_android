import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'firebase_providers.dart';
import '../network/dio_client.dart';

/// The app-wide [Dio] instance. Repositories depend on this, never on Dio
/// directly constructed elsewhere — see architecture §6.
final dioProvider = Provider<Dio>((ref) {
  final authService = ref.watch(firebaseAuthServiceProvider);
  return buildDioClient(
    tokenProvider: authService,
    onReauthFailed: () => authService.signOut(),
  );
});