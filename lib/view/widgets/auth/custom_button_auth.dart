import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class CustomButtonAuth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomButtonAuth({Key? key, required this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(child: Text(text, style: const TextStyle(color: Colors.white),)),
      ),
    );
  }
}
