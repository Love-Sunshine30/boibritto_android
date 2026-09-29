import 'package:flutter/material.dart';

/// Seed color — one brand accent ("book" association), still minimal.
/// M3's ColorScheme.fromSeed derives every surface/tonal role from this —
/// never hand-pick greys elsewhere.
const Color kSeedColor = Color(0xFFB8860B);

/// The one status-chip color mapping in the whole app, used for both
/// [BorrowRequest.status] and [Book.available] via the shared `StatusPill`
/// widget (added in a later step). Fixed 5-color mapping, tone-based (not
/// full-card background color) per architecture §9.
class AppStatusColors extends ThemeExtension<AppStatusColors> {
  const AppStatusColors({
    required this.pendingBg,
    required this.pendingFg,
    required this.acceptedBg,
    required this.acceptedFg,
    required this.activeBg,
    required this.activeFg,
    required this.rejectedBg,
    required this.rejectedFg,
    required this.returnedBg,
    required this.returnedFg,
  });

  final Color pendingBg;
  final Color pendingFg;
  final Color acceptedBg;
  final Color acceptedFg;
  final Color activeBg;
  final Color activeFg;
  final Color rejectedBg;
  final Color rejectedFg;
  final Color returnedBg;
  final Color returnedFg;

  factory AppStatusColors.fromScheme(ColorScheme scheme) {
    return AppStatusColors(
      // pending — neutral, outline-tone
      pendingBg: scheme.surfaceContainerHighest,
      pendingFg: scheme.onSurfaceVariant,
      // accepted — primary-tone
      acceptedBg: scheme.primaryContainer,
      acceptedFg: scheme.onPrimaryContainer,
      // active — tertiary-tone
      activeBg: scheme.tertiaryContainer,
      activeFg: scheme.onTertiaryContainer,
      // rejected — error-tone, muted (not alarm-red)
      rejectedBg: scheme.errorContainer,
      rejectedFg: scheme.onErrorContainer,
      // returned — surfaceVariant-tone, quiet (it's done)
      returnedBg: scheme.surfaceContainerHighest,
      returnedFg: scheme.onSurfaceVariant,
    );
  }

  @override
  AppStatusColors copyWith({
    Color? pendingBg,
    Color? pendingFg,
    Color? acceptedBg,
    Color? acceptedFg,
    Color? activeBg,
    Color? activeFg,
    Color? rejectedBg,
    Color? rejectedFg,
    Color? returnedBg,
    Color? returnedFg,
  }) {
    return AppStatusColors(
      pendingBg: pendingBg ?? this.pendingBg,
      pendingFg: pendingFg ?? this.pendingFg,
      acceptedBg: acceptedBg ?? this.acceptedBg,
      acceptedFg: acceptedFg ?? this.acceptedFg,
      activeBg: activeBg ?? this.activeBg,
      activeFg: activeFg ?? this.activeFg,
      rejectedBg: rejectedBg ?? this.rejectedBg,
      rejectedFg: rejectedFg ?? this.rejectedFg,
      returnedBg: returnedBg ?? this.returnedBg,
      returnedFg: returnedFg ?? this.returnedFg,
    );
  }

  @override
  AppStatusColors lerp(ThemeExtension<AppStatusColors>? other, double t) {
    if (other is! AppStatusColors) return this;
    return AppStatusColors(
      pendingBg: Color.lerp(pendingBg, other.pendingBg, t)!,
      pendingFg: Color.lerp(pendingFg, other.pendingFg, t)!,
      acceptedBg: Color.lerp(acceptedBg, other.acceptedBg, t)!,
      acceptedFg: Color.lerp(acceptedFg, other.acceptedFg, t)!,
      activeBg: Color.lerp(activeBg, other.activeBg, t)!,
      activeFg: Color.lerp(activeFg, other.activeFg, t)!,
      rejectedBg: Color.lerp(rejectedBg, other.rejectedBg, t)!,
      rejectedFg: Color.lerp(rejectedFg, other.rejectedFg, t)!,
      returnedBg: Color.lerp(returnedBg, other.returnedBg, t)!,
      returnedFg: Color.lerp(returnedFg, other.returnedFg, t)!,
    );
  }
}