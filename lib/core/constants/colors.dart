import 'package:flutter/material.dart';

abstract class AppColors {
  /// Cool grey-blue scaffold (lighter than #F0F3F6, still off-white vs cards).
  static const background = Color(0xFFF5F7F9);
  /// Pure white for app bar and elevated cards on [background].
  static const surfaceWhite = Color(0xFFFFFFFF);
  static const surface = Color(0xFFF2F4F6);
  static const onSurface = Color(0xFF2E3336);

  static const primaryColor = Color(0xFF2D6957);
  static const onPrimaryColor = Color(0xFFFFFFFF);

  static const surfaceContainer = Color(0xFFD3E4FE);
  static const onSurfaceContainer = Color(0xFF435368);

  static const surfaceContainerLow = Color(0xFFB1EFD8);

  static const outline = Color(0xFF94A3B8);      
  static const error = Color(0xFFEF4444);        
  static const tertiary = Color(0xFFFF3B30);

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


