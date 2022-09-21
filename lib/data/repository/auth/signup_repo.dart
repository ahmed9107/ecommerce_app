import 'package:store_app/data/api/api_client.dart';
import 'package:store_app/models/signup.dart';
import 'package:store_app/utils/constants/app_constants.dart';

class SignUpRepo{
  final ApiClient apiClient;
  /* final SharedPreferences sharedPref; */

  SignUpRepo({required this.apiClient/* , required this.sharedPref */});

  postData(SignUpModel signUpModel) async {
    var response = await apiClient.postData(AppConstants.REGISTRATION_URI, signUpModel.toJson());
    return response.fold((l) => l, (r) => r);
  }
}