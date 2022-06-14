import 'package:flutter/material.dart';
import 'package:ecommerce_app/view/widgets/onboarding/custom_button.dart';
import 'package:ecommerce_app/view/widgets/onboarding/custom_slider.dart';
import 'package:ecommerce_app/view/widgets/onboarding/dots_indicator.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(children: [
            Expanded(
              flex: 3,
              child: OnboardingCustomSlider(),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: const [
                  DotsIndicatorController(),
                  Spacer(flex: 2),
                  CustomButton()
                ],
              )
            )
          ]
        ),
      )
    );
  }
}