import 'package:get/get.dart';

inputValidator(String val, int min, int max, String type) {
  if (type == 'username') {
    if (!GetUtils.isUsername(val)) {
      return 'Not valid username';
    }
  }
  if (type == 'email') {
    if (!GetUtils.isEmail(val)) {
      return 'Not valid email';
    }
  }
  if (type == 'phone') {
    if (!GetUtils.isPhoneNumber(val)) {
      return 'Not valid phone number';
    }
  }
  if (val.length < min) {
    return 'Can\'t be less than $min';
  }
  if (val.isEmpty) {
    return 'Can\'t be empty';
  }
  if (val.length > max) {
    return 'Can\'t be more than $max';
  }
}
