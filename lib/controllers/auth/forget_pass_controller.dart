import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/constants/routes.dart';

class ForgetPassController extends GetxController {
  late TextEditingController email;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  checkEmail() {
    var formkey = formstate.currentState;
    if (formkey!.validate()) {
      //print('Valid');
      goToVerifyPage();
    } else {
      print('Not Valid');
    }
  }

  goToVerifyPage() {
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
