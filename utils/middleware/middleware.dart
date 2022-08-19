import 'package:store_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppMiddleware extends GetMiddleware{
  final SharedPreferences sharedPref;

  AppMiddleware({required this.sharedPref});
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route){
    if(sharedPref.getString('onboarding') == '1'){
      //return RouteSettings(name: AppRoute.getInitial());
      return RouteSettings(name: AppRoute.getLogin());
    }
    return null;
  }
}