import 'package:store_app/models/cart.dart';

class PlaceOrderModel{
  late String _cart;
  late String _userId;
  late String _orderAmount;
  late String _paymentStatus;
  late String _orderNote;
  late String _deliveryCharge;
  late String _deliveryAddress;
  late String _isAccepted;

  PlaceOrderModel({
    required String cart,
    required String userId,
    required String orderAmount,
    required String orderNote,
    required String paymentStatus,
    required String deliveryCharge,
    required String deliveryAddress,
    required String isAccepted,
  }){
    _cart                     = cart;
    _userId                   = userId;
    _orderAmount              = orderAmount;
    _orderNote                = orderNote;
    _paymentStatus            = paymentStatus;
    _deliveryCharge           = deliveryCharge;
    _deliveryAddress          = deliveryAddress;
    _isAccepted               = isAccepted;
  }

  String get cart             => _cart;
  String get userId           => _userId;
  String get orderAmount      => _orderAmount;
  String get paymentStatus    => _paymentStatus;
  String get orderNote        => _orderNote;
  String get deliveryCharge   => _deliveryCharge;
  String get deliveryAddress  => _deliveryAddress;
  String get isAccepted       => _isAccepted;

  PlaceOrderModel.fromJson(Map<String, dynamic> json){
    _cart                     = json['cart'];
    _userId                   = json['user_id'];
    _orderAmount              = json['order_amount'];
    _orderNote                = json['order_note'];
    _paymentStatus            = json['payment_status'];
    _deliveryCharge           = json['delivery_charge'];
    _deliveryAddress          = json['delivery_address'];
    _isAccepted               = json['is_accepted'];
  }

  Map<String, dynamic> toJson(){
    return {
      'user_id'               : _userId,
      'order_amount'          : _orderAmount,
      'payment_status'        : _paymentStatus,
      'order_note'            : _orderNote,
      'delivery_charge'       : _deliveryCharge,
      'is_accepted'           : _isAccepted,
      'delivery_address'      : _deliveryAddress,
      'cart'                  : _cart,
    };
  }

  static String getStringCart(List<CartModel> cart) {
    String str = "";
    for (int i = 0; i < cart.length; i++) {
      str += cart[i].id!;
      str += ",${cart[i].price!}";
      str += ",${cart[i].quantity!}";
      str += "#";
    }
    return str;
  }
}