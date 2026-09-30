import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/auth/firebase_auth_service.dart';
import '../../../core/providers/firebase_providers.dart';
import '../../push/application/push_registration_controller.dart';

class AuthActionState {
  const AuthActionState({this.submitting = false, this.errorMessage});

  final bool submitting;
  final String? errorMessage;

  AuthActionState copyWith({bool? submitting, String? errorMessage}) {
    return AuthActionState(
      submitting: submitting ?? this.submitting,
      errorMessage: errorMessage,
    );
  }
}

class AuthController extends Notifier<AuthActionState> {
  @override
  AuthActionState build() => const AuthActionState();

  FirebaseAuthService get _service => ref.read(firebaseAuthServiceProvider);

  Future<bool> signIn({required String email, required String password}) {
    return _run(() => _service.signInWithEmail(email: email, password: password));
  }

  Future<bool> register({required String email, required String password}) {
    return _run(() => _service.registerWithEmail(email: email, password: password));
  }

  Future<bool> sendPasswordReset(String email) {
    return _run(() => _service.sendPasswordResetEmail(email));
  }

  Future<void> signOut() async {
    // Must happen while still authenticated — unsubscribe needs a valid ID
    // token to call the backend (architecture §10).
    await ref.read(pushRegistrationControllerProvider).unregister();
    await _service.signOut();
  }

  Future<bool> _run(Future<void> Function() action) async {
    state = state.copyWith(submitting: true, errorMessage: null);
    try {
      await action();
      state = state.copyWith(submitting: false);
      return true;
    } on AuthActionException catch (e) {
      state = state.copyWith(submitting: false, errorMessage: e.message);
      return false;
    } catch (_) {
      state = state.copyWith(
        submitting: false,
        errorMessage: 'Something went wrong. Please try again.',
      );
      return false;
    }
  }
}

final authControllerProvider =
    NotifierProvider<AuthController, AuthActionState>(AuthController.new);