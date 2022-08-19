import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:store_app/controller/auth_controllers/signup_verifycode_controller.dart';
import 'package:store_app/utils/class/handling_data_view.dart';
import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/big_text.dart';
import 'package:store_app/view/widgets/small_text.dart';

class SignupVerifyCode extends StatelessWidget {
  final String email;
  const SignupVerifyCode({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      /* appBar: AppBar(
        backgroundColor: AppColor.appBackgroundColor,
        title: const BigText(
          text: 'Verification Code',
        ),
        elevation: 0.0,
      ), */
      body:GetBuilder<SignUpVerifyCodeController>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: Dimensions.height15, horizontal: Dimensions.height15),
              child: ListView(
                children: [
                  SizedBox(height: Dimensions.height20),
                  Lottie.asset('assets/images/emailSent.json', width: Dimensions.width45*2),
                  SizedBox(height: Dimensions.height35),
                  BigText(text: 'verifyCode'.tr),
                  SizedBox(height: Dimensions.height10),
                  SmallText(text: '${'verifyCodeMsg'.tr} $email'),
                  SizedBox(height: Dimensions.height30*1.1),
                  OtpTextField(
                    fieldWidth: Dimensions.height50,
                    borderRadius: BorderRadius.circular(10),
                    numberOfFields: 5,
                    borderColor: Theme.of(context).scaffoldBackgroundColor,
                    showFieldAsBox: true,
                    onCodeChanged: (String code) {},
                    onSubmit: (String verifyCode) {
                      controller.verifyCode(email, verifyCode);
                    },
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
