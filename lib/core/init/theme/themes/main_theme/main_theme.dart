import 'package:flutter/material.dart';

import '../../base_app_colors.dart';
import '../../itheme.dart';
import 'main_app_colors.dart';
import 'main_text_theme.dart';

class MainTheme implements ITheme {
  @override
  BaseAppColors get lightAppColors => MainAppColors.lightAppColors;

  @override
  BaseAppColors get darkAppColors => MainAppColors.darkAppColors;

  @override
  TextTheme get textTheme => MainTextTheme.textTheme;

  @override
  ThemeData brightnessTheme(Brightness brightness) {
    BaseAppColors appColors = brightness == Brightness.light ? lightAppColors : darkAppColors;
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      scaffoldBackgroundColor: appColors.background,
      iconTheme: IconThemeData(
        color: appColors.onBackground,
        size: 28,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: appColors.primary,
        foregroundColor: appColors.onPrimary,
        toolbarHeight: 75,
        iconTheme: IconThemeData(
          color: appColors.onPrimary,
          size: 28,
        ),
      ),
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: appColors.primary,
        onPrimary: appColors.onPrimary,
        secondary: appColors.secondary,
        onSecondary: appColors.onSecondary,
        tertiary: appColors.tertiary,
        onTertiary: appColors.onTertiary,
        background: appColors.background,
        onBackground: appColors.onBackground,
        surface: appColors.grey,
        onSurface: appColors.white,
        error: appColors.error,
        onError: appColors.onError,
      ),
      textTheme: textTheme.apply(
        bodyColor: appColors.onBackground,
        displayColor: appColors.onBackground,
        decorationColor: appColors.onBackground,
      ),
    );
  }
}
