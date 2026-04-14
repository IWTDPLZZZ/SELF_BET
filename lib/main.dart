import 'package:flutter/material.dart';
import 'package:self_bet/core/theme/app_theme.dart';
import 'package:self_bet/features/step_tracker/presentation/home_sceen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Self-Bet',
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}

