import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/routes.dart';
import '../../application/thread_list_controller.dart';

class ThreadListScreen extends ConsumerWidget {
  const ThreadListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(threadListControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Messages')),
      body: async.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text("Couldn't load messages: $err")),
        data: (threads) {
          if (threads.isEmpty) {
            return const Center(child: Text('No conversations yet.'));
          }
          return RefreshIndicator(
            onRefresh: () => ref.read(threadListControllerProvider.notifier).refresh(),
            child: ListView.builder(
              itemCount: threads.length,
              itemBuilder: (context, index) {
                final t = threads[index];
                return ListTile(
                  title: Text(t.bookTitle),
                  subtitle: Text(
                    '${t.otherParticipantName ?? 'Someone'}: ${t.lastMessagePreview}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Text(_relativeTime(t.lastMessageAt)),
                  onTap: () => context.push(AppRoutes.threadDetail(t.requestId)),
                );
              },
            ),
          );
        },
      ),
    );
  }

  String _relativeTime(DateTime time) {
    final diff = DateTime.now().difference(time);
    if (diff.inMinutes < 1) return 'now';
    if (diff.inHours < 1) return '${diff.inMinutes}m';
    if (diff.inDays < 1) return '${diff.inHours}h';
    return '${diff.inDays}d';
  }
}