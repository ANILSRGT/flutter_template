import 'package:flutter/material.dart';

import 'base_app_colors.dart';

abstract class ITheme {
  BaseAppColors get lightAppColors;
  BaseAppColors get darkAppColors;
  TextTheme get textTheme;
  ThemeData brightnessTheme(Brightness brightness);
}
