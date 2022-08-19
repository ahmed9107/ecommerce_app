import 'package:store_app/controller/auth_controllers/signup_controller.dart';
import 'package:store_app/utils/class/handling_data_view.dart';
import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/auth_widgets/custom_button.dart';
import 'package:store_app/view/widgets/auth_widgets/signup_login_text.dart';
import 'package:store_app/view/widgets/auth_widgets/socialmedia_auth.dart';
import 'package:store_app/view/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SignUpController>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: Dimensions.screenHeight *0.03,),
                  SizedBox(
                    height: Dimensions.screenHeight *0.25,
                    child: Center(child: Image.asset(
                      'assets/images/a.png',
                      color: Theme.of(context).primaryColorLight,
                      width: Dimensions.width100
                    )),
                  ),
                  CustomInputField(
                    type: TextInputType.emailAddress,
                    //title: 'Email',
                    hint: 'enterEmail'.tr,
                    controller:controller.email,
                    bgColor: controller.emailError
                      ? Colors.red.withOpacity(0.3)
                      : Theme.of(context).cardColor,
                    suffixIcon: Icons.email,
                  ),
                  CustomInputField(
                    type: TextInputType.text,
                    //title: 'Name',
                    hint: 'enterName'.tr,
                    controller:controller.user,
                    bgColor: controller.nameError
                      ? Colors.red.withOpacity(0.3)
                      : Theme.of(context).cardColor,
                    suffixIcon: Icons.person_outline,
                  ),
                  CustomInputField(
                    type: TextInputType.number,
                    //title: 'Phone',
                    hint: 'enterPhone'.tr,
                    controller:controller.phone,
                    bgColor: controller.phoneError
                      ? Colors.red.withOpacity(0.3)
                      : Theme.of(context).cardColor,
                    suffixIcon: Icons.phone_android_outlined
                  ),
                  CustomInputField(
                    type: TextInputType.text,
                    //title: 'Password',
                    hint: 'enterPass'.tr,
                    obscure: controller.isHidePassword,
                    controller:controller.password,
                    bgColor: controller.passError
                      ? Colors.red.withOpacity(0.3)
                      : Theme.of(context).cardColor,
                    suffixIcon: Icons.remove_red_eye,
                    showPass: () {controller.showPassword();},
                  ),
                  SizedBox(height: Dimensions.height15),
                  CustomButtonAuth(
                    text: 'signUp'.tr,
                    onPressed: (){
                      controller.signup();
                    }
                  ),
                  SizedBox(height: Dimensions.height20),
                  SocialMediaAuth(),
                  SizedBox(height: Dimensions.height25),
                  CustomTextSignUpOrSignIn(
                    onTap: () {
                      controller.goToLogin();
                    },
                    textone: 'signUpTxtOwn'.tr,
                    texttwo: 'signUpTxtTwo'.tr,
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