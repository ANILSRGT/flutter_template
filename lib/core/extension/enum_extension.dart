part of 'all_extensions.dart';

extension EnumExtension on Enum {
  String get toStr => toString().split('.').last;
}

extension ThemeModeExtension on ThemeMode {
  String get langStr {
    switch (this) {
      case ThemeMode.system:
        return LocaleKeys.global_themeText_system.locale;
      case ThemeMode.light:
        return LocaleKeys.global_themeText_light.locale;
      case ThemeMode.dark:
        return LocaleKeys.global_themeText_dark.locale;
    }
  }
}

extension StringEnumExtension on String {
  T toEnum<T>(List<T> values) {
    return values.firstWhere(
        (type) => type.toString().toLowerCase().split(".").last == toLowerCase(),
        orElse: () => values.first);
  }
}
