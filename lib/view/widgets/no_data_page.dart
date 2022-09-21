import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:store_app/utils/constants/image_asset.dart';

class NoDataPage extends StatelessWidget {
  final String text;
  /* final String imgPath; */
  const NoDataPage(
    {Key? key,
    required this.text,
    /* this.imgPath = 'assets/images/emptyState.png' */})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Lottie.asset(ImageAsset.noData , width: 250 , height: 250),
        /* Image.asset(
          imgPath,
          height: MediaQuery.of(context).size.height * 0.22,
          width: MediaQuery.of(context).size.width * 0.22,
        ), */
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        Text(text,
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
                fontSize: MediaQuery.of(context).size.height * 0.0175,
                color: Theme.of(context).primaryColorLight))
      ],
    );
  }
}
