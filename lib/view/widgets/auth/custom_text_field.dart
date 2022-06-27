import 'package:flutter/material.dart';

class AuthCustomTextFormField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData? suffixIcon;
  final TextEditingController controller;
  final String? Function(String?) validator;
  const AuthCustomTextFormField(
      {Key? key,
      required this.label,
      required this.hint,
      this.suffixIcon,
      required this.controller,
      required this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25.0),
      child: TextFormField(
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(fontSize: 12.0),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
            suffixIcon: Icon(suffixIcon),
            label: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(label)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
      ),
    );
  }
}
