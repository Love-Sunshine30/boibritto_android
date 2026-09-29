import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/routes.dart';
import '../../../../app/theme/app_spacing.dart';
import '../../../profile/application/own_profile_controller.dart';
import '../../application/book_detail_controller.dart';

class BookDetailScreen extends ConsumerWidget {
  const BookDetailScreen({super.key, required this.bookId});
  final int bookId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookAsync = ref.watch(bookDetailControllerProvider(bookId));
    final ownProfile = ref.watch(ownProfileControllerProvider).asData?.value;

    return Scaffold(
      appBar: AppBar(title: const Text('Book')),
      body: bookAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text("Couldn't load this book: $err")),
        data: (book) {
          final isOwner = ownProfile != null && ownProfile.user.id == book.ownerId;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 3 / 4,
                  child: CachedNetworkImage(
                    imageUrl: book.coverUrl,
                    fit: BoxFit.cover,
                    errorWidget: (_, __, ___) => const Icon(Icons.menu_book, size: 64),
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                Text(book.title, style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: AppSpacing.xs),
                Text('by ${book.author}', style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: AppSpacing.xs),
                Text(book.genre, style: Theme.of(context).textTheme.labelSmall),
                const SizedBox(height: AppSpacing.md),
                Text(book.description),
                const SizedBox(height: AppSpacing.md),
                Text(book.available ? 'Available' : 'Currently on loan'),
                const SizedBox(height: AppSpacing.md),
                Text('Listed by ${book.ownerName}'),
                const SizedBox(height: AppSpacing.xl),
                if (isOwner)
                  OutlinedButton(
                    onPressed: () => context.push(AppRoutes.bookEdit(book.id)),
                    child: const Text('Edit listing'),
                  )
                else if (book.available)
                  const FilledButton(
                    onPressed: null, // wired up in step 5 (POST /books/{id}/requests)
                    child: Text('Request to borrow (coming soon)'),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}