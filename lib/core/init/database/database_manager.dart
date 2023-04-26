import 'idatabase_service.dart';

class DatabaseManager {
  static final DatabaseManager _instance = DatabaseManager._init();
  static DatabaseManager get instance => _instance;

  DatabaseManager._init();

  IDatabaseService? get service => null;

  Future<void> init() async {
    await service?.init();
  }
}
