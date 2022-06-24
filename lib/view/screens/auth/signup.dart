import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/auth/signup_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../widgets/auth/auth_body_text.dart';
import '../../widgets/auth/auth_title.dart';
import '../../widgets/auth/custom_button_auth.dart';
import '../../widgets/auth/custom_text_field.dart';
import '../../widgets/auth/signup_text.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpController controller = Get.put(SignUpController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appBackgroundColor,
        title: Text(
          'Sign Up',
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
              title: 'Welcome!',
            ),
            const SizedBox(
              height: 10.0,
            ),
            const AuthBodyText(
                text:
                    'Sign Up with your Email and password or continue with social media'),
            const SizedBox(
              height: 65.0,
            ),
            AuthCustomTextFormField(
              controller: controller.user,
              hint: 'Enter your name',
              label: 'Name',
              suffixIcon: Icons.person_outline,
            ),
            AuthCustomTextFormField(
              controller: controller.email,
              hint: 'Enter your email',
              label: 'Email',
              suffixIcon: Icons.email_outlined,
            ),
            AuthCustomTextFormField(
              controller: controller.phone,
              hint: 'Enter your phone',
              label: 'Phone',
              suffixIcon: Icons.phone_android_outlined,
            ),
            AuthCustomTextFormField(
              controller: controller.password,
              hint: 'Enter your password',
              label: 'Password',
              suffixIcon: Icons.lock_outlined,
            ),
            const CustomButtonAuth(text: 'Sign Up'),
            const SizedBox(
              height: 10.0,
            ),
            CustomTextSignUpOrSignIn(
              onTap: () {
                controller.goToLogin();
              },
              textone: 'Already have an account? ',
              texttwo: 'Login',
            ),
          ],
        ),
      ),
    );
  }
}
