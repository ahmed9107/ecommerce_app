import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helpers/services/services.dart';

class LocaleController extends GetxController {
  Locale? appLang;
  Services services = Get.find();

  changeLang(String lang) {
    Locale locale = Locale(lang);
    services.sharedPreferences.setString('language', lang);
    Get.updateLocale(locale);
  }

  @override
  void onInit() async {
    String? sharedLang = services.sharedPreferences.getString('language');
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