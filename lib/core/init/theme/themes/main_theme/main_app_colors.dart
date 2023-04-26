import 'package:flutter/material.dart';

import '../../base_app_colors.dart';

class MainAppColors {
  static BaseAppColors get lightAppColors => BaseAppColors(
        primary: const Color(0xFFDD4819),
        onPrimary: const Color(0xFFFBFBFB),
        secondary: const Color(0xFFDD7719),
        onSecondary: const Color(0xFFFBFBFB),
        tertiary: const Color(0xFF1FBD84),
        onTertiary: const Color(0xFFFBFBFB),
        background: const Color(0xFFFBFBFB),
        onBackground: const Color(0xFF1D1D1D),
        black: const Color(0xFF1D1D1D),
        white: const Color(0xFFFBFBFB),
        grey: const Color(0xFF4D4D4D),
        onGrey: const Color(0xFFFBFBFB),
        error: const Color(0xFFFF3131),
        onError: const Color(0xFFFBFBFB),
        warning: const Color(0xFFDDBE19),
        onWarning: const Color(0xFFFBFBFB),
        success: const Color(0xFF1FBD2F),
        onSuccess: const Color(0xFFFBFBFB),
      );

  static BaseAppColors get darkAppColors => BaseAppColors(
        primary: const Color(0xFF4B4B4B),
        onPrimary: const Color(0xFFFBFBFB),
        secondary: const Color(0xFF525252),
        onSecondary: const Color(0xFFFBFBFB),
        tertiary: const Color(0xFF303030),
        onTertiary: const Color(0xFFFBFBFB),
        background: const Color(0xFF1D1D1D),
        onBackground: const Color(0xFFFBFBFB),
        black: const Color(0xFF171717),
        white: const Color(0xFFFBFBFB),
        grey: const Color(0xFF767676),
        onGrey: const Color(0xFFFBFBFB),
        error: const Color(0xFF430D0D),
        onError: const Color(0xFFFBFBFB),
        warning: const Color(0xFF605812),
        onWarning: const Color(0xFFFBFBFB),
        success: const Color(0xFF0A4410),
        onSuccess: const Color(0xFFFBFBFB),
      );
}
