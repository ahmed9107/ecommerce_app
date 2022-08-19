import 'package:store_app/data/api/api_client.dart';
import 'package:store_app/models/signup.dart';
import 'package:store_app/utils/constants/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo{
  final ApiClient apiClient;
  final SharedPreferences sharedPref;

  AuthRepo({required this.apiClient, required this.sharedPref});

  Future<Response> registration(SignUpModel signUpModel) async {
    return await apiClient.postData(AppConstants.REGISTRATION_URI, signUpModel.toJson());
  }
  
  Future<Response> login(String email, String password) async {
    return await apiClient.postData(AppConstants.LOGIN_URI, {"email": email,"password":password});
  }

  String getUserToken() {
    return sharedPref.getString(AppConstants.TOKEN)??"None";
  }
  
  bool userLoggedIn() {
    return sharedPref.containsKey(AppConstants.TOKEN);
  }

  Future<bool> saveUserToken(String token) async {
    //apiClient.token = token;
    //apiClient.updateHeader(token);
    return await sharedPref.setString(AppConstants.TOKEN, token);
  }

  Future<void> saveUserNumberAndPassword(String phone, String password) async {
    try {
      await sharedPref.setString(AppConstants.PHONE, phone);
      await sharedPref.setString(AppConstants.PASSWORD, password);
    } catch (e) {
      print('THE ERROR FROM saveUserNumberAndPassword METHOD IN AuthRepo ===> $e');
      rethrow;
    }
  }

  bool clearSharedData(){
    sharedPref.remove(AppConstants.TOKEN);
    sharedPref.remove(AppConstants.PASSWORD);
    sharedPref.remove(AppConstants.PHONE);
    //apiClient.token = '';
    //apiClient.updateHeader('');
    return true;
  }
}