import 'package:flutter/material.dart';

abstract class AppColors {
  /// Screen background (very light cool white).
  static const background = Color(0xFFFBFBFD);

  /// Card / section background — light grey (screenshot ~#F2F2F2 / #F2F4F6).
  static const surface = Color(0xFFF2F4F6);

  /// Main body text — dark charcoal (screenshot ~#212121; #2E3336 is fine).
  static const onSurface = Color(0xFF2E3336);

  /// Secondary labels: ШАГОВ, ВОЗДУХ, strikethrough tasks (~#757575).
  static const onSurfaceVariant = Color(0xFF757575);

  /// Forest green — logo, progress, links, gradient start (~#3D705E on design; #2D6957 ok).
  static const primaryColor = Color(0xFF2D6957);
  static const onPrimaryColor = Color(0xFFFFFFFF);

  /// «Цифровой баланс» + nav pill — pastel blue (~#DDE9F7 on design; #D3E4FE slightly more saturated).
  static const surfaceContainer = Color(0xFFD3E4FE);
  static const onSurfaceContainer = Color(0xFF435368);

  /// Mint accent — checkmarks, gradient end (~#98D1B1 / #A8E6CF on design).
  static const surfaceContainerLow = Color(0xFFA8E6CF);

  static const outline = Color(0xFF94A3B8);
  static const error = Color(0xFFEF4444);

  /// Warm yellow for sun / decorative accents (not #FF3B30 — that is system red, not in UI).
  static const tertiary = Color(0xFFFFC107);
  static const onTertiary = Color(0xFF3E2723);

  static const List<Color> startDayGradientColors = [
    Color(0xFF2D6957),
    Color(0xFFA8E6CF),
  ];

  static const LinearGradient primaryGradient = LinearGradient(
    colors: startDayGradientColors,
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
