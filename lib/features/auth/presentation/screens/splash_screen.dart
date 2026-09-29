import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Nothing to do here — app_router.dart's redirect moves off /splash the
    // moment authStateProvider resolves to unauthenticated/authenticated.
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}