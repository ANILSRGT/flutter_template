import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../cache/cache_manager.dart';
import '../cache/icache.dart';

class LocalizationManager {
  LocalizationManager._init();
  static LocalizationManager? _instance;
  static LocalizationManager get instance {
    _instance ??= LocalizationManager._init();
    return _instance!;
  }

  init() async {
    await EasyLocalization.ensureInitialized();
    _startLocale = CacheManager.instance.getString(CacheKey.localeType)?.strToLocale;
  }

  final _enUSLocale = const Locale('en', 'US');
  final _trTRLocale = const Locale('tr', 'TR');

  List<Locale> get supportedLocales => [_enUSLocale, _trTRLocale];

  Locale? _startLocale;
  Locale get startLocale => _startLocale ?? _enUSLocale;

  void setLocale(BuildContext ctx, Locale locale) async {
    await ctx.setLocale(locale);
    await CacheManager.instance.setString(CacheKey.localeType, locale.localeName);
  }
}

extension LocaleExtension on Locale {
  String get localeName => '$languageCode-${countryCode!}';
}

extension _StringExtension on String {
  String get languageCode => split('-').first;
  String get countryCode => split('-').last;
  Locale get strToLocale => Locale(languageCode, countryCode);
}
