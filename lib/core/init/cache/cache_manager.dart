import 'caches/hive/hive_cache.dart';
import 'icache.dart';

class CacheManager {
  static final CacheManager _instance = CacheManager._init();
  static CacheManager get instance => _instance;

  CacheManager._init();

  ICache cache = HiveCache();

  Future<void> init() async {
    await cache.init();
  }
}
