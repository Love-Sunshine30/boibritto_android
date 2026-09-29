import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../auth/auth_state.dart';
import '../auth/firebase_auth_service.dart';

final firebaseAuthServiceProvider = Provider<FirebaseAuthService>((ref) {
  return FirebaseAuthService(FirebaseAuth.instance);
});

/// Drives the router's auth redirect (app/router/app_router.dart) and
/// anything else that needs to know sign-in state.
final authStateProvider = StreamProvider<AuthState>((ref) {
  return ref.watch(firebaseAuthServiceProvider).authStateChanges();
});