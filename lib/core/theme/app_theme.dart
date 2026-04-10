import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    final base = ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      brightness: Brightness.light,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: base.copyWith(
        primary: AppColors.primaryColor,
        onPrimary: AppColors.onPrimaryColor,
        surface: AppColors.surface,
        surfaceContainerLow: AppColors.surfaceContainerLow,
        onSurface: AppColors.onSurface,
        onSurfaceVariant: AppColors.onSurfaceVariant,
        surfaceContainer: AppColors.surfaceContainer,
        outline: AppColors.outline,
        error: AppColors.error,
        tertiary: AppColors.tertiary,
        onTertiary: AppColors.onTertiary,
      ),
    );
  }
}
