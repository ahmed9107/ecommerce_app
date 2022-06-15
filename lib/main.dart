import 'package:ecommerce_app/utils/helpers/services/services.dart';
import 'package:ecommerce_app/utils/localisation/change_local.dart';
import 'package:ecommerce_app/utils/localisation/translation.dart';
import 'package:ecommerce_app/view/screens/onboarding.dart';
import 'package:ecommerce_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocaleController _localeController = Get.put(LocaleController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Translation(),
      locale: _localeController.appLang,
      fallbackLocale: const Locale('en'),
      home: const Onboarding(),
      routes: routes,
    );
  }
}
