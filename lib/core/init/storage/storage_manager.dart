import 'istorage.dart';

class StorageManager {
  static final StorageManager _instance = StorageManager._init();
  static StorageManager get instance => _instance;

  StorageManager._init();

  IStorage? storage;

  Future<void> init() async => storage?.init();
}
