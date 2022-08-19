import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/data/repository/auth/forgetpass_verify_repo.dart';
import 'package:store_app/routes/app_routes.dart';
import 'package:store_app/utils/constants/status-request.dart';
import 'package:store_app/utils/functions/handling_data.dart';

class VerifyCodeController extends GetxController {
  final ForgetPassVerifyRepo forgetPassVerifyRepo;
  VerifyCodeController({required this.forgetPassVerifyRepo});

  StatusRequest statusRequest = StatusRequest.none;

  verifyCode(String email, String verifycode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await forgetPassVerifyRepo.postData({'email': email, 'verifycode': verifycode});
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response['status'] == 'success'){
        Get.offNamed(AppRoute.getResetPassPage(email));
      } else{
        Get.snackbar('Faild', response['status'],
          backgroundColor: Colors.red.withOpacity(0.5), colorText: Colors.white);
      }
    }else{
      Get.snackbar('Faild', response['status'],
        backgroundColor: Colors.red.withOpacity(0.5), colorText: Colors.white);
    }
    update();
  }

  goToResetPassPage() {
    Get.offNamed(AppRoute.getLogin());
  }
}
