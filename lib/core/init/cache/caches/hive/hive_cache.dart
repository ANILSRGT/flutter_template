import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../icache.dart';

class HiveCache implements ICache {
  static const String _cacheBox = 'cache';
  static const String _encryptedCacheBox = 'encryptedCache';
  static const String _encryptedCacheKey = 'encryptedCacheKey';

  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  Box? _box;
  Box? _encryptedBox;

  @override
  Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox(_cacheBox);

    var containsEncryptionKey = await secureStorage.containsKey(key: _encryptedCacheKey);
    if (!containsEncryptionKey) {
      var key = Hive.generateSecureKey();
      await secureStorage.write(
        key: _encryptedCacheKey,
        value: base64UrlEncode(key),
      );
    }
    var encryptedKey = await secureStorage.read(key: _encryptedCacheKey);
    if (encryptedKey != null) {
      final secureKey = base64Url.decode(encryptedKey);
      _encryptedBox =
          await Hive.openBox(_encryptedCacheBox, encryptionCipher: HiveAesCipher(secureKey));
    }
  }

  @override
  Future<bool> clear() async {
    await _box!.clear();
    if (_box!.isEmpty) return true;
    return false;
  }

  @override
  String? getString(CacheKey key) {
    final res = _box!.get(key.value, defaultValue: null);
    if (res == null) return null;
    return res;
  }

  @override
  Future<bool> setString(CacheKey key, String? value) async {
    await _box!.put(key.value, value);
    final res = getString(key);
    if (res != null && res == value) return true;
    return false;
  }

  @override
  Future<String?> cryptGetString(CacheKey key) async {
    if (_encryptedBox == null) return null;
    final res = _encryptedBox!.get(key.value, defaultValue: null);
    return res;
  }

  @override
  Future<bool> cryptSetString(CacheKey key, String? value) async {
    try {
      if (_encryptedBox == null) return false;
      await _encryptedBox!.put(key.value, value);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> remove(CacheKey key) async {
    try {
      _box!.delete(key.value);
      _encryptedBox?.delete(key.value);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> removes(List<CacheKey> keys) async {
    try {
      await _box!.deleteAll(keys);
      await _encryptedBox?.deleteAll(keys);
      return true;
    } catch (e) {
      return false;
    }
  }
}
