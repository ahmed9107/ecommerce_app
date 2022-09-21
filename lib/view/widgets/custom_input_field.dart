import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomInputField extends StatelessWidget {
  final TextInputType type;
  final TextEditingController controller;
  final bool obscure;
  final bool readOnly;
  final bool enable;
  final bool autoFocus;
  final int maxLines;
  final Color bgColor;
  final double height;
  final String? Function(String?)? onSubmit;
  final String? Function(String?)? onChange;
  final Function()? ontap;
  final String? title;
  final String? hint;
  final IconData? suffixIcon;
  final Function()? onTapSuffixIcon;
  final String? Function(String?)? validate;

  const CustomInputField(
      {Key? key,
      required this.type,
      required this.controller,
      this.obscure = false,
      this.readOnly = false,
      this.enable = true,
      this.autoFocus = false,
      this.height = 50,
      this.maxLines = 1,
      this.onSubmit,
      this.onChange,
      this.ontap,
      this.title,
      this.hint,
      this.validate,
      this.suffixIcon,
      this.onTapSuffixIcon,
      this.bgColor = Colors.grey
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: Dimensions.height10,
        //bottom: Dimensions.width25,
        left: Dimensions.width10,
        right:Dimensions.width10
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title == null
            ? Container()
            : Text(title!,
                style: GoogleFonts.roboto(
                  color: Theme.of(context).primaryColorLight, fontSize: Dimensions.font16)),
          Container(
            margin: EdgeInsets.only(top: Dimensions.height5),
            padding: EdgeInsets.only(right: Dimensions.height15, left: Dimensions.height15),
            height: height == 50 ? Dimensions.height50*1.1 : height,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(Dimensions.radius10)
            ),
            alignment: Alignment.center,
            child: TextFormField(
              autofocus: autoFocus,
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  color: Theme.of(context).primaryColorLight,
                  fontWeight: FontWeight.w500,
                  fontSize: Dimensions.font16)),
              keyboardType: type,
              maxLines: maxLines,
              controller: controller,
              obscureText: obscure,
              readOnly: readOnly,
              enabled: enable,
              onFieldSubmitted: onSubmit,
              onChanged: onChange,
              onTap: ontap,
              decoration: InputDecoration(
                errorStyle: const TextStyle(height: 0),
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: hint,
                hintStyle: GoogleFonts.roboto(textStyle: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: Dimensions.font14,
                )),
                suffixIcon: InkWell(
                  onTap: onTapSuffixIcon,
                  child: Icon(suffixIcon, color: Colors.grey)),
              ),
              validator: validate,
            ),
          ),
        ],
      ),
    );
  }
}
