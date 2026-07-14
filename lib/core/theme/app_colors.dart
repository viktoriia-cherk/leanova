import 'package:flutter/material.dart';


class AppColors {
  const AppColors._();

  // Bright energetic accent used for CTAs, active tab, progress indicators.
  static const Color _limeAccent = Color(0xFF8BD450);

  static const light = AppColorSet(
    primary: _limeAccent,
    onPrimary: Color(0xFF10230A),
    secondary: Color(0xFF2F6FED),
    background: Color(0xFFFAFAF8),
    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFF1B1F17),
    error: Color(0xFFE0483E),
    success: Color(0xFF3FA34D),
    border: Color(0xFFE3E5DE),
    muted: Color(0xFF8C9285),
  );

  static const dark = AppColorSet(
    primary: _limeAccent,
    onPrimary: Color(0xFF10230A),
    secondary: Color(0xFF6C9BFF),
    background: Color(0xFF13150F),
    surface: Color(0xFF1D211A),
    onSurface: Color(0xFFEDEFE8),
    error: Color(0xFFFF6B60),
    success: Color(0xFF63C773),
    border: Color(0xFF31352B),
    muted: Color(0xFF8C9285),
  );
}

/// A full light or dark palette exposed via [AppColors.light] / [AppColors.dark].
class AppColorSet {
  const AppColorSet({
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.background,
    required this.surface,
    required this.onSurface,
    required this.error,
    required this.success,
    required this.border,
    required this.muted,
  });

  final Color primary;
  final Color onPrimary;
  final Color secondary;
  final Color background;
  final Color surface;
  final Color onSurface;
  final Color error;
  final Color success;
  final Color border;
  final Color muted;
}
