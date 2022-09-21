import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsDetailController extends GetxController{
  PageController pageController = PageController();
  double currentPageValue = 0.0;

  @override
  void onInit() {
    super.onInit();
    pageController.addListener(() {
      currentPageValue = pageController.page!;
      update();
    });
  }
}