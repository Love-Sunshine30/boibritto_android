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
import '../../features/books/presentation/screens/book_detail_screen.dart';
import '../../features/books/presentation/screens/book_feed_screen.dart';
import '../../features/books/presentation/screens/book_form_screen.dart';
import '../../features/books/presentation/screens/my_shelf_screen.dart';
import '../../features/profile/application/own_profile_controller.dart';
import '../../features/profile/data/models/own_profile.dart';
import '../../features/profile/presentation/screens/my_profile_screen.dart';
import '../../features/requests/presentation/screens/request_detail_screen.dart';
import '../../features/requests/presentation/screens/requests_screen.dart';
import 'routes.dart';

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
          final profile = profileAsync == null
              ? null
              : profileAsync.when(
                  data: (value) => value,
                  loading: () => null,
                  error: (_, __) => null,
                );
          if (profile == null) return null;

          final needsCompletion = profile.user.whatsappNumber == null;
          final onCompleteProfile = loc == AppRoutes.completeProfile;

          if (needsCompletion) {
            if (loc == AppRoutes.splash || onAuthScreen || loc == AppRoutes.newBook) {
              return AppRoutes.completeProfile;
            }
            return null;
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
      GoRoute(path: AppRoutes.newBook, builder: (_, _) => const BookFormScreen()),
      GoRoute(
        path: '/books/:id',
        builder: (_, state) =>
            BookDetailScreen(bookId: int.parse(state.pathParameters['id']!)),
      ),
      GoRoute(
        path: '/books/:id/edit',
        builder: (_, state) =>
            BookFormScreen(editBookId: int.parse(state.pathParameters['id']!)),
      ),
      GoRoute(
        path: '/requests/:id',
        builder: (_, state) =>
            RequestDetailScreen(requestId: int.parse(state.pathParameters['id']!)),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => _AppShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(routes: [
            GoRoute(path: AppRoutes.books, builder: (_, _) => const BookFeedScreen()),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(path: AppRoutes.myShelf, builder: (_, _) => const MyShelfScreen()),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(path: AppRoutes.requests, builder: (_, _) => const RequestsScreen()),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(path: AppRoutes.messages, builder: (_, _) => const _MessagesPlaceholder()),
          ]),
        ],
      ),
    ],
  );
});

class _AppShell extends StatelessWidget {
  const _AppShell({required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) =>
            navigationShell.goBranch(index, initialLocation: index == navigationShell.currentIndex),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.menu_book_outlined), label: 'Feed'),
          NavigationDestination(icon: Icon(Icons.collections_bookmark_outlined), label: 'My Shelf'),
          NavigationDestination(icon: Icon(Icons.swap_horiz), label: 'Requests'),
          NavigationDestination(icon: Icon(Icons.chat_bubble_outline), label: 'Messages'),
        ],
      ),
    );
  }
}

class _MessagesPlaceholder extends StatelessWidget {
  const _MessagesPlaceholder();
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Messages — coming in step 7')));
}