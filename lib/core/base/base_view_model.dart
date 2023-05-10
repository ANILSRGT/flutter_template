import 'package:flutter/material.dart';

import '../init/audio/audio_manager.dart';
import '../init/authentication/authentication_manager.dart';
import '../init/cache/cache_manager.dart';
import '../init/database/database_manager.dart';
import '../init/dotenv/dotenv_manager.dart';
import '../init/localization/localization_manager.dart';
import '../init/navigation/navigation_manager.dart';
import '../init/network/network_manager.dart';
import '../init/storage/storage_manager.dart';

enum ViewState { idle, busy }

abstract class BaseViewModel {
  BuildContext? viewModelContext;

  DatabaseManager databaseManager = DatabaseManager.instance;
  AuthenticationManager authenticationManager = AuthenticationManager.instance;
  CacheManager cacheManager = CacheManager.instance;
  DotEnvManager dotEnvManager = DotEnvManager.instance;
  NetworkManager networkManager = NetworkManager.instance;
  NavigationManager navigationManager = NavigationManager.instance;
  StorageManager storageManager = StorageManager.instance;
  LocalizationManager localizationManager = LocalizationManager.instance;
  AudioManager audioManager = AudioManager.instance;

  void setContext(BuildContext context);

  void init();

  void onDispose();

  VoidCallback? setStateFunc;
}
