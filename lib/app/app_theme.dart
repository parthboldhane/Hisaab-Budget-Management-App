import 'package:flutter/material.dart';

import '../core/design/hisaab_colors.dart';
import '../core/design/hisaab_spacing.dart';
import '../core/design/hisaab_typography.dart';

abstract final class HisaabAppTheme {
  static final ThemeData light = _buildTheme(Brightness.light);
  static final ThemeData dark = _buildTheme(Brightness.dark);

  static ThemeData _buildTheme(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final colors =
        ColorScheme.fromSeed(
          seedColor: isDark ? HisaabColors.brandDark : HisaabColors.brand,
          brightness: brightness,
        ).copyWith(
          primary: isDark ? HisaabColors.brandDark : HisaabColors.brand,
          onPrimary: isDark
              ? HisaabColors.canvasDark
              : HisaabColors.surfaceLight,
          secondary: isDark ? HisaabColors.transferDark : HisaabColors.transfer,
          surface: isDark
              ? HisaabColors.surfaceDark
              : HisaabColors.surfaceLight,
          onSurface: isDark
              ? HisaabColors.primaryTextDark
              : HisaabColors.primaryText,
          onSurfaceVariant: isDark
              ? HisaabColors.secondaryTextDark
              : HisaabColors.secondaryText,
          surfaceContainerHighest: isDark
              ? HisaabColors.elevatedSurfaceDark
              : HisaabColors.elevatedSurface,
          surfaceContainerLow: isDark
              ? HisaabColors.surfaceDark
              : HisaabColors.surfaceLight,
          outlineVariant: isDark
              ? HisaabColors.dividerDark
              : HisaabColors.divider,
          error: isDark ? HisaabColors.expenseDark : HisaabColors.expense,
        );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colors,
      fontFamily: 'Roboto',
      scaffoldBackgroundColor: isDark
          ? HisaabColors.canvasDark
          : HisaabColors.canvas,
      dividerColor: isDark ? HisaabColors.dividerDark : HisaabColors.divider,
      textTheme: HisaabTypography.build(colors),
      appBarTheme: AppBarTheme(
        backgroundColor: colors.surface,
        foregroundColor: colors.onSurface,
        centerTitle: false,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleTextStyle: HisaabTypography.brand(colors),
      ),
      cardTheme: CardThemeData(
        color: colors.surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(HisaabSpacing.radius),
          side: BorderSide(color: colors.outlineVariant),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: colors.surface,
        indicatorColor: isDark
            ? HisaabColors.softBrandDark
            : HisaabColors.softBrand,
        elevation: 0,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colors.surface,
        surfaceTintColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(HisaabSpacing.radius),
          ),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colors.primary,
        foregroundColor: colors.onPrimary,
        elevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        highlightElevation: 0,
      ),
    );
  }
}
