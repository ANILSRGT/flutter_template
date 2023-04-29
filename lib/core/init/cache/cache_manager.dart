import 'caches/hive/hive_cache.dart';
import 'icache.dart';

class CacheManager implements ICache {
  static final CacheManager _instance = CacheManager._init();
  static CacheManager get instance => _instance;

  CacheManager._init() {
    _cache = HiveCache();
  }

  ICache? _cache;

  @override
  Future<void> init() async {
    await _cache?.init();
  }

  @override
  Future<bool> clear() async {
    return await _cache?.clear() ?? false;
  }

  @override
  String? getString(CacheKey key) {
    return _cache?.getString(key);
  }

  @override
  Future<bool> setString(CacheKey key, String? value) async {
    return await _cache?.setString(key, value) ?? false;
  }

  @override
  Future<String?> cryptGetString(CacheKey key) async {
    return await _cache?.cryptGetString(key);
  }

  @override
  Future<bool> cryptSetString(CacheKey key, String? value) async {
    return await _cache?.cryptSetString(key, value) ?? false;
  }

  @override
  Future<bool> remove(CacheKey key) async {
    return await _cache?.remove(key) ?? false;
  }

  @override
  Future<bool> removes(List<CacheKey> keys) async {
    return await _cache?.removes(keys) ?? false;
  }

  @override
  bool? getBool(CacheKey key, {bool? defaultValue}) {
    return _cache?.getBool(key, defaultValue: defaultValue);
  }

  @override
  Future<bool> setBool(CacheKey key, bool? value) async {
    return await _cache?.setBool(key, value) ?? false;
  }

  @override
  int? getInt(CacheKey key, {int? defaultValue}) {
    return _cache?.getInt(key, defaultValue: defaultValue);
  }

  @override
  Future<bool> setInt(CacheKey key, int? value) async {
    return await _cache?.setInt(key, value) ?? false;
  }
}
