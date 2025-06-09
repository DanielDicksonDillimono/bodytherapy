import 'package:flutter/material.dart';
import 'package:bodytherapy/ui/core/themes/colors.dart';

abstract final class AppTheme {
  static const textTheme = TextTheme(
    bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
    bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
    bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
    labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    labelMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    labelSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
  );

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: AppColors.lightColorScheme,
    scaffoldBackgroundColor: AppColors.grey1,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.grey1,
      foregroundColor: AppColors.black1,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.black1),
      bodyMedium: TextStyle(color: AppColors.black1),
      bodySmall: TextStyle(color: AppColors.black1),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: AppColors.darkColorScheme,
    scaffoldBackgroundColor: AppColors.grey2,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.grey2,
      foregroundColor: AppColors.white1,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.white1),
      bodyMedium: TextStyle(color: AppColors.white1),
      bodySmall: TextStyle(color: AppColors.white1),
    ),
  );
}
