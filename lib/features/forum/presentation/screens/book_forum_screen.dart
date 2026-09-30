import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/routes.dart';
import '../../../../app/theme/app_spacing.dart';
import '../../../../core/errors/failure.dart';
import '../../../books/application/book_detail_controller.dart';
import '../../../profile/application/own_profile_controller.dart';
import '../../application/forum_thread_controller.dart';
import '../../data/models/post.dart';
import '../widgets/post_composer.dart';
import '../widgets/post_tile.dart';

class BookForumScreen extends ConsumerStatefulWidget {
  const BookForumScreen({super.key, required this.bookId});
  final int bookId;

  @override
  ConsumerState<BookForumScreen> createState() => _BookForumScreenState();
}

class _BookForumScreenState extends ConsumerState<BookForumScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >
        _scrollController.position.maxScrollExtent - 200) {
      ref.read(forumThreadControllerProvider(widget.bookId).notifier).loadMore();
    }
  }

  Future<void> _submitPost(String body) async {
    final failure =
        await ref.read(forumThreadControllerProvider(widget.bookId).notifier).createPost(body);
    if (failure == null || !mounted) return;
    if (failure is ForbiddenFailure) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Add a WhatsApp number to your profile before posting.'),
          action: SnackBarAction(
            label: 'Complete profile',
            onPressed: () => context.push(AppRoutes.completeProfile),
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Couldn't post — try again.")));
    }
  }

  Future<void> _handleEdit(Post post, String body) async {
    final failure = await ref
        .read(forumThreadControllerProvider(widget.bookId).notifier)
        .editPost(post.id, body);
    if (failure != null && mounted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Couldn't save the edit — try again.")));
    }
  }

  Future<void> _handleDelete(Post post) async {
    final failure =
        await ref.read(forumThreadControllerProvider(widget.bookId).notifier).deletePost(post.id);
    if (failure != null && mounted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Couldn't delete — try again.")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final async = ref.watch(forumThreadControllerProvider(widget.bookId));
    final myId = ref.watch(ownProfileControllerProvider).maybeWhen(
      data: (profile) => profile.user.id,
      orElse: () => null,
    );

    final bookTitle = ref.watch(bookDetailControllerProvider(widget.bookId)).maybeWhen(
      data: (book) => book.title,
      orElse: () => null,
    );

    return Scaffold(
      appBar: AppBar(title: Text(bookTitle ?? 'Discussion')),
      body: Column(
        children: [
          Expanded(
            child: async.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, _) => Center(child: Text("Couldn't load the discussion: $err")),
              data: (thread) {
                if (thread.posts.isEmpty) {
                  return const Center(child: Text('No posts yet — start the discussion.'));
                }
                return RefreshIndicator(
                  onRefresh: () =>
                      ref.read(forumThreadControllerProvider(widget.bookId).notifier).refresh(),
                  child: ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.all(AppSpacing.md),
                    itemCount: thread.posts.length + (thread.hasMore ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index >= thread.posts.length) {
                        return const Padding(
                          padding: EdgeInsets.all(AppSpacing.md),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }
                      final post = thread.posts[index];
                      return PostTile(
                        post: post,
                        isOwnPost: myId != null && myId == post.userId,
                        onEdit: (body) => _handleEdit(post, body),
                        onDelete: () => _handleDelete(post),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          SafeArea(child: PostComposer(onSubmit: _submitPost)),
        ],
      ),
    );
  }
}