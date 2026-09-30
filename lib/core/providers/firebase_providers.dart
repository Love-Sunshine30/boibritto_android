import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../auth/auth_state.dart';
import '../auth/firebase_auth_service.dart';
import '../auth/token_storage.dart';
import '../push/fcm_service.dart';

final firebaseAuthServiceProvider = Provider<FirebaseAuthService>((ref) {
  return FirebaseAuthService(FirebaseAuth.instance);
});

final authStateProvider = StreamProvider<AuthState>((ref) {
  return ref.watch(firebaseAuthServiceProvider).authStateChanges();
});

final tokenStorageProvider = Provider<TokenStorage>((ref) => TokenStorage());

final fcmServiceProvider = Provider<FcmService>((ref) {
  return FcmService(FirebaseMessaging.instance);
});