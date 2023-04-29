import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart' as admob;

import '../dotenv/dotenv_manager.dart';
import 'iad_service.dart';

class AdmobService implements IAdService {
  static final AdmobService _instance = AdmobService._init();
  static AdmobService get instance => _instance;

  AdmobService._init();

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return DotEnvManager.instance.getEnv(EnvKeys.admobAndroidBannerAdUnitId);
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  @override
  Future<void> init() async {
    admob.MobileAds.instance.initialize();
  }

  @override
  Future<void> dispose() async {}
}
