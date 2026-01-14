import 'package:flutter/material.dart';

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}

class ExtendedColor {
  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
  final Color seed;
  final Color value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;

  final ColorFamily darkMediumContrast;
}

class TerminalTheme {
  const TerminalTheme(this.textTheme);

  final TextTheme textTheme;

  List<ExtendedColor> get extendedColors => [];

  ThemeData dark() {
    return theme(darkScheme());
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  ThemeData light() {
    return theme(
      lightScheme(),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.surface,
    canvasColor: colorScheme.surface,
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colorScheme.primary),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colorScheme.primary),
      ),
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(),
  );

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffc8ffb2),
      surfaceTint: Color(0xff60e143),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff5cdd3f),
      onPrimaryContainer: Color(0xff010f00),
      secondary: Color(0xffc8ffb2),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xff90d47a),
      onSecondaryContainer: Color(0xff010f00),
      tertiary: Color(0xffddf3ff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xff55d0fc),
      onTertiaryContainer: Color(0xff000d13),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff0e150b),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffe6f4dc),
      outlineVariant: Color(0xffb9c7af),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdde5d4),
      inversePrimary: Color(0xff0d5400),
      primaryFixed: Color(0xff7dfe5d),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xff60e143),
      onPrimaryFixedVariant: Color(0xff011600),
      secondaryFixed: Color(0xffaff497),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xff94d87d),
      onSecondaryFixedVariant: Color(0xff011600),
      tertiaryFixed: Color(0xffbbe9ff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xff5ed4ff),
      onTertiaryFixedVariant: Color(0xff00131b),
      surfaceDim: Color(0xff0e150b),
      surfaceBright: Color(0xff4a5245),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1a2217),
      surfaceContainer: Color(0xff2b3327),
      surfaceContainerHigh: Color(0xff363e31),
      surfaceContainerHighest: Color(0xff41493c),
    );
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff77f857),
      surfaceTint: Color(0xff60e143),
      onPrimary: Color(0xff042d00),
      primaryContainer: Color(0xff2bb00c),
      onPrimaryContainer: Color(0xff000800),
      secondary: Color(0xffa9ee91),
      onSecondary: Color(0xff042d00),
      secondaryContainer: Color(0xff60a04d),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffaae5ff),
      onTertiary: Color(0xff002a37),
      tertiaryContainer: Color(0xff00a5cf),
      onTertiaryContainer: Color(0xff00060a),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff0e150b),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffd3e1c8),
      outline: Color(0xffa8b69f),
      outlineVariant: Color(0xff87947f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdde5d4),
      inversePrimary: Color(0xff0d5400),
      primaryFixed: Color(0xff7dfe5d),
      onPrimaryFixed: Color(0xff011600),
      primaryFixedDim: Color(0xff60e143),
      onPrimaryFixedVariant: Color(0xff074000),
      secondaryFixed: Color(0xffaff497),
      onSecondaryFixed: Color(0xff011600),
      secondaryFixedDim: Color(0xff94d87d),
      onSecondaryFixedVariant: Color(0xff074000),
      tertiaryFixed: Color(0xffbbe9ff),
      onTertiaryFixed: Color(0xff00131b),
      tertiaryFixedDim: Color(0xff5ed4ff),
      onTertiaryFixedVariant: Color(0xff003b4d),
      surfaceDim: Color(0xff0e150b),
      surfaceBright: Color(0xff3f473a),
      surfaceContainerLowest: Color(0xff040903),
      surfaceContainerLow: Color(0xff182015),
      surfaceContainer: Color(0xff222a1f),
      surfaceContainerHigh: Color(0xff2d3529),
      surfaceContainerHighest: Color(0xff384034),
    );
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff60e143),
      surfaceTint: Color(0xff60e143),
      onPrimary: Color(0xff063900),
      primaryContainer: Color(0xff2bb00c),
      onPrimaryContainer: Color(0xff063a00),
      secondary: Color(0xff94d87d),
      onSecondary: Color(0xff063900),
      secondaryContainer: Color(0xff165508),
      onSecondaryContainer: Color(0xff86c970),
      tertiary: Color(0xff5ed4ff),
      onTertiary: Color(0xff003545),
      tertiaryContainer: Color(0xff00a5cf),
      onTertiaryContainer: Color(0xff003545),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff0e150b),
      onSurface: Color(0xffdde5d4),
      onSurfaceVariant: Color(0xffbdcbb3),
      outline: Color(0xff87957f),
      outlineVariant: Color(0xff3e4a38),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdde5d4),
      inversePrimary: Color(0xff136e00),
      primaryFixed: Color(0xff7dfe5d),
      onPrimaryFixed: Color(0xff022100),
      primaryFixedDim: Color(0xff60e143),
      onPrimaryFixedVariant: Color(0xff0c5300),
      secondaryFixed: Color(0xffaff497),
      onSecondaryFixed: Color(0xff022100),
      secondaryFixedDim: Color(0xff94d87d),
      onSecondaryFixedVariant: Color(0xff135206),
      tertiaryFixed: Color(0xffbbe9ff),
      onTertiaryFixed: Color(0xff001f29),
      tertiaryFixedDim: Color(0xff5ed4ff),
      onTertiaryFixedVariant: Color(0xff004d63),
      surfaceDim: Color(0xff0e150b),
      surfaceBright: Color(0xff343b2f),
      surfaceContainerLowest: Color(0xff091007),
      surfaceContainerLow: Color(0xff161e13),
      surfaceContainer: Color(0xff1a2217),
      surfaceContainerHigh: Color(0xff252c21),
      surfaceContainerHighest: Color(0xff2f372b),
    );
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff053400),
      surfaceTint: Color(0xff136e00),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff0d5600),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff053400),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff165508),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff00313f),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff005066),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff4fcea),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff242f1f),
      outlineVariant: Color(0xff404d3b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3327),
      inversePrimary: Color(0xff60e143),
      primaryFixed: Color(0xff0d5600),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff073c00),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff165508),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff073c00),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff005066),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff003848),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffb3bbab),
      surfaceBright: Color(0xfff4fcea),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffebf4e2),
      surfaceContainer: Color(0xffdde5d4),
      surfaceContainerHigh: Color(0xffcfd7c6),
      surfaceContainerHighest: Color(0xffc1c9b9),
    );
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff074000),
      surfaceTint: Color(0xff136e00),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff187f00),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff074000),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff3d7b2d),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff003b4d),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff007796),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff4fcea),
      onSurface: Color(0xff0c1309),
      onSurfaceVariant: Color(0xff2e3928),
      outline: Color(0xff4a5643),
      outlineVariant: Color(0xff64715d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3327),
      inversePrimary: Color(0xff60e143),
      primaryFixed: Color(0xff187f00),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff106300),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff3d7b2d),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff246115),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff007796),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff005c75),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc1c9b9),
      surfaceBright: Color(0xfff4fcea),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeef6e5),
      surfaceContainer: Color(0xffe3ebda),
      surfaceContainerHigh: Color(0xffd7e0ce),
      surfaceContainerHighest: Color(0xffccd4c3),
    );
  }

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff136e00),
      surfaceTint: Color(0xff136e00),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff2bb00c),
      onPrimaryContainer: Color(0xff063a00),
      secondary: Color(0xff2e6b1f),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffacf294),
      onSecondaryContainer: Color(0xff327023),
      tertiary: Color(0xff006782),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff00a5cf),
      onTertiaryContainer: Color(0xff003545),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfff4fcea),
      onSurface: Color(0xff161e13),
      onSurfaceVariant: Color(0xff3e4a38),
      outline: Color(0xff6e7b66),
      outlineVariant: Color(0xffbdcbb3),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3327),
      inversePrimary: Color(0xff60e143),
      primaryFixed: Color(0xff7dfe5d),
      onPrimaryFixed: Color(0xff022100),
      primaryFixedDim: Color(0xff60e143),
      onPrimaryFixedVariant: Color(0xff0c5300),
      secondaryFixed: Color(0xffaff497),
      onSecondaryFixed: Color(0xff022100),
      secondaryFixedDim: Color(0xff94d87d),
      onSecondaryFixedVariant: Color(0xff135206),
      tertiaryFixed: Color(0xffbbe9ff),
      onTertiaryFixed: Color(0xff001f29),
      tertiaryFixedDim: Color(0xff5ed4ff),
      onTertiaryFixedVariant: Color(0xff004d63),
      surfaceDim: Color(0xffd4ddcc),
      surfaceBright: Color(0xfff4fcea),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeef6e5),
      surfaceContainer: Color(0xffe8f1df),
      surfaceContainerHigh: Color(0xffe3ebda),
      surfaceContainerHighest: Color(0xffdde5d4),
    );
  }
}
