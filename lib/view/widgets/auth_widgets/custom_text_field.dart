import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:flutter/material.dart';

class AuthCustomTextFormField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final IconData? suffixIcon;
  final Function()? showPass;
  final bool isObscure;
  const AuthCustomTextFormField(
      {Key? key,
      required this.label,
      required this.hint,
      this.suffixIcon,
      required this.controller,
      this.validator,
      this.isObscure = false,
      this.showPass
  })
  : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Dimensions.width25, left: Dimensions.width15, right:Dimensions.width15),
      child: TextFormField(
        validator: validator,
        controller: controller,
        obscureText: isObscure,
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(fontSize: 12.0),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
            suffixIcon: InkWell(
              onTap: 
                showPass,
              child: Icon(suffixIcon)),
            label: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(label)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
      ),
    );
  }
}
