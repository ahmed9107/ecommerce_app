import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:store_app/controller/forget_password/forgetpass_verify_code_controller.dart';
import 'package:store_app/utils/class/handling_data_view.dart';
import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/big_text.dart';
import 'package:store_app/view/widgets/small_text.dart';

class VerifyCode extends GetWidget<VerifyCodeController> {
  final String email;
  const VerifyCode({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //VerifyCodeController controller = Get.put(VerifyCodeController());
    return Scaffold(
      /* appBar: AppBar(
        backgroundColor: AppColor.appBackgroundColor,
        title: const BigText(
          text: 'Verification Code',
        ),
        elevation: 0.0,
      ), */
      body: GetBuilder<VerifyCodeController>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: Dimensions.height15, horizontal: Dimensions.height15),
              child: Column(
                children: [
                  SizedBox(height: Dimensions.height45),
                  Lottie.asset('assets/images/emailSent.json', width: Dimensions.width30*5),
                  SizedBox(height: Dimensions.height35),
                  BigText(text: 'verifyCode'.tr),
                  SizedBox(height: Dimensions.height10),
                  SmallText(text: '${'verifyCodeMsg'.tr} $email'),
                  SizedBox(height: Dimensions.height15*3),
                  OtpTextField(
                    fieldWidth: 50.0,
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
