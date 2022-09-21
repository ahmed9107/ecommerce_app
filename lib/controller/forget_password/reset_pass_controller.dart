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
  bool _emptyField = false;
  bool get differPass => _differPass;
  bool get emptyField => _emptyField;

  resetPassword(String email) async {
    if(fieldValidat()){
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPassRepo.postData({'email': email, 'password': newPass.text.trim()});
      statusRequest = handlingData(response);
      if(statusRequest == StatusRequest.success){
        if(response['status'] == 'success'){
          Get.offNamed(AppRoute.getLogin());
          Get.snackbar('Congratilations!', 'The password has been changed successfully',
            backgroundColor: Colors.green.withOpacity(0.5), colorText: Colors.white);
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
      update();
      Get.snackbar('Faild', errorMsg,
          backgroundColor: Colors.red.withOpacity(0.5), colorText: Colors.white);
    }
  }

  String errorMsg = '';

  bool fieldValidat(){
    if (rePassword.text.trim().isEmpty || newPass.text.trim().isEmpty) {
      errorMsg = 'All fields are required!';
      _emptyField =true;
      update();
      return false;
    }
    if (newPass.text.trim() != rePassword.text.trim()) {
      errorMsg = 'Password not match!';
      _differPass= true;
      _emptyField =false;
      update();
      return false;
    }
    return true;
  }

  bool isHidePassword = true;

  showPassword(){
    isHidePassword = !isHidePassword;
    update();
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
