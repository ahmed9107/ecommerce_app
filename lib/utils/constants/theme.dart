import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData(
      textTheme: const TextTheme(
    headline1: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 22.0, color: Colors.black),
    headline2: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 26.0, color: Colors.black),
    bodyText1: TextStyle(
        height: 2,
        fontWeight: FontWeight.bold,
        fontSize: 14.0,
        color: AppColor.grey),
    bodyText2: TextStyle(height: 2, fontSize: 14.0, color: AppColor.grey),
  ));
}
