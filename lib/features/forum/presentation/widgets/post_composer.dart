import 'package:flutter/material.dart';

import '../../../../app/theme/app_spacing.dart';

class PostComposer extends StatefulWidget {
  const PostComposer({super.key, required this.onSubmit});
  final Future<void> Function(String body) onSubmit;

  @override
  State<PostComposer> createState() => _PostComposerState();
}

class _PostComposerState extends State<PostComposer> {
  final _controller = TextEditingController();
  bool _submitting = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final text = _controller.text.trim();
    if (text.isEmpty || _submitting) return;
    setState(() => _submitting = true);
    _controller.clear();
    await widget.onSubmit(text);
    if (mounted) setState(() => _submitting = false);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.sm),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              maxLength: 3000,
              maxLines: 3,
              minLines: 1,
              decoration: const InputDecoration(
                hintText: 'Add to the discussion',
                border: OutlineInputBorder(),
                counterText: '',
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          _submitting
              ? const SizedBox(
                  width: 40,
                  height: 40,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                )
              : IconButton(icon: const Icon(Icons.send), onPressed: _submit),
        ],
      ),
    );
  }
}