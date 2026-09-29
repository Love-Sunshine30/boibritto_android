import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/theme/app_spacing.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../auth/application/auth_controller.dart';
import '../../application/own_profile_controller.dart';

class MyProfileScreen extends ConsumerWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(ownProfileControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('My profile')),
      body: profileAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Text("Couldn't load your profile: $err"),
          ),
        ),
        data: (profile) {
          final user = profile.user;
          return RefreshIndicator(
            onRefresh: () => ref.read(ownProfileControllerProvider.notifier).refresh(),
            child: ListView(
              padding: const EdgeInsets.all(AppSpacing.lg),
              children: [
                Text(user.name, style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: AppSpacing.xs),
                Text(user.email, style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  user.whatsappNumber ?? 'No WhatsApp number on file',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: AppSpacing.xl),
                Text('My books', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: AppSpacing.sm),
                if (profile.books.isEmpty)
                  const Text('No books listed yet.')
                else
                  ...profile.books.map(
                    (b) => ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(b.title),
                      subtitle: Text(b.author),
                      trailing: Text(b.available ? 'Available' : 'On loan'),
                    ),
                  ),
                const SizedBox(height: AppSpacing.xl),
                Text('Recent activity', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: AppSpacing.sm),
                if (profile.recentActivity.isEmpty)
                  const Text('Nothing yet.')
                else
                  ...profile.recentActivity.map(
                    (a) => ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(a.description),
                      subtitle: Text(a.timestamp.toLocal().toString()),
                    ),
                  ),
                const SizedBox(height: AppSpacing.xl),
                AppButton(
                  label: 'Sign out',
                  variant: AppButtonVariant.text,
                  onPressed: () => ref.read(authControllerProvider.notifier).signOut(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}