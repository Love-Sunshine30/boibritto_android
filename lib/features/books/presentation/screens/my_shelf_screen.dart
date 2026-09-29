import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/routes.dart';
import '../../../profile/application/own_profile_controller.dart';

class MyShelfScreen extends ConsumerWidget {
  const MyShelfScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(ownProfileControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('My shelf')),
      body: profileAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text("Couldn't load your books: $err")),
        data: (profile) {
          if (profile.books.isEmpty) {
            return const Center(child: Text("You haven't listed any books yet."));
          }
          return RefreshIndicator(
            onRefresh: () => ref.read(ownProfileControllerProvider.notifier).refresh(),
            child: ListView.builder(
              itemCount: profile.books.length,
              itemBuilder: (context, index) {
                final book = profile.books[index];
                return ListTile(
                  leading: SizedBox(
                    width: 40,
                    height: 56,
                    child: CachedNetworkImage(
                      imageUrl: book.coverUrl,
                      fit: BoxFit.cover,
                      errorWidget: (_, __, ___) => const Icon(Icons.menu_book),
                    ),
                  ),
                  title: Text(book.title),
                  subtitle: Text(book.author),
                  trailing: Text(book.available ? 'Available' : 'On loan'),
                  onTap: () => context.push(AppRoutes.bookDetail(book.id)),
                );
              },
            ),
          );
        },
      ),
    );
  }
}