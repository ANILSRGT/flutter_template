import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/constants/app/application_constants.dart';
import 'core/constants/navigation/navigation_path_constants.dart';
import 'core/init/authentication/authentication_manager.dart';
import 'core/init/cache/cache_manager.dart';
import 'core/init/database/database_manager.dart';
import 'core/init/dotenv/dotenv_manager.dart';
import 'core/init/localization/localization_manager.dart';
import 'core/init/navigation/navigation_manager.dart';
import 'core/init/navigation/navigations/custom_navigation_service.dart';
import 'core/init/network/network_manager.dart';
import 'core/init/storage/storage_manager.dart';
import 'core/providers/provider_list.dart';
import 'core/providers/theme_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _init();
  runApp(
    MultiProvider(
      providers: ProviderList.providers,
      child: EasyLocalization(
        supportedLocales: LocalizationManager.instance.supportedLocales,
        path: ApplicationConstants.langAssetPath,
        fallbackLocale: LocalizationManager.instance.startLocale,
        child: const MyApp(),
      ),
    ),
  );
}

Future<void> _init() async {
  await DotEnvManager.initEnv();
  await CacheManager.instance.init();
  await LocalizationManager.instance.init();
  await NetworkManager.instance.init();
  await StorageManager.instance.init();
  await DatabaseManager.instance.init();
  await AuthenticationManager.instance.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: ApplicationConstants.appName,
      theme: context.watch<ThemeNotifier>().currentTheme.brightnessTheme(Brightness.light),
      darkTheme: context.watch<ThemeNotifier>().currentTheme.brightnessTheme(Brightness.dark),
      themeMode: context.watch<ThemeNotifier>().currentThemeMode,
      navigatorKey: CustomNavigationService.instance.navigatorKey,
      initialRoute: NavigationPathConstants.initial,
      onGenerateRoute: NavigationManager.instance.generateRoute,
    );
  }
}
