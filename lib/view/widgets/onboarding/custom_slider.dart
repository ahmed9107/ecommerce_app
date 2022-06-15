import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/onboarding_controller.dart';
import '../../../data/datasource/static/static.dart';

class OnboardingCustomSlider extends GetView<OnBoardingControllerImp> {
  const OnboardingCustomSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val){
        controller.onPageChanged(val) ; 
      },
      itemCount: onboardingList.length,
      itemBuilder: (context, i) => Column(
        children: [
          Text(
              onboardingList[i].title!,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
          ),
          const SizedBox(height: 80),
          Image.asset(
            onboardingList[i].image!,
            width: 200,
            height: 230,
            fit: BoxFit.fill,
          ),
          const SizedBox(height: 80),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              onboardingList[i].body!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                height: 2,
                color: AppColor.grey,
                fontWeight: FontWeight.bold,
                fontSize: 17
              ),
            )
          ),
        ],
      )
    );
  }
}