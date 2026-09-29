import 'package:firebase_auth/firebase_auth.dart';

import '../../core/network/interceptors/auth_interceptor.dart';
import 'auth_state.dart';

/// Thin wrapper over FirebaseAuth — the only place in the app that talks to
/// the Firebase Auth SDK directly. Also implements [TokenProvider] so
/// AuthInterceptor can attach/refresh ID tokens without depending on
/// FirebaseAuth itself.
class FirebaseAuthService implements TokenProvider {
  FirebaseAuthService(this._auth);

  final FirebaseAuth _auth;

  /// Maps Firebase's own auth-state stream to the app's [AuthState].
  Stream<AuthState> authStateChanges() {
    return _auth.authStateChanges().map((user) {
      if (user == null) return const AuthUnauthenticated();
      return AuthAuthenticated(user.uid);
    });
  }

  @override
  Future<String?> currentToken() =>
      _auth.currentUser?.getIdToken() ?? Future.value(null);

  @override
  Future<String?> refreshToken() =>
      _auth.currentUser?.getIdToken(true) ?? Future.value(null);

  Future<void> signInWithEmail({required String email, required String password}) {
    return _mapAuthException(
      () => _auth.signInWithEmailAndPassword(email: email, password: password),
    );
  }

  Future<void> registerWithEmail({required String email, required String password}) {
    return _mapAuthException(
      () => _auth.createUserWithEmailAndPassword(email: email, password: password),
    );
  }

  Future<void> sendPasswordResetEmail(String email) {
    return _mapAuthException(() => _auth.sendPasswordResetEmail(email: email));
  }

  Future<void> signOut() => _auth.signOut();

  Future<T> _mapAuthException<T>(Future<T> Function() action) async {
    try {
      return await action();
    } on FirebaseAuthException catch (e) {
      throw AuthActionException.fromFirebase(e);
    }
  }
}

/// Friendly wrapper over [FirebaseAuthException] — auth screens switch on
/// [code], never on Firebase's raw exception, matching the rest of the
/// app's "typed exception, never SDK exception" convention.
class AuthActionException implements Exception {
  const AuthActionException(this.code, this.message);

  final String code;
  final String message;

  factory AuthActionException.fromFirebase(FirebaseAuthException e) {
    final message = switch (e.code) {
      'invalid-email' => 'That email address looks invalid.',
      'user-disabled' => 'This account has been disabled.',
      'user-not-found' => 'No account found for that email.',
      'wrong-password' || 'invalid-credential' => 'Incorrect email or password.',
      'email-already-in-use' => 'An account already exists for that email.',
      'weak-password' => 'Choose a stronger password (at least 6 characters).',
      'network-request-failed' => 'Network error — check your connection.',
      'too-many-requests' => 'Too many attempts. Try again in a bit.',
      _ => 'Something went wrong. Please try again.',
    };
    return AuthActionException(e.code, message);
  }
}