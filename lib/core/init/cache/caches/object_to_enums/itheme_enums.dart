import '../../../../extension/all_extensions.dart';
import '../../../theme/itheme.dart';
import '../../../theme/themes/main_theme/main_theme.dart';

enum IThemeEnum {
  mainTheme,
}

extension IThemeEnumExtension on IThemeEnum {
  ITheme get themeClass {
    switch (this) {
      case IThemeEnum.mainTheme:
        return MainTheme();
    }
  }
}

extension IThemeExtension on ITheme {
  String get toEnumStr {
    if (this is MainTheme) {
      return IThemeEnum.mainTheme.toStr;
    }
    throw Exception('IThemeEnum not found');
  }
}
