import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/forget_password/reset_pass_controller.dart';
import 'package:store_app/utils/class/handling_data_view.dart';
import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/auth_widgets/custom_button.dart';
import 'package:store_app/view/widgets/big_text.dart';
import 'package:store_app/view/widgets/custom_input_field.dart';
import 'package:store_app/view/widgets/small_text.dart';

class ResetPassword extends StatelessWidget {
  final String email;
  const ResetPassword({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //ResetPasswordController controller = Get.put(ResetPasswordController());
    return Scaffold(
      /* appBar: AppBar(
        backgroundColor: AppColor.appBackgroundColor,
        title: Text(
          'Reset Password',
          style: Theme.of(context).textTheme.headline1,
        ),
        elevation: 0.0,
      ), */
      body: GetBuilder<ResetPasswordController>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: Dimensions.width15, horizontal: Dimensions.width15),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  const BigText(
                    text: 'New Password',
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const SmallText(text: 'Entre new password'),
                  const SizedBox(
                    height: 65.0,
                  ),
                  CustomInputField(
                    type: TextInputType.text,
                    controller: controller.newPass,
                    bgColor: controller.emptyField
                      ? Colors.red.withOpacity(0.3)
                      : Theme.of(context).cardColor,
                    hint: 'Enter your new paswword',
                    obscure: controller.isHidePassword,
                    suffixIcon: Icons.remove_red_eye,
                    onTapSuffixIcon: () {controller.showPassword();},
                  ),
                  CustomInputField(
                    type: TextInputType.text,
                    controller: controller.rePassword,
                    bgColor: controller.differPass || controller.emptyField
                      ? Colors.red.withOpacity(0.3)
                      : Theme.of(context).cardColor,
                    hint: 'Re-Enter your paswword',
                    obscure: controller.isHidePassword,
                    suffixIcon: Icons.remove_red_eye,
                    onTapSuffixIcon: () {controller.showPassword();},
                  ),
                  CustomButtonAuth(
                    onPressed: () {
                      controller.resetPassword(email);
                    },
                    text: 'Reset Password'
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
