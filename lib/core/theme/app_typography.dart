import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Builds the Poppins-based [TextTheme] shared by light and dark themes.
/// Screens must read styles via `Theme.of(context).textTheme`, never inline
/// `TextStyle` font sizes.
class AppTypography {
  const AppTypography._();

  static TextTheme textTheme(Color onSurface) {
    final base = GoogleFonts.poppinsTextTheme();
    return base
        .copyWith(
          displayLarge: base.displayLarge?.copyWith(
            fontSize: 40,
            fontWeight: FontWeight.w700,
            color: onSurface,
          ),
          headlineMedium: base.headlineMedium?.copyWith(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: onSurface,
          ),
          titleLarge: base.titleLarge?.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: onSurface,
          ),
          titleMedium: base.titleMedium?.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: onSurface,
          ),
          bodyLarge: base.bodyLarge?.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: onSurface,
          ),
          bodyMedium: base.bodyMedium?.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: onSurface,
          ),
          labelLarge: base.labelLarge?.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: onSurface,
          ),
          labelSmall: base.labelSmall?.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: onSurface,
          ),
        )
        .apply(bodyColor: onSurface, displayColor: onSurface);
  }
}
