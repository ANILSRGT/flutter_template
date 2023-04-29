import 'package:flutter/material.dart';
import 'package:iconify_flutter/icons/mdi.dart';

import '../../constants/navigation/navigation_path_constants.dart';
import '../../extension/all_extensions.dart';
import 'inavigation_service.dart';
import 'navigations/custom_navigation_service.dart';

class NavigationManager {
  NavigationManager._init();
  static final NavigationManager _instance = NavigationManager._init();
  static NavigationManager get instance => _instance;

  INavigationService navigationService = CustomNavigationService.instance;

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationPathConstants.initial:
        return _widgetRoute(
          const Scaffold(),
          NavigationPathConstants.initial,
          arguments: args.arguments,
        );

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: const Text("Not Found"),
              actions: [
                IconButton(
                  icon: Mdi.home.iconifyToIcon(context),
                  onPressed: () {},
                ),
              ],
            ),
            body: const Center(
              child: Text("404 Not Found!"),
            ),
          ),
        );
    }
  }

  MaterialPageRoute _widgetRoute(Widget widget, String pageName, {Object? arguments}) {
    return MaterialPageRoute(
      builder: (context) => widget,
      //analytciste görülecek olan sayfa ismi için pageName veriyoruz
      settings: RouteSettings(name: pageName, arguments: arguments),
    );
  }

  Future<void> navigateToPageWithWidget(BuildContext context, Widget widget, String path) async {
    await Navigator.of(context).push(_widgetRoute(widget, path));
  }

  Future<void> navigateToPageClearStackWithWidget(
      BuildContext context, Widget widget, String path) async {
    await Navigator.of(context).pushReplacement(_widgetRoute(widget, path));
  }

  Future<void> navigateToPageClearWithWidget(
      BuildContext context, Widget widget, String path) async {
    await Navigator.of(context).pushAndRemoveUntil(_widgetRoute(widget, path), (route) => false);
  }
}
