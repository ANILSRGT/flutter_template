import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../extension/all_extensions.dart';

class ShowToats {
  static void _showShort(BuildContext context, String msg, ToastGravity gravity) {
    Fluttertoast.showToast(
      msg: msg,
      backgroundColor: context.colorScheme.onBackground,
      textColor: context.colorScheme.background,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      fontSize: 16.0,
    );
  }

  static void _showLong(BuildContext context, String msg, ToastGravity gravity) {
    Fluttertoast.showToast(
      msg: msg,
      backgroundColor: context.colorScheme.onBackground,
      textColor: context.colorScheme.background,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      fontSize: 16.0,
    );
  }
}

extension ToastExtension on BuildContext {
  void showShortToast(String msg, ToastGravity gravity) => ShowToats._showShort(this, msg, gravity);
  void showLongToast(String msg, ToastGravity gravity) => ShowToats._showLong(this, msg, gravity);
}
