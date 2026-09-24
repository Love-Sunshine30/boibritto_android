import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app/router.dart';
import 'app/theme/theme.dart';

void main() {
  runApp(
    const ProviderScope(
      child: BoibrittoApp(),
    ),
  );
}

class BoibrittoApp extends StatelessWidget {
  const BoibrittoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Boibritto',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerConfig: router,
    );
  }
}