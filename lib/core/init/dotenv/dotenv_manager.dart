import 'package:flutter_dotenv/flutter_dotenv.dart';

enum EnvKeys {
  none,
  admobAndroidAppId,
  admobAndroidBannerAdUnitId,
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
      case EnvKeys.admobAndroidAppId:
        return dotenv.env['ADMOB_ANDROID_APP_ID']!;
      case EnvKeys.admobAndroidBannerAdUnitId:
        return dotenv.env['ADMOB_ANDROID_BANNER_AD_UNIT_ID']!;
      default:
        throw Exception('No such dotenv key');
    }
  }
}
