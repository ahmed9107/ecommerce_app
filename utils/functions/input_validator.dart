import 'package:flutter/material.dart';
import 'package:get/get.dart';

inputValidator(String val, int min, int max, String type) {
  if (type == 'username') {
    if (!GetUtils.isUsername(val)) {
      Get.snackbar('Change Username!', 'Not valid username',
          backgroundColor: const Color(0xFFF11A37), colorText: Colors.white);
      return 'Not valid username';
    }
  }
  if (type == 'email') {
    if (!GetUtils.isEmail(val)) {
      Get.snackbar('Email!', 'Not valid email',
          backgroundColor: const Color(0xFFF11A37), colorText: Colors.white);
      return '';
    }
  }
  if (type == 'phone') {
    if (!GetUtils.isPhoneNumber(val)) {
      Get.snackbar('Phone!', 'Not valid phone number',
          backgroundColor: const Color(0xFFF11A37), colorText: Colors.white);
      return 'Not valid phone number';
    }
  }
  if (val.length < min) {
    Get.snackbar('Min!', 'Can\'t be less than $min',
          backgroundColor: const Color(0xFFF11A37), colorText: Colors.white);
    return 'Can\'t be less than $min';
  }
  if (val.isEmpty) {
    Get.snackbar('Empty field!', 'Can\'t be empty',
          backgroundColor: const Color(0xFFF11A37), colorText: Colors.white);
    return 'Can\'t be empty';
  }
  if (val.length > max) {
    Get.snackbar('Max!', 'Can\'t be more than $max',
          backgroundColor: const Color(0xFFF11A37), colorText: Colors.white);
    return 'Can\'t be more than $max';
  }
}
