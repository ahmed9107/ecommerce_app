import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/data/repository/auth/login_repo.dart';
import 'package:store_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/utils/constants/status-request.dart';
import 'package:store_app/utils/functions/handling_data.dart';

class LoginController extends GetxController {
  final LoginRepo loginRepo;
  final SharedPreferences sharedPref;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  LoginController({required this.sharedPref, required this.loginRepo});

  bool _emailError = false;
  bool get emailError => _emailError;
  
  bool _emptyError = false;
  bool get emptyError => _emptyError;
  
  StatusRequest statusRequest = StatusRequest.none;

  login() async {
    if(fieldValidat()){
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginRepo.postData(emailController.text.trim(), passwordController.text.trim());
      statusRequest = handlingData(response);
      if(statusRequest == StatusRequest.success){
        if(response['status'] == 'success'){
          sharedPref.setString('id', response['data']["users_id"]);
          sharedPref.setString('username', response['data']["users_name"]);
          sharedPref.setString('phone', response['data']["users_phone"]);
          sharedPref.setString('email', response['data']["users_email"]);
          sharedPref.setString('isLogin', 'login');
          Get.offAllNamed(AppRoute.getInitial());
        } else if(response['status'] == 'notApprovedUser'){
          Get.offAllNamed(AppRoute.getSignupVerifyCode(emailController.text.trim()));
        } else {
          Get.snackbar('Faild', 'The email or password not correct!',
            backgroundColor: Colors.red.withOpacity(0.5), colorText: Colors.white);
        }
      } else {
        Get.snackbar('Faild', errorMsg,
          backgroundColor: Colors.red.withOpacity(0.5), colorText: Colors.white);
      }
      update();
    }
  }

  String errorMsg = '';

  bool fieldValidat(){
    if (!GetUtils.isEmail(emailController.text.trim()) || emailController.text.trim().isEmpty) {
      _emailError = true;
      errorMsg = 'Enter your email';
      update();
      return false;
    }
    if (emailController.text.trim().isEmpty || passwordController.text.trim().isEmpty) {
      _emailError = false;
      _emptyError = true;
      errorMsg = 'Enter your password';
      update();
      return false;
    }
    return true;
  }

  goToSignUp() {
    Get.offNamed(AppRoute.signup);
  }

  goToForgetPass() {
    Get.toNamed(AppRoute.forgetPassword);
  }

  bool isHidePassword = true;

  showPassword(){
    isHidePassword = !isHidePassword;
    update();
  }

  /* bool clearSharedData(){
    return authRepo.clearSharedData();
  } */

  /* goToForgetPass() {
    Get.toNamed(AppRoute.forgetPassword);
  } */

  @override
  void onInit() {
    emailController     = TextEditingController();
    passwordController  = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
