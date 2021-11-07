import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> showGeneralSnakbar(
    {Icon? icon,
    String message = 'OK',
    Color backgroundColor = Colors.black,
    Duration duration = const Duration(milliseconds: 1000)}) async {
  return await Get.showSnackbar(GetBar(
    isDismissible: true,
    duration: duration,
    backgroundColor: backgroundColor.withOpacity(0.8),
    barBlur: 8.0,
    borderRadius: 5.0,
    margin: EdgeInsets.all(16.0),
    padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
    message: message,
    icon: icon,
  ));
}
