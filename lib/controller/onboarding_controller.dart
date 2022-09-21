import 'package:store_app/routes/app_routes.dart';
import 'package:store_app/utils/constants/static.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingController extends GetxController {
  late PageController pageController;
  final SharedPreferences sharedPref;

  int currentPage = 0;

  OnBoardingController({required this.sharedPref});

  next() {
    currentPage++;
    if (currentPage > onboardingList.length - 1) {
      sharedPref.setString('onboarding', '1');
      Get.offAllNamed(AppRoute.getLogin());
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  skip() {
    sharedPref.setString('onboarding', '1');
    Get.offAllNamed(AppRoute.getLogin());
  }

  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
