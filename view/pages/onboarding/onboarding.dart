import 'package:store_app/view/widgets/onboarding/onboarding_dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:store_app/view/widgets/onboarding/custom_button.dart';
import 'package:store_app/view/widgets/onboarding/custom_slider.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          const Expanded(
            flex: 3,
            child: OnboardingCustomSlider(),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: const [
                OnboardingDotsIndicator(),
                Spacer(flex: 2),
                CustomButton()
              ],
            )
          )
        ]),
      )
    );
  }
}