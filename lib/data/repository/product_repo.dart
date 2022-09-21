import 'package:store_app/data/api/api_client.dart';
import 'package:store_app/utils/constants/app_constants.dart';

class ProductsRepo{
  final ApiClient apiClient;

  ProductsRepo({required this.apiClient});

  postData() async {
    var response = await apiClient.postData(AppConstants.HOME_URI, {});
    return response.fold((l) => l, (r) => r);
  }
  
  getFavoritesProducts(String userId) async {
    var response = await apiClient.postData(AppConstants.FAVORITE_PRODUCT_URL, {"userid": userId});
    return response.fold((l) => l, (r) => r);
  }
  
  changeFavoritesProducts(String userId, String productId) async {
    var response = await apiClient.postData(AppConstants.CHANGE_FAVORITE_URL, {"productid": productId ,"userid": userId});
    return response.fold((l) => l, (r) => r);
  }
}