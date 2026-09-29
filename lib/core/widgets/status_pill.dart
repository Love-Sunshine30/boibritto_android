import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';

/// The one status-chip implementation in the app — parameterized by tone,
/// used for both BorrowRequest.status and Book.available (architecture §9).
enum StatusTone { pending, accepted, active, rejected, returned }

class StatusPill extends StatelessWidget {
  const StatusPill({super.key, required this.label, required this.tone});
  final String label;
  final StatusTone tone;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppStatusColors>()!;
    final (bg, fg) = switch (tone) {
      StatusTone.pending => (colors.pendingBg, colors.pendingFg),
      StatusTone.accepted => (colors.acceptedBg, colors.acceptedFg),
      StatusTone.active => (colors.activeBg, colors.activeFg),
      StatusTone.rejected => (colors.rejectedBg, colors.rejectedFg),
      StatusTone.returned => (colors.returnedBg, colors.returnedFg),
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(999)),
      child: Text(label, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: fg)),
    );
  }
}