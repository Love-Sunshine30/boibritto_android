import 'package:flutter/material.dart';

/// One type scale (M3 defaults). Weight is the primary differentiator —
/// title/body/metadata all share the same neutral ink color, per
/// architecture §9 ("typography carries hierarchy, not color").
class AppTypography {
  const AppTypography._();

  static TextTheme textTheme(TextTheme base) {
    return base.copyWith(
      // Book titles
      titleMedium: base.titleMedium?.copyWith(fontWeight: FontWeight.w600),
      titleLarge: base.titleLarge?.copyWith(fontWeight: FontWeight.w600),
      // Descriptions / message bodies
      bodyMedium: base.bodyMedium?.copyWith(fontWeight: FontWeight.w400),
      bodyLarge: base.bodyLarge?.copyWith(fontWeight: FontWeight.w400),
      // Metadata — dates, "by <author>"
      labelSmall: base.labelSmall?.copyWith(
        fontWeight: FontWeight.w500,
        letterSpacing: 0.4,
      ),
    );
  }
}