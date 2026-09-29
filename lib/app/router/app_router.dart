import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/auth/auth_state.dart';
import '../../core/providers/firebase_providers.dart';
import '../../features/auth/presentation/screens/complete_profile_screen.dart';
import '../../features/auth/presentation/screens/forgot_password_screen.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/auth/presentation/screens/splash_screen.dart';
import 'routes.dart';

/// Holds the latest [AuthState] and tells go_router to re-run `redirect`
/// whenever it changes. Fed by a single `ref.listen` on [authStateProvider]
/// below, so there is exactly one subscription to Firebase's auth stream.
class AuthRefreshNotifier extends ChangeNotifier {
  AuthState state = const AuthUnknown();

  void update(AuthState next) {
    state = next;
    notifyListeners();
  }
}

final goRouterProvider = Provider<GoRouter>((ref) {
  final notifier = AuthRefreshNotifier();
  ref.onDispose(notifier.dispose);

  ref.listen<AsyncValue<AuthState>>(
    authStateProvider,
    (_, next) {
      debugPrint('[router] auth stream -> $next');
      next.whenData(notifier.update);
    },
    fireImmediately: true,
  );

  return GoRouter(
    initialLocation: AppRoutes.splash,
    refreshListenable: notifier,
    redirect: (context, state) {
      final authState = notifier.state;
      final loc = state.matchedLocation;
      debugPrint('[router] redirect: loc=$loc authState=$authState');

      final onAuthScreen = {
        AppRoutes.login,
        AppRoutes.register,
        AppRoutes.forgotPassword,
      }.contains(loc);

      switch (authState) {
        case AuthUnknown():
          return loc == AppRoutes.splash ? null : AppRoutes.splash;
        case AuthUnauthenticated():
          return onAuthScreen ? null : AppRoutes.login;
        case AuthAuthenticated():
          // TODO(step 3): once features/profile exists, redirect here to
          // /complete-profile when OwnProfile.whatsappNumber is null, and
          // gate /books/new + forum "post" the same way (architecture §4).
          if (loc == AppRoutes.splash || onAuthScreen) return AppRoutes.books;
          return null;
      }
    },
    routes: [
      GoRoute(path: AppRoutes.splash, builder: (_, _) => const SplashScreen()),
      GoRoute(path: AppRoutes.login, builder: (_, _) => const LoginScreen()),
      GoRoute(path: AppRoutes.register, builder: (_, _) => const RegisterScreen()),
      GoRoute(path: AppRoutes.forgotPassword, builder: (_, _) => const ForgotPasswordScreen()),
      GoRoute(path: AppRoutes.completeProfile, builder: (_, _) => const CompleteProfileScreen()),
      // TODO(step 4): replace with the real StatefulShellRoute.indexedStack
      // bottom-nav (Feed · My Shelf · Requests · Messages) — architecture §4.
      GoRoute(path: AppRoutes.books, builder: (_, _) => const _BooksPlaceholder()),
    ],
  );
});

class _BooksPlaceholder extends StatelessWidget {
  const _BooksPlaceholder();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Signed in — Feed goes here (step 4)')),
    );
  }
}