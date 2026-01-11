import 'package:flutter/material.dart';

class AppTheme {
  // Define the Terminal Green color
  static const Color terminalGreen = Color(0xFF00FF41);

  // --- LIGHT THEME ---
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: terminalGreen,
      primary: const Color(
        0xFF008020,
      ), // Slightly darker green for light mode readability
      surface: Colors.white,
    ),
  );

  // --- DARK THEME (OLED Black) ---
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: terminalGreen,
      onPrimary: Colors.black,
      secondary: terminalGreen,
      onSecondary: Colors.black,
      error: Color(0xFFCF6679),
      onError: Colors.black,
      surface: Colors.black, // Pure Black for OLED
      onSurface: Colors.white,
      outline: terminalGreen,
    ),
    scaffoldBackgroundColor: Colors.black, // Pure Black background
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: terminalGreen,
      elevation: 0,
    ),
    chipTheme: const ChipThemeData(
      side: BorderSide(
        color: terminalGreen,
      ),
      checkmarkColor: Colors.black,
      iconTheme: IconThemeData(color: terminalGreen),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: terminalGreen.withValues(alpha: 0.5)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: terminalGreen),
      ),
      labelStyle: const TextStyle(color: terminalGreen),
      prefixStyle: const TextStyle(color: terminalGreen),
    ),
  );

  // TODO(ant): bundle a monospaced font and apply these shadows to textTheme
  List<Shadow> terminalGlow = [
    const Shadow(
      blurRadius: 3,
      color: terminalGreen,
    ),
    Shadow(
      blurRadius: 10,
      color: terminalGreen.withAlpha(128),
    ),
  ];
}
