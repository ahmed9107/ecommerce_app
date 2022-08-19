import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  final double size;
  final FontWeight? fontWeight;
  final TextOverflow overflow;
  const BigText(
      {Key? key,
      this.color,
      required this.text,
      this.size = 0,
      this.overflow = TextOverflow.ellipsis, this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: GoogleFonts.roboto(
          color: color ?? Theme.of(context).primaryColorLight,
          fontSize: size == 0 ? Dimensions.font20 : size,
          fontWeight: fontWeight ?? FontWeight.w400),
    );
  }
}
