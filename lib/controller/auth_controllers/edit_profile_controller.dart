import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/auth_controllers/user_controller.dart';

class EditProfileController extends GetxController{
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController country;
  late TextEditingController gender;

  @override
  void onInit() {
    username        = TextEditingController();
    email           = TextEditingController();
    phone           = TextEditingController();
    country         = TextEditingController();
    gender          = TextEditingController();
    username.text   = Get.find<UserController>().userName;
    phone.text      = Get.find<UserController>().userPhone;
    email.text      = Get.find<UserController>().userEmail;
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    country.dispose();
    gender.dispose();
    super.dispose();
  }
}