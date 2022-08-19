import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/data/repository/auth/check_email_repo.dart';
import 'package:store_app/routes/app_routes.dart';
import 'package:store_app/utils/constants/status-request.dart';
import 'package:store_app/utils/functions/handling_data.dart';

class ForgetPassController extends GetxController {
  final CheckEmailRepo checkEmailRepo;
  late TextEditingController email;

  ForgetPassController({required this.checkEmailRepo});

  StatusRequest statusRequest = StatusRequest.none;

  checkEmail() async {
    if(fieldValidat()){
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkEmailRepo.postData(email.text.trim());
      statusRequest = handlingData(response);
      if(statusRequest == StatusRequest.success){
        if(response['status'] == 'success'){
          Get.offNamed(AppRoute.getResetPassVerifyCode(email.text.trim()));
        }else{
          Get.snackbar('Faild', 'The email doesn\'t exist!',
            backgroundColor: Colors.red.withOpacity(0.5), colorText: Colors.white);
        }
      }
      update();
    } else {
      Get.snackbar('Faild', errorMsg,
        backgroundColor: Colors.red.withOpacity(0.5), colorText: Colors.white);
    }
  }

  bool _emailError = false;
  bool get emailError => _emailError;
  String errorMsg = '';

  bool fieldValidat(){
    if (!GetUtils.isEmail(email.text.trim()) || email.text.trim().isEmpty) {
      _emailError = true;
      errorMsg = 'Enter your email';
      update();
      return false;
    }
    return true;
  }

  goToVerifyPage() {
    Get.offNamed(AppRoute.verifyCode);
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
