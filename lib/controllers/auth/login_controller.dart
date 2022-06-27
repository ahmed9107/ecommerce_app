import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/constants/routes.dart';

class LoginController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  login() {
    var formkey = formstate.currentState;
    if (formkey!.validate()) {
      print('Valid');
    } else {
      print('Not Valid');
    }
  }

  goToSignUp() {
    Get.toNamed(AppRoute.signup);
  }

  goToForgetPass() {
    Get.toNamed(AppRoute.forgetPassword);
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
