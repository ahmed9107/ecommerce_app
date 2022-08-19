import 'package:store_app/data/api/api_http_clt.dart';
import 'package:store_app/utils/constants/app_constants.dart';

class CheckEmailRepo{
  final ApiHttpClient apiHttpClient;

  CheckEmailRepo({required this.apiHttpClient});

  postData(String email) async {
    var response = await apiHttpClient.postData(AppConstants.CHECK_EMAIL_URI, {'email': email});
    return response.fold((l) => l, (r) => r);
  }
}