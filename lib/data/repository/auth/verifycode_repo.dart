import 'package:store_app/data/api/api_client.dart';
import 'package:store_app/utils/constants/app_constants.dart';

class VerifyCodeRepo{
  final ApiClient apiClient;

  VerifyCodeRepo({required this.apiClient});

  postData(Map<String, dynamic> data) async {
    var response = await apiClient.postData(AppConstants.VERIFY_CODE_URI, data);
    return response.fold((l) => l, (r) => r);
  }
}