import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../extension/all_extensions.dart';

class ShowToats {
  static void showShortBottom(BuildContext context, String msg, {bool cancel = false}) {
    if (cancel) Fluttertoast.cancel();

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

  static void showLongBottom(BuildContext context, String msg, {bool cancel = false}) {
    if (cancel) Fluttertoast.cancel();

    Fluttertoast.showToast(
      msg: msg,
      backgroundColor: context.colorScheme.onBackground,
      textColor: context.colorScheme.background,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      fontSize: 16.0,
    );
  }

  static void showShortTop(BuildContext context, String msg, {bool cancel = false}) {
    if (cancel) Fluttertoast.cancel();

    Fluttertoast.showToast(
      msg: msg,
      backgroundColor: context.colorScheme.onBackground,
      textColor: context.colorScheme.background,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      fontSize: 16.0,
    );
  }

  static void showLongTop(BuildContext context, String msg, {bool cancel = false}) {
    if (cancel) Fluttertoast.cancel();

    Fluttertoast.showToast(
      msg: msg,
      backgroundColor: context.colorScheme.onBackground,
      textColor: context.colorScheme.background,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      fontSize: 16.0,
    );
  }

  static void showShortCenter(BuildContext context, String msg, {bool cancel = false}) {
    if (cancel) Fluttertoast.cancel();

    Fluttertoast.showToast(
      msg: msg,
      backgroundColor: context.colorScheme.onBackground,
      textColor: context.colorScheme.background,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      fontSize: 16.0,
    );
  }

  static void showLongCenter(BuildContext context, String msg, {bool cancel = false}) {
    if (cancel) Fluttertoast.cancel();

    Fluttertoast.showToast(
      msg: msg,
      backgroundColor: context.colorScheme.onBackground,
      textColor: context.colorScheme.background,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      fontSize: 16.0,
    );
  }
}
