import 'package:store_app/data/api/api_client.dart';
import 'package:store_app/models/place_order_model.dart';
import 'package:store_app/utils/constants/app_constants.dart';

class OrderRepo{
  final ApiClient apiClient;

  OrderRepo({required this.apiClient});

  placeOrder(PlaceOrderModel placeOrder) async {
    var response = await apiClient.postData(AppConstants.PLACE_ORDER_URI, placeOrder.toJson());
    return response.fold((l) => l, (r) => r);
  }

  getOrderList() async {
    return await apiClient.postData(AppConstants.ORDER_LIST_URI, {});
  }
}