import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class CustomButtonAuth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomButtonAuth({Key? key, required this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        onPressed: onPressed,
        child: Text(text),
        color: AppColor.primaryColor,
        textColor: Colors.white);
  }
}
