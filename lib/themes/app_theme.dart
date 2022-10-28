import 'package:expense_tracker_app/themes/colors.dart';
import 'package:flutter/material.dart';

ThemeData pocketTheme = _buildThemeLight();

ThemeData _buildThemeLight() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      secondary: colorBlueDark,
      primary: colorBlueDark,
    ),
    textTheme: _buildTextTheme(base.textTheme),
  );
}

TextTheme _buildTextTheme(TextTheme base) {
  return base
      .copyWith(
        displayLarge: base.displayLarge!
            .copyWith(fontSize: 57, fontWeight: FontWeight.w400),
        displayMedium: base.displayMedium!.copyWith(
          fontSize: 45,
          fontWeight: FontWeight.w400,
        ),
        displaySmall: base.displaySmall!.copyWith(
          fontSize: 36,
          fontWeight: FontWeight.w400,
        ),
        headlineLarge: base.headlineLarge!.copyWith(
          fontSize: 32,
          fontWeight: FontWeight.w400,
        ),
        headlineMedium: base.headlineMedium!.copyWith(
          fontSize: 28,
          fontWeight: FontWeight.w400,
        ),
      headlineSmall: base.headlineSmall!.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w400,
        ),
      titleLarge: base.titleLarge!.copyWith(
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
      titleMedium: base.titleMedium!.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      titleSmall: base.titleSmall!.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      labelLarge: base.labelLarge!.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      labelMedium: base.labelMedium!.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      labelSmall: base.labelSmall!.copyWith(
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
      bodyLarge: base.bodyLarge!.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      bodyMedium: base.bodyMedium!.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      bodySmall: base.bodySmall!.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      )
      .apply(
        fontFamily: 'Poppins',
      );
}
