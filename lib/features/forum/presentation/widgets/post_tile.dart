import 'package:flutter/material.dart';

import '../../../../app/theme/app_spacing.dart';
import '../../data/models/post.dart';

class PostTile extends StatelessWidget {
  const PostTile({
    super.key,
    required this.post,
    required this.isOwnPost,
    required this.onEdit,
    required this.onDelete,
  });

  final Post post;
  final bool isOwnPost;
  final void Function(String newBody) onEdit;
  final VoidCallback onDelete;

  Future<void> _showEditDialog(BuildContext context) async {
    final controller = TextEditingController(text: post.body);
    final newBody = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit post'),
        content: TextField(controller: controller, maxLines: 4, maxLength: 3000),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          FilledButton(
            onPressed: () => Navigator.pop(context, controller.text.trim()),
            child: const Text('Save'),
          ),
        ],
      ),
    );
    if (newBody != null && newBody.isNotEmpty && newBody != post.body) {
      onEdit(newBody);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(post.userName, style: Theme.of(context).textTheme.titleMedium),
                ),
                if (post.edited)
                  Text('(edited)', style: Theme.of(context).textTheme.labelSmall),
                if (isOwnPost)
                  PopupMenuButton<String>(
                    onSelected: (value) {
                      if (value == 'edit') _showEditDialog(context);
                      if (value == 'delete') onDelete();
                    },
                    itemBuilder: (context) => const [
                      PopupMenuItem(value: 'edit', child: Text('Edit')),
                      PopupMenuItem(value: 'delete', child: Text('Delete')),
                    ],
                  ),
              ],
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(post.body),
            const SizedBox(height: AppSpacing.xs),
            Text(_relativeTime(post.createdAt), style: Theme.of(context).textTheme.labelSmall),
          ],
        ),
      ),
    );
  }

  String _relativeTime(DateTime time) {
    final diff = DateTime.now().difference(time);
    if (diff.inMinutes < 1) return 'now';
    if (diff.inHours < 1) return '${diff.inMinutes}m ago';
    if (diff.inDays < 1) return '${diff.inHours}h ago';
    return '${diff.inDays}d ago';
  }
}