import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/forget_password/forget_pass_controller.dart';
import 'package:store_app/utils/class/handling_data_view.dart';
import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/auth_widgets/custom_button.dart';
import 'package:store_app/view/widgets/big_text.dart';
import 'package:store_app/view/widgets/custom_input_field.dart';
import 'package:store_app/view/widgets/small_text.dart';
import '../../../../utils/constants/colors.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appBackgroundColor,
        title: Text(
          'forgetPass'.tr,
          //style: Theme.of(context).textTheme.headline1,
        ),
        elevation: 0.0,
      ),
      body: GetBuilder<ForgetPassController>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: Dimensions.height15, horizontal: Dimensions.height15),
              child: Column(
                children: [
                  SizedBox(height: Dimensions.height20),
                  BigText(text: 'checkMail'.tr),
                  SizedBox(height: Dimensions.height10),
                  SmallText(text: 'enterEmailtwo'.tr),
                  SizedBox(height: Dimensions.height20*3.2),
                  CustomInputField(
                    type: TextInputType.emailAddress,
                    controller: controller.email,
                    bgColor: controller.emailError
                      ? Colors.red.withOpacity(0.3)
                      : Theme.of(context).cardColor,
                    hint: 'enterEmail'.tr,
                    suffixIcon: Icons.email_outlined,
                  ),
                  CustomButtonAuth(
                    onPressed: () {
                      controller.checkEmail();
                    },
                    text: 'checkMail'.tr),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
