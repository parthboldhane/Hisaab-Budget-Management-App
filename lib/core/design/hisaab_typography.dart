import 'package:flutter/material.dart';

abstract final class HisaabTypography {
  static TextTheme build(ColorScheme colors) {
    return TextTheme(
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: colors.onSurface,
        height: 1.2,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: colors.onSurface,
        height: 1.25,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: colors.onSurface,
      ),
      bodyLarge: TextStyle(fontSize: 16, color: colors.onSurface, height: 1.4),
      bodyMedium: TextStyle(fontSize: 14, color: colors.onSurface, height: 1.4),
      bodySmall: TextStyle(
        fontSize: 12,
        color: colors.onSurfaceVariant,
        height: 1.35,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: colors.onSurface,
      ),
    ).apply(fontFamily: 'Roboto');
  }

  static TextStyle brand(ColorScheme colors) => TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.4,
    color: colors.onSurface,
  );
}
