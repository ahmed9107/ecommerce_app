import 'package:store_app/controller/layout_controller.dart';
import 'package:store_app/controller/products_controller.dart';
import 'package:store_app/routes/app_routes.dart';
import 'package:store_app/utils/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/utils/localisation/translation.dart';
import 'utils/helpers/dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InitialBindings().dependencies();
  //await dependency.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //Get.find<CartController>().getCartData();
    return GetBuilder<LayoutController>(builder: (controller) {
      return GetBuilder<ProductsController>(
        builder: (_) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            translations: Translation(),
            locale: const Locale('en'),
            fallbackLocale: const Locale('en'),
            theme: Themes.light,
            darkTheme: Themes.dark,
            themeMode: !controller.isDarkMode ? ThemeMode.light : ThemeMode.dark,
            initialBinding: InitialBindings(),
            initialRoute: AppRoute.getSplashPage(),
            getPages: AppRoute.routes,
          );
        }
      );
    });
  }
}
