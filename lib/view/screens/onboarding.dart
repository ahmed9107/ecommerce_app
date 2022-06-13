import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../services/datasource/static/static.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          PageView.builder(
            physics: const BouncingScrollPhysics(),
            //controller: pageController,
            itemBuilder: (context, i) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  onboardingList[i].title!,
                  style: GoogleFonts.roboto(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Image.asset(onboardingList[i].image!),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  onboardingList[i].body!,
                  style: GoogleFonts.roboto(
                      fontSize: 14.0,
                  ),
                )
              ],
            ),
            onPageChanged: (int i) {},
            itemCount: onboardingList.length,
          ),
        ]
      )
    );
  }
}