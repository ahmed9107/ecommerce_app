import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appBackgroundColor,
        title: Text(
          'Sign in',
          style: Theme.of(context).textTheme.headline1,
        ),
        elevation: 0.0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            Text(
              'Welcome Back',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                'Sign in with your Email and password or continue with social media',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 30.0),
                  suffixIcon: const Icon(Icons.email_outlined),
                  label: const Text('Email'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 30.0),
                  suffixIcon: const Icon(Icons.email_outlined),
                  label: const Text('Password'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
            )
          ],
        ),
      ),
    );
  }
}
