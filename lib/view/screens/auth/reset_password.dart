import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/auth/reset_pass_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../widgets/auth/auth_body_text.dart';
import '../../widgets/auth/auth_title.dart';
import '../../widgets/auth/custom_button_auth.dart';
import '../../widgets/auth/custom_text_field.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResetPasswordController controller = Get.put(ResetPasswordController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appBackgroundColor,
        title: Text(
          'Reset Password',
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
              title: 'New Password',
            ),
            const SizedBox(
              height: 10.0,
            ),
            const AuthBodyText(text: 'Entre new password'),
            const SizedBox(
              height: 65.0,
            ),
            AuthCustomTextFormField(
              controller: controller.newPass,
              hint: 'Enter your paswword',
              label: 'New Password',
              suffixIcon: Icons.email_outlined,
            ),
            AuthCustomTextFormField(
              controller: controller.rePassword,
              hint: 'Re-Enter your paswword',
              label: 'Retype Password',
              suffixIcon: Icons.email_outlined,
            ),
            const CustomButtonAuth(text: 'Sign Up'),
          ],
        ),
      ),
    );
  }
}
