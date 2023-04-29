enum CacheKey {
  token,
  theme,
  themeMode,
  localeType,

  ///True: Sound is on<br>
  ///False: Sound is off
  isSoundOn,

  ///Range: 0 - 100
  soundVolume,
}

abstract class ICache {
  Future<void> init();
  Future<bool> setString(CacheKey key, String? value);
  String? getString(CacheKey key);
  Future<bool> setBool(CacheKey key, bool? value);
  bool? getBool(CacheKey key, {bool? defaultValue});
  Future<bool> setInt(CacheKey key, int? value);
  int? getInt(CacheKey key, {int? defaultValue});
  Future<bool> remove(CacheKey key);
  Future<bool> removes(List<CacheKey> keys);
  Future<bool> clear();
  Future<bool> cryptSetString(CacheKey key, String? value);
  Future<String?> cryptGetString(CacheKey key);
}

extension CacheKeyExtension on CacheKey {
  String get value {
    switch (this) {
      case CacheKey.token:
        return 'token';
      case CacheKey.theme:
        return 'theme';
      case CacheKey.themeMode:
        return 'themeMode';
      case CacheKey.localeType:
        return 'localeType';
      case CacheKey.isSoundOn:
        return 'isSoundOn';
      case CacheKey.soundVolume:
        return 'soundVolume';
      default:
        throw Exception('No such cache key');
    }
  }
}
