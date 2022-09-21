import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddressInfoField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscure;
  final bool readOnly;
  final bool enable;
  final bool autoFocus;
  final Color bgColor;
  final double height;
  final String? Function(String?)? onSubmit;
  final String? Function(String?)? onChange;
  final Function()? ontap;
  final String? title;
  final String? hint;
  final IconData? suffixIcon;
  final Function()? showPass;
  final String? Function(String?)? validate;

  const AddressInfoField(
      {Key? key,
      required this.controller,
      this.obscure = false,
      this.readOnly = false,
      this.enable = true,
      this.autoFocus = false,
      this.height = 50,
      this.onSubmit,
      this.onChange,
      this.ontap,
      this.title,
      this.hint,
      this.validate,
      this.suffixIcon,
      this.showPass,
      this.bgColor = Colors.grey
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: Dimensions.height10,
        left: Dimensions.width10,
        right:Dimensions.width10
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title == null
            ? Container()
            : Text(title!,
                style: GoogleFonts.roboto(color: Colors.black, fontSize: Dimensions.font16)),
          Container(
            margin: EdgeInsets.only(top: Dimensions.height5),
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.width20,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius5),
              color:Theme.of(context).backgroundColor,
            ),
            child: TextFormField(
              autofocus: autoFocus,
              cursorColor: Theme.of(context).primaryColor,
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  color: Theme.of(context).primaryColorLight,
                  fontWeight: FontWeight.w500,
                  fontSize: Dimensions.font16)),
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
                  color: Theme.of(context).primaryColorLight,
                  fontWeight: FontWeight.w400,
                  fontSize: Dimensions.font14,
                )),
                suffixIcon: InkWell(
                  onTap: showPass,
                  child: Icon(suffixIcon, color: Theme.of(context).primaryColorLight)),
              ),
              validator: validate,
            ),
          ),
        ],
      ),
    );
  }
}
