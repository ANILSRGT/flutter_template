import 'package:flutter/material.dart';

import '../extension/all_extensions.dart';
import '../init/cache/cache_manager.dart';
import '../init/cache/caches/object_to_enums/itheme_enums.dart';
import '../init/cache/icache.dart';
import '../init/theme/itheme.dart';
import '../init/theme/themes/main_theme.dart/main_theme.dart';

class ThemeNotifier with ChangeNotifier {
  ITheme _currentTheme = MainTheme();
  ThemeMode _currentThemeMode = ThemeMode.system;

  ITheme get currentTheme => _currentTheme;
  ThemeMode get currentThemeMode => _currentThemeMode;

  Future<void> init() async {
    final theme = CacheManager.instance.cache
        .getString(CacheKey.theme)
        ?.toEnum<IThemeEnum>(IThemeEnum.values)
        .themeClass;
    final themeMode = CacheManager.instance.cache
        .getString(CacheKey.themeMode)
        ?.toEnum<ThemeMode>(ThemeMode.values);
    _currentTheme = theme ?? MainTheme();
    _currentThemeMode = themeMode ?? ThemeMode.system;
    notifyListeners();
  }

  Future<void> changeThemeMode(ThemeMode themeMode) async {
    _currentThemeMode = themeMode;
    await CacheManager.instance.cache.setString(CacheKey.themeMode, _currentThemeMode.toStr);
    notifyListeners();
  }

  Future<void> changeTheme(ITheme theme) async {
    _currentTheme = theme;
    await CacheManager.instance.cache.setString(CacheKey.theme, _currentTheme.toEnumStr);
    notifyListeners();
  }
}
