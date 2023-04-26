import 'package:flutter_dotenv/flutter_dotenv.dart';

enum EnvKeys {
  none,
}

class DotEnvManager {
  static final DotEnvManager _instance = DotEnvManager._init();
  static DotEnvManager get instance => _instance;

  DotEnvManager._init();

  static Future<void> initEnv() async {
    await dotenv.load(fileName: '.env');
  }

  String getEnv(EnvKeys key) {
    switch (key) {
      default:
        throw Exception('No such dotenv key');
    }
  }
}
