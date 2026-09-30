import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/auth/auth_state.dart';
import '../core/providers/firebase_providers.dart';
import '../core/push/notification_router.dart';
import '../features/push/application/push_registration_controller.dart';
import 'router/app_router.dart';
import 'theme/app_theme.dart';

class BoibrittoApp extends ConsumerStatefulWidget {
  const BoibrittoApp({super.key});

  @override
  ConsumerState<BoibrittoApp> createState() => _BoibrittoAppState();
}

class _BoibrittoAppState extends ConsumerState<BoibrittoApp> with WidgetsBindingObserver {
  static const _notificationRouter = NotificationRouter();
  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  String? _pendingRoute;
  bool _initialMessageChecked = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    final fcm = ref.read(fcmServiceProvider);
    fcm.onForegroundMessage.listen(_onForegroundMessage);
    fcm.onMessageOpenedApp.listen(_navigateFor);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state != AppLifecycleState.resumed) return;
    final auth = ref.read(authStateProvider).maybeWhen(
      data: (auth) => auth,
      orElse: () => null,
    );
    if (auth is AuthAuthenticated) {
      ref.read(pushRegistrationControllerProvider).register();
    }
  }

  void _onForegroundMessage(RemoteMessage message) {
    final text = [message.notification?.title, message.notification?.body]
        .whereType<String>()
        .join(' — ');
    if (text.isEmpty) return;
    _scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(text),
        action: SnackBarAction(label: 'Open', onPressed: () => _navigateFor(message)),
      ),
    );
  }

  void _navigateFor(RemoteMessage message) {
    final path = _notificationRouter.routeFor(message);
    if (path == null) return;
    final auth = ref.read(authStateProvider).maybeWhen(
      data: (auth) => auth,
      orElse: () => null,
    );
    if (auth is AuthAuthenticated) {
      ref.read(goRouterProvider).push(path);
    } else {
      // Not signed in yet — the build() listener below fires this once
      // auth resolves (architecture §10's "queue until authenticated").
      _pendingRoute = path;
    }
  }

  @override
Widget build(BuildContext context) {
  final router = ref.watch(goRouterProvider);

  ref.listen<AsyncValue<AuthState>>(authStateProvider, (previous, next) {
    final wasAuthenticated = previous?.maybeWhen(
          data: (state) => state is AuthAuthenticated,
          orElse: () => false,
        ) ??
        false;
    final isAuthenticated = next.maybeWhen(
      data: (state) => state is AuthAuthenticated,
      orElse: () => false,
    );
    if (isAuthenticated && !wasAuthenticated) {
      ref.read(pushRegistrationControllerProvider).register();
      final path = _pendingRoute;
      if (path != null) {
        _pendingRoute = null;
        WidgetsBinding.instance.addPostFrameCallback((_) => router.push(path));
      }
    }
   });

    if (!_initialMessageChecked) {
      _initialMessageChecked = true;
      ref.read(fcmServiceProvider).getInitialMessage().then((message) {
        if (message != null) _navigateFor(message);
      });
    }

    return MaterialApp.router(
      title: 'Boibritto',
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: _scaffoldMessengerKey,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
      routerConfig: router,
    );
  }
}