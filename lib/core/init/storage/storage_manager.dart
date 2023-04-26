import 'dart:typed_data';

import 'istorage.dart';
import 'storage_response.dart';

class StorageManager implements IStorage {
  static final StorageManager _instance = StorageManager._init();
  static StorageManager get instance => _instance;

  StorageManager._init();

  IStorage? _storage;

  @override
  Future<void> init() async => _storage?.init();

  @override
  Future<StorageResponse<void>> delete(String path) async {
    return await _storage!.delete(path);
  }

  @override
  Future<StorageResponse<Uint8List>> downloadBytesData(String path) async {
    return await _storage!.downloadBytesData(path);
  }

  @override
  Future<StorageResponse<String>> uploadBytesData(String path, Uint8List data) async {
    return await _storage!.uploadBytesData(path, data);
  }
}
