import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_typography.dart';

/// Light/dark themes built from a single seed color — see architecture §9.
/// Dark mode is `ColorScheme.fromSeed(brightness: Brightness.dark)`, not a
/// separately hand-tuned palette.
class AppTheme {
  const AppTheme._();

  static ThemeData light() => _build(Brightness.light);

  static ThemeData dark() => _build(Brightness.dark);

  static ThemeData _build(Brightness brightness) {
    final scheme = ColorScheme.fromSeed(
      seedColor: kSeedColor,
      brightness: brightness,
    );
    final base = ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      brightness: brightness,
    );
    return base.copyWith(
      textTheme: AppTypography.textTheme(base.textTheme),
      extensions: [AppStatusColors.fromScheme(scheme)],
    );
  }
}