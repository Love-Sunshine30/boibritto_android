import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/theme/app_spacing.dart';
import '../../../profile/application/own_profile_controller.dart';
import '../../application/thread_detail_controller.dart';

class ThreadDetailScreen extends ConsumerStatefulWidget {
  const ThreadDetailScreen({super.key, required this.requestId});
  final int requestId;

  @override
  ConsumerState<ThreadDetailScreen> createState() => _ThreadDetailScreenState();
}

class _ThreadDetailScreenState extends ConsumerState<ThreadDetailScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _send() async {
    final text = _controller.text;
    if (text.trim().isEmpty) return;
    final composer = ref.read(composerControllerProvider(widget.requestId).notifier);
    _controller.clear();
    final ok = await composer.send(text);
    if (!ok && mounted) {
      final message = ref.read(composerControllerProvider(widget.requestId)).errorMessage;
      if (message != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final messagesAsync = ref.watch(threadMessagesProvider(widget.requestId));
    final myId = ref.watch(ownProfileControllerProvider).maybeWhen(
      data: (profile) => profile.user.id,
      orElse: () => null,
    );
    final composerState = ref.watch(composerControllerProvider(widget.requestId));

    return Scaffold(
      appBar: AppBar(title: const Text('Conversation')),
      body: Column(
        children: [
          Expanded(
            child: messagesAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, _) => Center(child: Text("Couldn't load messages: $err")),
              data: (messages) {
                if (messages.isEmpty) return const Center(child: Text('Say hello.'));
                return ListView.builder(
                  reverse: true,
                  padding: const EdgeInsets.all(AppSpacing.md),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    // Firestore stream is oldest→newest; reverse the index
                    // for a reverse ListView so newest stays at the bottom.
                    final message = messages[messages.length - 1 - index];
                    final isMine = message.senderId == myId;
                    return Align(
                      alignment: isMine ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.md,
                          vertical: AppSpacing.sm,
                        ),
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.75,
                        ),
                        decoration: BoxDecoration(
                          color: isMine
                              ? Theme.of(context).colorScheme.primaryContainer
                              : Theme.of(context).colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(message.body),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.sm),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      maxLength: 2000,
                      decoration: const InputDecoration(
                        hintText: 'Message',
                        border: OutlineInputBorder(),
                        counterText: '',
                      ),
                      onSubmitted: (_) => _send(),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  composerState.sending
                      ? const SizedBox(
                          width: 40,
                          height: 40,
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        )
                      : IconButton(icon: const Icon(Icons.send), onPressed: _send),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}