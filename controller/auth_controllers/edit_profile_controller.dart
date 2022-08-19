import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController{
  late TextEditingController username;
  late TextEditingController birthday;
  late TextEditingController phone;
  late TextEditingController country;
  late TextEditingController gender;

  @override
  void onInit() {
    username = TextEditingController();
    birthday = TextEditingController();
    phone = TextEditingController();
    country = TextEditingController();
    gender = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    birthday.dispose();
    phone.dispose();
    country.dispose();
    gender.dispose();
    super.dispose();
  }
}