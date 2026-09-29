import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/routes.dart';
import '../../../../app/theme/app_spacing.dart';
import '../../../../core/widgets/status_pill.dart';
import '../../../profile/application/own_profile_controller.dart';
import '../../../requests/application/request_to_borrow_controller.dart';
import '../../application/book_detail_controller.dart';

class BookDetailScreen extends ConsumerWidget {
  const BookDetailScreen({super.key, required this.bookId});
  final int bookId;

  Future<void> _requestToBorrow(BuildContext context, WidgetRef ref) async {
    final messageController = TextEditingController();
    final send = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Request to borrow'),
        content: TextField(
          controller: messageController,
          maxLength: 500,
          maxLines: 3,
          decoration: const InputDecoration(hintText: 'Optional message to the owner'),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
          FilledButton(onPressed: () => Navigator.pop(context, true), child: const Text('Send')),
        ],
      ),
    );
    if (send != true || !context.mounted) return;

    final request = await ref
        .read(requestToBorrowControllerProvider.notifier)
        .submit(bookId, message: messageController.text.trim());

    if (!context.mounted) return;
    if (request != null) {
      context.push(AppRoutes.requestDetail(request.id));
    } else {
      final message = ref.read(requestToBorrowControllerProvider).errorMessage;
      if (message != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookAsync = ref.watch(bookDetailControllerProvider(bookId));
    final ownProfile = ref.watch(ownProfileControllerProvider).maybeWhen(
      data: (profile) => profile,
      orElse: () => null,
    );
    final requestState = ref.watch(requestToBorrowControllerProvider);

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
                StatusPill(
                  label: book.available ? 'Available' : 'On loan',
                  tone: book.available ? StatusTone.accepted : StatusTone.returned,
                ),
                const SizedBox(height: AppSpacing.md),
                Text('Listed by ${book.ownerName}'),
                const SizedBox(height: AppSpacing.xl),
                if (isOwner)
                  OutlinedButton(
                    onPressed: () => context.push(AppRoutes.bookEdit(book.id)),
                    child: const Text('Edit listing'),
                  )
                else if (book.available)
                  FilledButton(
                    onPressed:
                        requestState.submitting ? null : () => _requestToBorrow(context, ref),
                    child: requestState.submitting
                        ? const SizedBox(
                            height: 18,
                            width: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('Request to borrow'),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}