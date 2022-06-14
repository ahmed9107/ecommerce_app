import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/onboarding_controller.dart';

class CustomButton extends GetView<OnBoardingControllerImp> {
  const CustomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      height: 40,
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 0),
        textColor: Colors.white,
        onPressed: () {
          controller.next();
        },
        color: AppColor.primaryColor,
        child: const Text("Continue")),
    );
  }
}