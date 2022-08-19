import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/data/repository/auth/resetpass_repo.dart';
import 'package:store_app/routes/app_routes.dart';
import 'package:store_app/utils/constants/status-request.dart';
import 'package:store_app/utils/functions/handling_data.dart';

class ResetPasswordController extends GetxController {
  final ResetPassRepo resetPassRepo;
  late TextEditingController newPass;
  late TextEditingController rePassword;

  ResetPasswordController({required this.resetPassRepo});

  StatusRequest statusRequest = StatusRequest.none;
  bool _differPass = false;
  bool get differPass => _differPass;

  resetPassword(String email) async {
    statusRequest = StatusRequest.loading;
    update();
    if(newPass.text.trim() == rePassword.text.trim()){
      var response = await resetPassRepo.postData({'email': email, 'password': newPass.text.trim()});
      statusRequest = handlingData(response);
      if(statusRequest == StatusRequest.success){
        if(response['status'] == 'success'){
          Get.offNamed(AppRoute.getLogin());
        } else{
          Get.snackbar('Faild', response['status'],
            backgroundColor: Colors.red.withOpacity(0.5), colorText: Colors.white);
        }
      }else{
        Get.snackbar('Faild', response['status'],
          backgroundColor: Colors.red.withOpacity(0.5), colorText: Colors.white);
      }
      update();
    }else{
      _differPass =true;
      update();
      Get.snackbar('Faild', 'You don\'t enter same password!',
          backgroundColor: Colors.red.withOpacity(0.5), colorText: Colors.white);
    }
  }

  @override
  void onInit() {
    newPass = TextEditingController();
    rePassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    newPass.dispose();
    rePassword.dispose();
    super.dispose();
  }
}
