import 'package:flutter/material.dart';

final ThemeData mcThemeData = new ThemeData(
  brightness: Brightness.light,
  primarySwatch: MaterialColor(MCColors.green[900].hashCode, MCColors.green),
  primaryColor: MCColors.green[900],
  primaryColorBrightness: Brightness.light,
  accentColor: MCColors.orange[900],
  accentColorBrightness: Brightness.light,
  appBarTheme: AppBarTheme(
    color: MCColors.white[900],
    elevation: 0
  ),
  scaffoldBackgroundColor: MCColors.white[900],
  fontFamily: 'Nunito'
);

class MCColors {
  MCColors._();

  static const Map<int, Color> green = const <int, Color> {
    50 : const Color(0xFF59B657),
    100: const Color(0xFF59B657),
    200: const Color(0xFF59B657),
    300: const Color(0xFF59B657),
    400: const Color(0xFF59B657),
    500: const Color(0xFF70DA6E),
    600: const Color(0xFF59B657),
    700: const Color(0xFF59B657),
    800: const Color(0xFF59B657),
    900: const Color(0xFF59B657)
  };

  static const Map<int, Color> white = const <int, Color> {
    50 : const Color(0xFFF5F5F5),
    100: const Color(0xFFF5F5F5),
    200: const Color(0xFFF5F5F5),
    300: const Color(0xFFF5F5F5),
    400: const Color(0xFFF5F5F5),
    500: const Color(0xFFF5F5F5),
    600: const Color(0xFFF5F5F5),
    700: const Color(0xFFF5F5F5),
    800: const Color(0xFFF5F5F5),
    900: const Color(0xFFFFFFFF)
  };

  static const Map<int, Color> black = const <int, Color> {
    50 : const Color(0xFF1F1F1F),
    100: const Color(0xFF1F1F1F),
    200: const Color(0xFF1F1F1F),
    300: const Color(0xFF1F1F1F),
    400: const Color(0xFF1F1F1F),
    500: const Color(0xFF656565),
    600: const Color(0xFF1F1F1F),
    700: const Color(0xFF1F1F1F),
    800: const Color(0xFF1F1F1F),
    900: const Color(0xFF1F1F1F)
  };

  static const Map<int, Color> orange = const <int, Color> {
    50 : const Color(0xFFE89447),
    100: const Color(0xFFE89447),
    200: const Color(0xFFE89447),
    300: const Color(0xFFE89447),
    400: const Color(0xFFE89447),
    500: const Color(0xFFE89447),
    600: const Color(0xFFE89447),
    700: const Color(0xFFE89447),
    800: const Color(0xFFE89447),
    900: const Color(0xFFE89447)
  };
}