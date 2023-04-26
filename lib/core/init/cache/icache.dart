enum CacheKey {
  token,
  theme,
  themeMode,
  localeType,
}

abstract class ICache {
  Future<void> init();
  Future<bool> setString(CacheKey key, String? value);
  String? getString(CacheKey key);
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
      default:
        throw Exception('No such cache key');
    }
  }
}
