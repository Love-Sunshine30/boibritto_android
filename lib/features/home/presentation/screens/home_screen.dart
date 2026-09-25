import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/app_providers.dart';
import '../../../../core/providers/health_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final health = ref.watch(healthProvider);

    return Scaffold(
      body: Center(
        child: health.when(
          loading: () => const CircularProgressIndicator(),

          error: (error, stackTrace) {
            return Text(
              error.toString(),
              textAlign: TextAlign.center,
            );
          },

          data: (data) {
            return Text(
              data,
              style: const TextStyle(
                fontSize: 24,
              ),
            );
          },
        ),
      ),
    );
  }
}