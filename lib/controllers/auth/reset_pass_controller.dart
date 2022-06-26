import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/constants/routes.dart';

class ResetPasswordController extends GetxController {
  late TextEditingController newPass;
  late TextEditingController rePassword;

  @override
  void onInit() {
    newPass = TextEditingController();
    rePassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    newPass.dispose();
    rePassword.dispose();
    super.dispose();
  }

  checkEmail() {}

  goToSuccessResetPass() {
    Get.offNamed(AppRoute.successResetPassword);
  }
}
