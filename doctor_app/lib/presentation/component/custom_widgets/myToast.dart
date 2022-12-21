import 'package:doctor_app/core/services/extension/dimen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants/constant.dart';


Future<void> alert(
    {required String msg, Color? bgColor, Color? txColor, double? fontSize}) {
  return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: bgColor ?? ColorManager.primaryColor,
      textColor: txColor ?? ColorManager.black,
      fontSize: fontSize ?? 16.sp);
}
