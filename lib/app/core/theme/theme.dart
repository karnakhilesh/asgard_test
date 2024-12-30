import 'package:asgard/app/core/theme/colors.dart';
import 'package:asgard/app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

// Light Theme configuration
final ThemeData lightTheme = ThemeData(
  primaryColor: AppColors.primary500,
  scaffoldBackgroundColor: AppColors.white500,
  textTheme: lightTextTheme,
  appBarTheme:
      _appBarTheme(lightTextTheme, AppColors.white500, AppColors.dark500),
  elevatedButtonTheme: _elevatedButtonTheme(),
  colorScheme: _colorScheme(false),
);

// Dark Theme configuration
final ThemeData darkTheme = ThemeData(
  primaryColor: AppColors.primary500,
  scaffoldBackgroundColor: AppColors.dark500,
  textTheme: darkTextTheme,
  appBarTheme:
      _appBarTheme(darkTextTheme, AppColors.primary500, AppColors.white500),
  elevatedButtonTheme: _elevatedButtonTheme(),
  colorScheme: _colorScheme(true),
);

// Method to configure AppBar theme based on text and background colors
AppBarTheme _appBarTheme(
        TextTheme textTheme, Color backgroundColor, Color foregroundColor) =>
    AppBarTheme(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      titleTextStyle: textTheme.titleLarge,
    );

// Method to configure ElevatedButton theme
ElevatedButtonThemeData _elevatedButtonTheme() => ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.white500,
        backgroundColor: AppColors.primary500,
      ),
    );

// Method to configure ColorScheme
ColorScheme _colorScheme(bool isDark) => isDark
    ? ColorScheme.dark(
        primary: AppColors.primary500,
        secondary: AppColors.secondary500,
        surface: AppColors.dark500,
        onPrimary: AppColors.white500,
        onSecondary: AppColors.white500,
      )
    : ColorScheme.light(
        primary: AppColors.primary500,
        secondary: AppColors.secondary500,
        surface: AppColors.white500,
        onPrimary: AppColors.white500,
        onSecondary: AppColors.white500,
      );
