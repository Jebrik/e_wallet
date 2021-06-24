import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:fluttertoast/fluttertoast.dart';

/// Widget Loading Aplikasi
Widget wAppLoading() {
  return Center(
    child: Platform.isAndroid
        ? CupertinoActivityIndicator()
        : CircularProgressIndicator(),
  );
}

/// Navigator Push
Future wPushTo(BuildContext context, Widget widget) {
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}

/// Navigator Push Replace
Future wPusReplaceTo(BuildContext context, Widget widget) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}

Widget wInputSubmit({required String title, VoidCallback? onPressed}) {
  return Container(
    width: double.infinity,
    child: ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
      child: Text(title),
      onPressed: onPressed,
    ),
  );
}

Future wShowToast(String msg) {
  return Fluttertoast.showToast(
    msg: msg,
    backgroundColor: Colors.black54,
    textColor: Colors.white,
    toastLength: Toast.LENGTH_LONG,
  );
}
