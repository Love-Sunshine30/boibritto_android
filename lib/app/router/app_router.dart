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
import '../../features/profile/application/own_profile_controller.dart';
import '../../features/profile/data/models/own_profile.dart';
import '../../features/profile/presentation/screens/my_profile_screen.dart';
import 'routes.dart';

/// Holds the latest auth state + own-profile fetch result and tells
/// go_router to re-run `redirect` whenever either changes. Both are fed by
/// a single `ref.listen` each below, so there's exactly one subscription
/// to each underlying stream/provider.
class AppRefreshNotifier extends ChangeNotifier {
  AuthState authState = const AuthUnknown();
  AsyncValue<OwnProfile>? profileAsync;

  void updateAuth(AuthState next) {
    authState = next;
    notifyListeners();
  }

  void updateProfile(AsyncValue<OwnProfile> next) {
    profileAsync = next;
    notifyListeners();
  }
}

final goRouterProvider = Provider<GoRouter>((ref) {
  final notifier = AppRefreshNotifier();
  ref.onDispose(notifier.dispose);

  ref.listen<AsyncValue<AuthState>>(
    authStateProvider,
    (_, next) => next.whenData(notifier.updateAuth),
    fireImmediately: true,
  );

  // Watching this unconditionally is fine — OwnProfileController.build()
  // itself waits for AuthAuthenticated before hitting the network, so this
  // never fires GET /me while signed out.
  ref.listen<AsyncValue<OwnProfile>>(
    ownProfileControllerProvider,
    (_, next) => notifier.updateProfile(next),
    fireImmediately: true,
  );

  return GoRouter(
    initialLocation: AppRoutes.splash,
    refreshListenable: notifier,
    redirect: (context, state) {
      final loc = state.matchedLocation;
      final onAuthScreen = {
        AppRoutes.login,
        AppRoutes.register,
        AppRoutes.forgotPassword,
      }.contains(loc);

      switch (notifier.authState) {
        case AuthUnknown():
          return loc == AppRoutes.splash ? null : AppRoutes.splash;

        case AuthUnauthenticated():
          return onAuthScreen ? null : AppRoutes.login;

          case AuthAuthenticated():
          final profileAsync = notifier.profileAsync;
          final profile = profileAsync?.when(
                  data: (value) => value,
                  loading: () => null,
                  error: (_, _) => null,
                );
          // Profile fetch still in flight — wait rather than flashing
          // /books and immediately bouncing to /complete-profile.
          if (profile == null) return null;

          final needsCompletion = profile.user.whatsappNumber == null;
          final onCompleteProfile = loc == AppRoutes.completeProfile;

          if (needsCompletion) {
            // TODO(step 4): also force this for /books/new and forum
            // "post" once those routes exist (architecture §4).
            if (loc == AppRoutes.splash || onAuthScreen) {
              return AppRoutes.completeProfile;
            }
            return null; // browsing elsewhere is allowed while incomplete
          }
          if (loc == AppRoutes.splash || onAuthScreen || onCompleteProfile) {
            return AppRoutes.books;
          }
          return null;
      }
    },
    routes: [
      GoRoute(path: AppRoutes.splash, builder: (_, _) => const SplashScreen()),
      GoRoute(path: AppRoutes.login, builder: (_, _) => const LoginScreen()),
      GoRoute(path: AppRoutes.register, builder: (_, _) => const RegisterScreen()),
      GoRoute(path: AppRoutes.forgotPassword, builder: (_, _) => const ForgotPasswordScreen()),
      GoRoute(path: AppRoutes.completeProfile, builder: (_, _) => const CompleteProfileScreen()),
      GoRoute(path: AppRoutes.myProfile, builder: (_, _) => const MyProfileScreen()),
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Boibritto'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline),
            onPressed: () => context.push(AppRoutes.myProfile),
          ),
        ],
      ),
      body: const Center(child: Text('Feed goes here (step 4)')),
    );
  }
}