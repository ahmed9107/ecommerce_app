import 'package:store_app/data/repository/auth/signup_repo.dart';
import 'package:store_app/models/signup.dart';
import 'package:store_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/utils/constants/status-request.dart';
import 'package:store_app/utils/functions/handling_data.dart';

class SignUpController extends GetxController implements GetxService{
  final SignUpRepo signUpRepo;
  late TextEditingController user;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;

  SignUpController({required this.signUpRepo});
  
  final List _data = [];
  List get data => _data;
  StatusRequest statusRequest = StatusRequest.none;

  signup() async {
    if(fieldValidat()){
      SignUpModel signupModel = SignUpModel(
        email   : email.text.trim(),
        username: user.text.trim(),
        phone   : phone.text.trim(),
        password: password.text.trim(),
      );
      statusRequest = StatusRequest.loading;
      update();
      var response = await signUpRepo.postData(signupModel);
      statusRequest = handlingData(response);
      if(statusRequest == StatusRequest.success){
        if(response['status'] == 'success'){
          //_data.addAll(response['data']);
          Get.offAllNamed(AppRoute.getSignupVerifyCode(email.text.trim()));
        }else{
          Get.snackbar('Faild', 'Phone number or email is already exist',
            backgroundColor: Colors.red.withOpacity(0.5), colorText: Colors.white);
        }
      }else{
        Get.snackbar('Faild', 'Phone number or email is already exist',
          backgroundColor: Colors.red.withOpacity(0.5), colorText: Colors.white);
      }
      update();
    } else {
      Get.snackbar('Faild', errorMsg,
          backgroundColor: Colors.red.withOpacity(0.5), colorText: Colors.white);
    }
  }

  bool _emailError = false;
  bool get emailError => _emailError;
  bool _nameError = false;
  bool get nameError => _nameError;
  bool _phoneError = false;
  bool get phoneError => _phoneError;
  bool _passError = false;
  bool get passError => _passError;
  String errorMsg = '';

  bool fieldValidat(){
    if (!GetUtils.isEmail(email.text.trim()) || email.text.trim().isEmpty) {
      _emailError = true;
      errorMsg = 'Enter a valid email';
      update();
      return false;
    }
    if (!GetUtils.isUsername(user.text.trim()) ||
      user.text.trim().isEmpty ||
      user.text.trim().length < 3 ||
      user.text.trim().length > 20) {
      _emailError = false;
      _nameError = true;
      errorMsg = 'Enter a valid name';
      update();
      return false;
    }
    if (!GetUtils.isPhoneNumber(phone.text.trim()) ||
        phone.text.trim().isEmpty ||
        phone.text.trim().length < 6 ||
        phone.text.trim().length > 20) {
      _emailError = false;
      _nameError = false;
      _phoneError = true;
      errorMsg = 'Enter a valid Phone number';
      update();
      return false;
    }
    if (password.text.trim().isEmpty ||
        password.text.trim().length < 8 ||
        password.text.trim().length > 30) {
      _emailError = false;
      _nameError  = false;
      _phoneError = false;
      _passError  = true;
      errorMsg = 'Enter a valid password';
      update();
      return false;
    }
    return true;
  }

  goToLogin() {
    Get.offNamed(AppRoute.login);
  }

  bool isHidePassword = true;

  showPassword(){
    isHidePassword = !isHidePassword;
    update();
  }

  @override
  void onInit() {
    user      = TextEditingController();
    email     = TextEditingController();
    phone     = TextEditingController();
    password  = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    user.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}
