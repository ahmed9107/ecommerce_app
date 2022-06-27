import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/constants/routes.dart';

class SignUpController extends GetxController {
  late TextEditingController user;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  login() {}

  goToLogin() {
    Get.offNamed(AppRoute.login);
  }

  signUp() {
    var formkey = formstate.currentState;
    if (formkey!.validate()) {
      //print('Valid');
      Get.offNamed(AppRoute.verifyEmail);
    } else {
      print('Not Valid');
    }
  }

  @override
  void onInit() {
    user = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    user.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}
