import 'package:store_app/controller/onboarding_controller.dart';
import 'package:store_app/utils/constants/colors.dart';
import 'package:store_app/utils/constants/static.dart';
import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingCustomSlider extends GetWidget<OnBoardingController> {
  const OnboardingCustomSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val) {
        controller.onPageChanged(val);
      },
      itemCount: onboardingList.length,
      itemBuilder: (context, i) => Column(
        children: [
          SizedBox(height: Dimensions.height45),
          Text(onboardingList[i].title!,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          SizedBox(height: Dimensions.height50),
          Image.asset(
            onboardingList[i].image!,
            width: 250,
            height: 250,
            fit: BoxFit.fill,
          ),
          SizedBox(height: Dimensions.height60),
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
