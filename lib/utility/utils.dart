import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
 static focusChange(BuildContext context, FocusNode current,FocusNode nextFocus){
  current.unfocus();
  Focus.of(context).requestFocus(nextFocus);
 }
  static toastMessage(String mesage) {
    Fluttertoast.showToast(
        msg: mesage,
        textColor: Colors.black,
        timeInSecForIosWeb: 5,
        webPosition: "center",
        backgroundColor: Colors.red);
  }
  static void ShowErrorMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          flushbarPosition: FlushbarPosition.TOP,
          padding: EdgeInsets.all(7),
          reverseAnimationCurve: Curves.ease,
          message: message,
          forwardAnimationCurve: Curves.easeIn,
          icon: Icon(Icons.error),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.redAccent,
        )..show(context));
  }
}
