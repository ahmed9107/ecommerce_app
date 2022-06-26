import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../../../../controllers/auth/verify_code_controller.dart';
import '../../../../utils/constants/colors.dart';
import '../../../widgets/auth/auth_body_text.dart';
import '../../../widgets/auth/auth_title.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VerifyCodeController controller = Get.put(VerifyCodeController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appBackgroundColor,
        title: Text(
          'Verification Code',
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
              title: 'Check code',
            ),
            const SizedBox(
              height: 10.0,
            ),
            const AuthBodyText(
                text: 'Enter the verification code send to ahmed@gmail.com'),
            const SizedBox(
              height: 65.0,
            ),
            OtpTextField(
              fieldWidth: 50.0,
              borderRadius: BorderRadius.circular(10),
              numberOfFields: 5,
              borderColor: const Color(0xFF512DA8),
              showFieldAsBox: true,
              onCodeChanged: (String code) {},
              onSubmit: (String verificationCode) {
                controller.goToResetPassPage();
              }, // end onSubmit
            ),
            //const CustomButtonAuth(text: 'Sign Up')
          ],
        ),
      ),
    );
  }
}
