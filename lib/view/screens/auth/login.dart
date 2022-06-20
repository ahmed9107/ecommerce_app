import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../widgets/auth/auth_body_text.dart';
import '../../widgets/auth/auth_title.dart';
import '../../widgets/auth/custom_button_auth.dart';
import '../../widgets/auth/custom_text_field.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
            const AuthTitle(
              title: 'Welcome Back!',
            ),
            const SizedBox(
              height: 10.0,
            ),
            const AuthBodyText(
                text:
                    'Sign in with your Email and password or continue with social media'),
            const SizedBox(
              height: 65.0,
            ),
            AuthCustomTextFormField(
              controller: emailController,
              hint: 'Enter your email',
              label: 'Email',
              suffixIcon: Icons.email_outlined,
            ),
            AuthCustomTextFormField(
              controller: emailController,
              hint: 'Enter your password',
              label: 'Password',
              suffixIcon: Icons.lock_outlined,
            ),
            const Text(
              'Forgot password',
              textAlign: TextAlign.end,
            ),
            const CustomButtonAuth(text: 'Sign In'),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account? '),
                InkWell(
                  onTap: () {},
                  child: const Text('Sign Up',
                      style: TextStyle(color: AppColor.primaryColor)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
