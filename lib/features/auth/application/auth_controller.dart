import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/auth/firebase_auth_service.dart';
import '../../../core/providers/firebase_providers.dart';

/// Submission state for the sign-in/register/forgot-password forms. Field
/// values live in each screen's own TextEditingControllers — this only
/// tracks the async result of the submit action, per architecture §6's
/// "submitting: bool / submitError: Failure?" pattern.
class AuthActionState {
  const AuthActionState({this.submitting = false, this.errorMessage});

  final bool submitting;
  final String? errorMessage;

  AuthActionState copyWith({bool? submitting, String? errorMessage}) {
    return AuthActionState(
      submitting: submitting ?? this.submitting,
      errorMessage: errorMessage, // explicit null clears the previous error
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

  Future<void> signOut() => _service.signOut();

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