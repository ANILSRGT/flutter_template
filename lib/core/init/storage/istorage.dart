import 'dart:typed_data';

import 'storage_response.dart';

abstract class IStorage {
  Future<void> init();
  Future<StorageResponse<String>> uploadBytesData(String path, Uint8List data);
  Future<StorageResponse<Uint8List>> downloadBytesData(String path);
  Future<StorageResponse<void>> delete(String path);
}
