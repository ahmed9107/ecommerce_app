import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/constants/routes.dart';

class ResetPasswordController extends GetxController {
  late TextEditingController newPass;
  late TextEditingController rePassword;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  checkEmail() {
    var formkey = formstate.currentState;
    if (formkey!.validate()) {
      //print('Valid');
      goToSuccessResetPass();
    } else {
      print('Not Valid');
    }
  }

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

  goToSuccessResetPass() {
    Get.offNamed(AppRoute.successResetPassword);
  }
}
