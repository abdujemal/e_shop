import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

const Color primaryColor = Color(0xFFF67952);
const Color bgColor = Color(0xFFFBFBFD);
const Color bgLight = Color(0xfbfafcff);

const double defaultPadding = 16.0;
const double defaultBorderRadius = 12.0;

Function bigTitle = (context) {
  return Theme.of(context)
      .textTheme
      .headline4!
      .copyWith(fontWeight: FontWeight.w500, color: Colors.black);
};

const TextStyle smallTitle = TextStyle(fontSize: 18);

void toast(String message, ToastType toastType,
      {bool isLong = false}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: isLong ? Toast.LENGTH_SHORT : Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor:
            toastType == ToastType.error ? Colors.red : Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  enum ToastType { success, error }

enum RequestState{
  idle,
  loaded,
  loading,
  error
}
