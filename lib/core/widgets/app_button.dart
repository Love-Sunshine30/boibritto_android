import 'package:flutter/material.dart';

enum AppButtonVariant { filled, tonal, text }

/// The only three button treatments in the app — see architecture §9.
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.filled,
    this.loading = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final onTap = loading ? null : onPressed;
    final child = loading
        ? const SizedBox(
            height: 18,
            width: 18,
            child: CircularProgressIndicator(strokeWidth: 2),
          )
        : Text(label);

    return switch (variant) {
      AppButtonVariant.filled => FilledButton(onPressed: onTap, child: child),
      AppButtonVariant.tonal => FilledButton.tonal(onPressed: onTap, child: child),
      AppButtonVariant.text => TextButton(onPressed: onTap, child: child),
    };
  }
}