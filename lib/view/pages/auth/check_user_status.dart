import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:store_app/controller/auth_controllers/login_controller.dart';
import 'package:store_app/utils/class/handling_data_view.dart';
import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/big_text.dart';
import 'package:store_app/view/widgets/small_text.dart';
import '../../../../utils/constants/colors.dart';

class CheckUserStatus extends StatelessWidget {
  final String email;
  const CheckUserStatus({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appBackgroundColor,
        title: const BigText(
          text: 'Verification Code',
        ),
        elevation: 0.0,
      ),
      body:GetBuilder<LoginController>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Lottie.asset('assets/images/emailSent.json', width: Dimensions.width160),
                    SizedBox(height: Dimensions.height35),
                  const BigText(
                    text: 'Check code',
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SmallText(
                      text: 'Enter the verification code send to $email'),
                  const SizedBox(
                    height: 65.0,
                  ),
                  OtpTextField(
                    fieldWidth: 50.0,
                    borderRadius: BorderRadius.circular(10),
                    numberOfFields: 5,
                    borderColor: Theme.of(context).scaffoldBackgroundColor,
                    showFieldAsBox: true,
                    onCodeChanged: (String code) {},
                    onSubmit: (String verifyCode) {
                      print(verifyCode);
                      //controller.verifyCode(email, verifyCode);
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
