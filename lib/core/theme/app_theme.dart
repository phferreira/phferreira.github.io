import 'package:flutter/material.dart';

enum AppThemeMode { light, dark, custom }

class AppTheme {
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF80955D),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFD1CDB2),
      );

  static ThemeData get dark {
    final darkScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF80955D),
      brightness: Brightness.dark,
    ).copyWith(
      onSurface: const Color(0xFFECE8D6),
      onSurfaceVariant: const Color(0xFFD7D2BE),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: darkScheme,
      scaffoldBackgroundColor: const Color(0xFF1B1E17),
      textTheme: ThemeData(brightness: Brightness.dark).textTheme.apply(
            bodyColor: darkScheme.onSurface,
            displayColor: darkScheme.onSurface,
          ),
    );
  }

  static ThemeData get custom => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF5D8A95),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFD8E7E9),
      );

  static ThemeData byMode(AppThemeMode mode) {
    switch (mode) {
      case AppThemeMode.dark:
        return dark;
      case AppThemeMode.custom:
        return custom;
      case AppThemeMode.light:
        return light;
    }
  }
}
