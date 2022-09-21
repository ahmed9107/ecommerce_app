import 'package:store_app/data/api/api_client.dart';
import 'package:store_app/utils/constants/app_constants.dart';

class SearchRepo{
  final ApiClient apiClient;

  SearchRepo({required this.apiClient});

  searchProducts(String pattern) async {
    var response = await apiClient.postData(AppConstants.SEARCH_PRODUCTS_URL, {'pattern': pattern});
    return response.fold((l) => l, (r) => r);
  }
  
  setProduct(String pattern) async {
    var response = await apiClient.postData(AppConstants.SET_PRODUCTS_URL, {'pattern': pattern});
    return response.fold((l) => l, (r) => r);
  }
}