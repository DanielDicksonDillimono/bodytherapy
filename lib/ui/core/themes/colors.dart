import 'package:flutter/material.dart';

abstract final class AppColors {
  static const black1 = Color(0xFF101010);
  static const white1 = Color(0xFFFFFFFF);
  static const grey1 = Color(0xFFF2F2F2);
  static const grey2 = Color(0xFF4D4D4D);
  static const grey3 = Color(0xFFA4A4A4);
  static const vibrantOrange = Color(0xFFFFA500);
  static const electricBlue = Color(0xFF00BFFF);
  static const neonGreen = Color(0xFF32CD32);
  static const warmYellow = Color(0xFFFFD700);
  static const brightRed = Color(0xFFFF0000);

  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: vibrantOrange,
    onPrimary: black1,
    secondary: neonGreen,
    onSecondary: black1,
    surface: grey1,
    onSurface: black1,
    error: brightRed,
    onError: white1,
  );

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: electricBlue,
    onPrimary: black1,
    secondary: warmYellow,
    onSecondary: black1,
    surface: grey2,
    onSurface: white1,
    error: brightRed,
    onError: black1,
  );
}
