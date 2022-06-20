import 'package:ecommerce_app/utils/constants/routes.dart';
import 'package:ecommerce_app/view/screens/auth/login.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoute.login: (context) => Login()
};
