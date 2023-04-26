import 'package:flutter/material.dart';

import '../inavigation_service.dart';

class CustomNavigationService implements INavigationService {
  CustomNavigationService._init();
  static final CustomNavigationService _instance = CustomNavigationService._init();
  static CustomNavigationService get instance => _instance;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  get removeAllOldRoutes => (Route<dynamic> route) => false;

  @override
  Future<void> navigateToPage({String? path, Object? data}) async {
    await navigatorKey.currentState!.pushNamed(path!, arguments: data);
  }

  @override
  Future<void> navigateToPageClear({String? path, Object? data}) async {
    await navigatorKey.currentState!
        .pushNamedAndRemoveUntil(path!, removeAllOldRoutes, arguments: data);
  }

  @override
  Future<void> navigateToPageClearStack({String? path, Object? data}) async {
    await navigatorKey.currentState!.pushReplacementNamed(path!, arguments: data);
  }
}
