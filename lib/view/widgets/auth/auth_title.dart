import 'package:flutter/material.dart';

class AuthTitle extends StatelessWidget {
  final String title;
  const AuthTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.left,
      style: Theme.of(context).textTheme.headline2,
    );
  }
}
