import 'package:google_fonts/google_fonts.dart';
import 'package:store_app/controller/auth_controllers/login_controller.dart';
import 'package:store_app/utils/class/handling_data_view.dart';
import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/auth_widgets/custom_button.dart';
import 'package:store_app/view/widgets/auth_widgets/signup_login_text.dart';
import 'package:store_app/view/widgets/auth_widgets/socialmedia_auth.dart';
import 'package:store_app/view/widgets/big_text.dart';
import 'package:store_app/view/widgets/custom_input_field.dart';
import 'package:store_app/view/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoginController>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: Dimensions.screenHeight *0.05),
                  SizedBox(
                    height: Dimensions.screenHeight *0.20,
                    child: Center(child: Image.asset(
                      'assets/images/a.png',
                      color: Theme.of(context).primaryColorLight,
                      width: Dimensions.width100
                    )),
                  ),
                  SizedBox(height: Dimensions.height15),
                  Container(
                    margin: EdgeInsets.only(left: Dimensions.width15, right:Dimensions.width15),
                    width: double.maxFinite,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigText(text: 'Welcome', size: Dimensions.font32),
                        SizedBox(height: Dimensions.height10),
                        const SmallText(text: 'Sign in to your account'),
                      ],
                    ),
                  ),
                  SizedBox(height: Dimensions.height25),
                  CustomInputField(
                    type: TextInputType.emailAddress,
                    hint: 'enterEmail'.tr,
                    controller:controller.emailController,
                    bgColor: controller.emailError
                      ? Colors.red.withOpacity(0.3)
                      : Theme.of(context).cardColor,
                    suffixIcon: Icons.email,
                  ),
                  CustomInputField(
                    type: TextInputType.text,
                    hint: 'enterPass'.tr,
                    obscure: controller.isHidePassword,
                    controller:controller.passwordController,
                    bgColor: controller.emptyError
                      ? Colors.red.withOpacity(0.3)
                      : Theme.of(context).cardColor,
                    suffixIcon: Icons.remove_red_eye,
                    showPass: () {controller.showPassword();},
                  ),
                  SizedBox(height: Dimensions.height10),
                  Container(
                    margin: EdgeInsets.only(right: Dimensions.height15),
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: () {
                        controller.goToForgetPass();
                      },
                      child: Text(
                        'forgetPass'.tr,
                        textAlign: TextAlign.end,
                        style: GoogleFonts.roboto(
                          color: Theme.of(context).primaryColorLight
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: Dimensions.height15),
                  CustomButtonAuth(
                    text: 'login'.tr, 
                    onPressed: () {
                      controller.login();
                    }
                  ),
                  SizedBox(height: Dimensions.height20),
                  SocialMediaAuth(),
                  SizedBox(height: Dimensions.height25),
                  CustomTextSignUpOrSignIn(
                    onTap: () {
                      controller.goToSignUp();
                    },
                    textone: 'loginTextOwn'.tr,
                    texttwo: 'loginTextTwo'.tr,
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