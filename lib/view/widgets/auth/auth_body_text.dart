import 'package:flutter/material.dart';

class AuthBodyText extends StatelessWidget {
  final String text;
  const AuthBodyText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}
