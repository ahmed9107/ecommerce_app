import 'package:store_app/data/api/api_client.dart';
import 'package:store_app/utils/constants/app_constants.dart';

class CheckEmailRepo{
  final ApiClient apiClient;

  CheckEmailRepo({required this.apiClient});

  postData(String email) async {
    var response = await apiClient.postData(AppConstants.CHECK_EMAIL_URI, {'email': email});
    return response.fold((l) => l, (r) => r);
  }
}