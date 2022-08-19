import 'package:store_app/data/api/api_http_clt.dart';
import 'package:store_app/utils/constants/app_constants.dart';

class ResetPassRepo{
  final ApiHttpClient apiHttpClient;

  ResetPassRepo({required this.apiHttpClient});

  postData(Map<String, dynamic> data) async {
    var response = await apiHttpClient.postData(AppConstants.RESETPASS_URI, data);
    return response.fold((l) => l, (r) => r);
  }
}