import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleController extends GetxController {
  Locale? appLang;
  final SharedPreferences sharedPref;

  LocaleController({required this.sharedPref});

  changeLang(String lang) {
    Locale locale = Locale(lang);
    sharedPref.setString('language', lang);
    Get.updateLocale(locale);
  }

  @override
  void onInit() async {
    String? sharedLang = sharedPref.getString('language');
    if(sharedLang == 'ar'){
      appLang = const Locale('ar');
    } else if(sharedLang == 'en'){
      appLang = const Locale('en');
    } else if(sharedLang == 'fr'){
      appLang = const Locale('fr');
    } else {
      appLang = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}