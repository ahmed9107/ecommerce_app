/* import 'package:store_app/data/repository/order_repo.dart';
import 'package:store_app/models/order_model.dart';
import 'package:store_app/models/place_order_model.dart';
import 'package:get/get.dart';

class OrderController extends GetxController implements GetxService{
  final OrderRepo orderRepo;
  OrderController({required this.orderRepo});
  
  bool _isLoading = false;
  bool get isLoaded => _isLoading;

  @override
  onInit() async {
    super.onInit();
    await getOrderList();
  }

  Future<void> placeOrder(PlaceOrderModel placeOrder, Function callBack) async {
    _isLoading = true;
    Response response = await orderRepo.placeOrder(placeOrder);
    if(response.statusCode == 200){
      _isLoading = false;
      String msg = response.body['message'];
      String orderID = response.body['order_id'].toString();
      callBack(true, msg, orderID);
    } else {
      callBack(true, response.statusText, '-1');
    }
  }

  late List<OrderModel> _currentOrderList;
  late List<OrderModel> _historyOrderList;

  List<OrderModel> get currentOrderList => _currentOrderList;
  List<OrderModel> get historyOrderList => _historyOrderList;

  Future<void> getOrderList() async {
    _isLoading = true;
    Response response = await orderRepo.getOrderList();
    if(response.statusCode == 200){
      _historyOrderList = [];
      _currentOrderList = [];
      response.body.forEach((order){
        OrderModel orderModel = OrderModel.fromJson(order);
        if(orderModel.orderStatus == 'pending' ||
          orderModel.orderStatus == 'accepted' ||
          orderModel.orderStatus == 'processing' ||
          orderModel.orderStatus == 'handover' ||
          orderModel.orderStatus == 'picked_up'
        ){
          _currentOrderList.add(orderModel);
        }else{
          _historyOrderList.add(orderModel);
        }
      });
    } else {
      _historyOrderList = [];
      _currentOrderList = [];
    }
    _isLoading = false;
    update();
  }

  int _paymentIndex = 0;
  int get paymentIndex => _paymentIndex;

  void setPaymentIndex(int index){
    _paymentIndex = index;
    update();
  }

  String _deliveryType = 'delivery';
  String get deliveryType => _deliveryType;

  void setDeliveryType(String type){
    _deliveryType = type;
    update();
  }

  String _note = '';
  String get note => _note;

  void setItemNote(String note){
    _note = note;
  }
} */