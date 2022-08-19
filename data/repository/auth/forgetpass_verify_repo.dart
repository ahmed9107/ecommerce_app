import 'package:store_app/data/api/api_http_clt.dart';
import 'package:store_app/utils/constants/app_constants.dart';

class ForgetPassVerifyRepo{
  final ApiHttpClient apiHttpClient;

  ForgetPassVerifyRepo({required this.apiHttpClient});

  postData(Map<String, dynamic> data) async {
    var response = await apiHttpClient.postData(AppConstants.FORGETPASS_VERIFY_CODE_URI, data);
    return response.fold((l) => l, (r) => r);
  }
}