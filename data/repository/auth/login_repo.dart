import 'package:store_app/data/api/api_http_clt.dart';
import 'package:store_app/utils/constants/app_constants.dart';

class LoginRepo{
  final ApiHttpClient apiHttpClient;
  /* final SharedPreferences sharedPref; */

  LoginRepo({required this.apiHttpClient/* , required this.sharedPref */});

  postData(String email, String password) async {
    var response = await apiHttpClient.postData(AppConstants.LOGIN_URI, {'email': email, 'password': password});
    return response.fold((l) => l, (r) => r);
  }
}