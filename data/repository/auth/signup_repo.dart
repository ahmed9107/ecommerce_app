import 'package:store_app/data/api/api_http_clt.dart';
import 'package:store_app/models/signup.dart';
import 'package:store_app/utils/constants/app_constants.dart';

class SignUpRepo{
  final ApiHttpClient apiHttpClient;
  /* final SharedPreferences sharedPref; */

  SignUpRepo({required this.apiHttpClient/* , required this.sharedPref */});

  postData(SignUpModel signUpModel) async {
    var response = await apiHttpClient.postData(AppConstants.REGISTRATION_URI, signUpModel.toJson());
    return response.fold((l) => l, (r) => r);
  }
}