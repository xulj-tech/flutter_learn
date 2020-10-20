import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GHToast{

  static Future<void> showTost(String toast) {
    Fluttertoast.showToast(
        msg: toast,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        textColor: Colors.white,
    );
  }
}
