import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/colors.dart';
import '../../../controllers/auth/verify_email_controller.dart';
import '../../widgets/auth/auth_body_text.dart';
import '../../widgets/auth/auth_title.dart';
import '../../widgets/auth/custom_button_auth.dart';
import '../../widgets/auth/custom_text_field.dart';
import '../../widgets/auth/signup_text.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VerifyEmailController controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appBackgroundColor,
        title: Text(
          'Verify Email',
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
              title: 'Success',
            ),
            const SizedBox(
              height: 10.0,
            ),
            const AuthBodyText(text: 'Please enter your email adresse'),
            const SizedBox(
              height: 65.0,
            ),
            AuthCustomTextFormField(
              controller: controller.email,
              hint: 'Enter your email',
              label: 'Email',
              suffixIcon: Icons.email_outlined,
            ),
            const CustomButtonAuth(text: 'Sign Up'),
            const SizedBox(
              height: 10.0,
            ),
            CustomTextSignUpOrSignIn(
              onTap: () {
                controller.goToSuccessSignUp();
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
