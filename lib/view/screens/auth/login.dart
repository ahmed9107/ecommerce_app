import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/auth/login_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/functions/input_validator.dart';
import '../../widgets/auth/auth_body_text.dart';
import '../../widgets/auth/auth_title.dart';
import '../../widgets/auth/custom_button_auth.dart';
import '../../widgets/auth/custom_text_field.dart';
import '../../widgets/auth/signup_text.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appBackgroundColor,
        title: Text(
          'Sign in',
          style: Theme.of(context).textTheme.headline1,
        ),
        elevation: 0.0,
      ),
      body: Form(
        key: controller.formstate,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
          child: ListView(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              const AuthTitle(
                title: 'Welcome Back!',
              ),
              const SizedBox(
                height: 10.0,
              ),
              const AuthBodyText(
                  text:
                      'Sign in with your Email and password or continue with social media'),
              const SizedBox(
                height: 65.0,
              ),
              AuthCustomTextFormField(
                controller: controller.emailController,
                hint: 'Enter your email',
                label: 'Email',
                suffixIcon: Icons.email_outlined,
                validator: (String? value) {
                  return inputValidator(value!, 10, 20, 'email');
                },
              ),
              AuthCustomTextFormField(
                controller: controller.emailController,
                hint: 'Enter your password',
                label: 'Password',
                suffixIcon: Icons.lock_outlined,
                validator: (String? value) {
                  return inputValidator(value!, 8, 20, 'password');
                },
              ),
              InkWell(
                onTap: () {
                  controller.goToForgetPass();
                },
                child: const Text(
                  'Forgot password',
                  textAlign: TextAlign.end,
                ),
              ),
              CustomButtonAuth(
                  onPressed: () {
                    controller.login();
                  },
                  text: 'Sign In'),
              const SizedBox(
                height: 10.0,
              ),
              CustomTextSignUpOrSignIn(
                onTap: () {
                  controller.goToSignUp();
                },
                textone: 'Don\'t have an account? ',
                texttwo: 'Sign Up',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
