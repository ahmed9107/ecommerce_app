import 'package:store_app/view/pages/account/account_page.dart';
import 'package:store_app/view/pages/cart_history/cart_history.dart';
import 'package:store_app/view/pages/home/home.dart';
import 'package:store_app/view/pages/order/order_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LayoutController extends GetxController{
  final SharedPreferences sharedPref;
  LayoutController({required this.sharedPref});
  int selectedIndex = 0;
  List<Widget> pages = [
    const HomePage(),
    const OrderPage(),
    const CartHistory(),
    const AccountPage(),
  ];

  onTapNavBar(int index) {
    selectedIndex = index;
    update();
  }

  bool isDarkMode = false;

  void switchTheme(){
    isDarkMode= !isDarkMode;
    sharedPref.setBool('isDarkMode', isDarkMode);
    update();
  }

  @override
  void onInit() {
    isDarkMode = sharedPref.getBool('isDarkMode')??false;
    super.onInit();
  }
}