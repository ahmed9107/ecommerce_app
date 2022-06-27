import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/constants/routes.dart';

class VerifyEmailController extends GetxController {
  late TextEditingController email;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  checkEmail() {
    var formkey = formstate.currentState;
    if (formkey!.validate()) {
      goToVerifyCodeSignUp();
    } else {
      print('Not Valid');
    }
  }

  goToVerifyCodeSignUp() {
    Get.offNamed(AppRoute.verifyCodeSignUp);
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
