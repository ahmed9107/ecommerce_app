import 'package:store_app/controller/onboarding_controller.dart';
import 'package:store_app/utils/constants/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingDotsIndicator extends StatelessWidget {
  const OnboardingDotsIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingController>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        ...List.generate(
          onboardingList.length,
          (index) => AnimatedContainer(
              margin: const EdgeInsets.only(right: 5),
              duration: const Duration(milliseconds: 900),
              width: controller.currentPage == index ? 20 : 6,
              height: 6,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10)),
            ))
        ],
      ));
  }
}
