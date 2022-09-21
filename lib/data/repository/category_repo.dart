import 'package:store_app/data/api/api_client.dart';
import 'package:store_app/utils/constants/app_constants.dart';

class CategoryRepo{
  final ApiClient apiClient;

  CategoryRepo({required this.apiClient});

  postData() async {
    var response = await apiClient.postData(AppConstants.HOME_URI, {});
    return response.fold((l) => l, (r) => r);
  }
}