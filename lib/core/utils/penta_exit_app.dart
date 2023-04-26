import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';

import '../extension/all_extensions.dart';
import '../init/localization/locale_keys.g.dart';

class PentaExitApp {
  static Future<void> exitApp(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text(LocaleKeys.global_utils_pentaExitApp_exitApp.locale),
          content: Text(LocaleKeys.global_utils_pentaExitApp_exitAppMessage.locale),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Text(LocaleKeys.global_utils_pentaExitApp_no.locale),
            ),
            TextButton(
              onPressed: () {
                if (Platform.isAndroid) {
                  FlutterExitApp.exitApp();
                } else if (Platform.isIOS) {
                  FlutterExitApp.exitApp(iosForceExit: true);
                }
              },
              child: Text(LocaleKeys.global_utils_pentaExitApp_yes.locale),
            ),
          ],
        );
      },
    );
  }
}
