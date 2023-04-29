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
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
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
      cardTheme: CardTheme(
        color: appColors.background,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: appColors.onBackground,
            width: 1.5,
            style: BorderStyle.solid,
          ),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: appColors.secondary,
        foregroundColor: appColors.onSecondary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          enableFeedback: false,
          backgroundColor: MaterialStateProperty.all<Color>(appColors.black),
          foregroundColor: MaterialStateProperty.all<Color>(appColors.white),
          textStyle: MaterialStateProperty.all<TextStyle>(
            textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w600,
              color: appColors.white,
            ),
          ),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: appColors.onBackground,
              width: 1.5,
              style: BorderStyle.solid,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: appColors.onBackground,
              width: 1.5,
              style: BorderStyle.solid,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: appColors.onBackground,
              width: 1.5,
              style: BorderStyle.solid,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: appColors.onBackground,
              width: 1.5,
              style: BorderStyle.solid,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: appColors.onBackground,
              width: 1.5,
              style: BorderStyle.solid,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: appColors.onBackground,
              width: 1.5,
              style: BorderStyle.solid,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
        ),
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: appColors.primary,
        inactiveTrackColor: appColors.onBackground,
        trackHeight: 6,
        trackShape: const RoundedRectSliderTrackShape(),
        rangeTrackShape: const RoundedRectRangeSliderTrackShape(),
        thumbColor: appColors.primary,
      ),
      iconButtonTheme: const IconButtonThemeData(
        style: ButtonStyle(
          enableFeedback: false,
        ),
      ),
      menuButtonTheme: const MenuButtonThemeData(
        style: ButtonStyle(
          enableFeedback: false,
        ),
      ),
      outlinedButtonTheme: const OutlinedButtonThemeData(
        style: ButtonStyle(
          enableFeedback: false,
        ),
      ),
      textButtonTheme: const TextButtonThemeData(
        style: ButtonStyle(
          enableFeedback: false,
        ),
      ),
      filledButtonTheme: const FilledButtonThemeData(
        style: ButtonStyle(
          enableFeedback: false,
        ),
      ),
      segmentedButtonTheme: const SegmentedButtonThemeData(
        style: ButtonStyle(
          enableFeedback: false,
        ),
      ),
    );
  }
}
