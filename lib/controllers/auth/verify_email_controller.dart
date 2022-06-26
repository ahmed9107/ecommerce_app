import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/constants/routes.dart';

class VerifyEmailController extends GetxController {
  late TextEditingController email;

  checkEmail() {}

  goToSuccessSignUp() {
    Get.offNamed(AppRoute.verifyCode);
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
