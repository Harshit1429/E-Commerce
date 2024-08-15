import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static toastMassage(String message) {
    Fluttertoast.showToast(
        msg: message, textColor: Colors.white, backgroundColor: Colors.black);
  }

  static flashBar(String message, BuildContext context) {
    Flushbar(
      backgroundColor: Colors.red,
      message: message,
      icon: const Icon(Icons.info),
      margin: const EdgeInsets.all(11),
      borderRadius: BorderRadius.circular(10),
      duration: const Duration(seconds: 2),
      flushbarPosition: FlushbarPosition.TOP,
    ).show(context);
  }

  static snackBar(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    ));
  }
}
