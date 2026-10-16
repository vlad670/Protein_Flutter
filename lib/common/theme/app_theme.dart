import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract final class AppTheme {
  static final ThemeData light = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.seedColor,
      brightness: Brightness.light,
    ),
    useMaterial3: true,
  );

  static final ThemeData dark = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.seedColor,
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
  );
}
