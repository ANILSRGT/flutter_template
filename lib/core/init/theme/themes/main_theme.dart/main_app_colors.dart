import 'package:flutter/material.dart';

import '../../base_app_colors.dart';

class MainAppColors {
  static BaseAppColors get lightAppColors => BaseAppColors(
        primary: const Color(0xFF5C16DD),
        onPrimary: const Color(0xFF0E0D0D),
        secondary: const Color(0xFF370C86),
        onSecondary: const Color(0xFFFBFBFB),
        tertiary: const Color(0xFFE5E5E5),
        onTertiary: const Color(0xFF0E0D0D),
        background: const Color(0xFFFBFBFB),
        onBackground: const Color(0xFF0E0D0D),
        black: const Color(0xFF0E0D0D),
        white: const Color(0xFFFBFBFB),
        grey: const Color(0xFF767676),
        error: const Color(0xFF770505),
        onError: const Color(0xFFFBFBFB),
        warning: const Color(0xFFADAF14),
        onWarning: const Color(0xFFFBFBFB),
        success: const Color(0xFF0C9417),
        onSuccess: const Color(0xFFFBFBFB),
      );

  static BaseAppColors get darkAppColors => BaseAppColors(
        primary: const Color(0xFFA77EFF),
        onPrimary: const Color(0xFFB9B9B9),
        secondary: const Color(0xFF6C3BA3),
        onSecondary: const Color(0xFFFBFBFB),
        tertiary: const Color(0xFF323232),
        onTertiary: const Color(0xFFFBFBFB),
        background: const Color(0xFF111111),
        onBackground: const Color(0xFFFBFBFB),
        black: const Color(0xFFFBFBFB),
        white: const Color(0xFF131313),
        grey: const Color(0xFF3B3B3B),
        error: const Color(0xFF770505),
        onError: const Color(0xFFFBFBFB),
        warning: const Color(0xFFADAF14),
        onWarning: const Color(0xFFFBFBFB),
        success: const Color(0xFF0C9417),
        onSuccess: const Color(0xFFFBFBFB),
      );
}
