import 'package:ecommerce_app/controllers/auth/forget_pass_controller.dart';
import 'package:ecommerce_app/controllers/auth/login_controller.dart';
import 'package:ecommerce_app/controllers/auth/reset_pass_controller.dart';
import 'package:ecommerce_app/controllers/auth/signup_controller.dart';
import 'package:ecommerce_app/controllers/auth/signup_verifycode_controller.dart';
import 'package:ecommerce_app/controllers/auth/success_resetpassword_controller.dart';
import 'package:ecommerce_app/controllers/auth/success_signup_controller.dart';
import 'package:ecommerce_app/controllers/auth/verify_code_controller.dart';
import 'package:ecommerce_app/controllers/onboarding_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Services extends GetxService {
  late SharedPreferences sharedPreferences;
  Future<Services> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

initServices() async {
  await Get.putAsync(()=> Services().init());
  Get.lazyPut(() => OnBoardingControllerImp());
  Get.lazyPut(() => ForgetPassController());
  Get.lazyPut(() => SignUpController());
  Get.lazyPut(() => LoginController());
  Get.lazyPut(() => SignUpVerifyCodeController());
  Get.lazyPut(() => ResetPasswordController());
  Get.lazyPut(() => SuccessResetPassController());
  Get.lazyPut(() => SuccessSignUpController());
  Get.lazyPut(() => VerifyCodeController());
}