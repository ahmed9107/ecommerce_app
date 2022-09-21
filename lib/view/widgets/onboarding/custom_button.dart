import 'package:store_app/controller/onboarding_controller.dart';
import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends GetView<OnBoardingController> {
  const CustomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: Dimensions.height20),
          height: Dimensions.height45,
          child: MaterialButton(
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 0),
            textColor: Colors.white,
            onPressed: () {
              controller.next();
            },
            color: Theme.of(context).primaryColor,
            child: Text("Continue",
              style: GoogleFonts.roboto(
              color: Theme.of(context).scaffoldBackgroundColor,
              fontWeight: FontWeight.bold,
              fontSize: Dimensions.font18
          ))),
        ),
        GestureDetector(
          onTap: () {
            controller.skip();
          },
          child: Text('Skip',
          style: GoogleFonts.roboto(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: Dimensions.font18
          )),
        ),
        SizedBox(height: Dimensions.height30)
      ],
    );
  }
}