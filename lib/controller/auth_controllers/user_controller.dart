import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class UserController extends GetxController implements GetxService {
  final SharedPreferences sharedPref;
  
  UserController({required this.sharedPref});

  late String userId;
  late String userEmail;
  late String userPhone;
  late String userName;

  getUserInfo() {
    userId    = sharedPref.getString('id')!;
    userEmail = sharedPref.getString('email')!;
    userPhone = sharedPref.getString('phone')!;
    userName  = sharedPref.getString('username')!;
  }

  @override
  void onInit() {
    super.onInit();
    getUserInfo();
  }
}
