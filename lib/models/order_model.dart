import 'package:store_app/models/adress_model.dart';

class OrderModel{
  late int id;
  late int userId;
  double? orderAmount;
  String? paymentStatus;
  String? orderNote;
  String? createdAt;
  String? updatedAt;
  double? deliveryCharge;
  String? scheduleAt;
  int? scheduled;
  int? detailsCount;
  AdressModel? deliveryAddress;

  OrderModel({
    required this.id,
    required this.userId,
    this.orderAmount,
    this.paymentStatus,
    this.orderNote,
    this.createdAt,
    this.updatedAt,
    this.deliveryCharge,
    this.scheduleAt,
    this.scheduled,
    this.detailsCount,
    this.deliveryAddress,
  });

  OrderModel.fromJson(Map<String, dynamic> json){
    id              = json['id'];
    userId          = json['user_id'];
    orderAmount     = json['order_amount'].toDouble();
    paymentStatus   = json['payment_status']??"pending";
    orderNote       = json['order_note'];
    createdAt       = json['created_at'];
    updatedAt       = json['updated_at'];
    deliveryCharge  = 25.0;
    scheduleAt      = json['schedule_at']??"";
    scheduled       = json['scheduled'];
    detailsCount    = json['details_count'];
    deliveryAddress = (json['delivery_address'] != null 
      ? AdressModel.fromJson(json['delivery_address'])
      : null)!;
  }

  Map<String, dynamic> toJson(){
    return {
      'id'                : id,
      'user_id'           : userId,
      'order_amount'      : orderAmount,
      'payment_status'    : paymentStatus,
      'order_note'        : orderNote,
      'created_at'        : createdAt,
      'updated_at'        : updatedAt,
      'delivery_charge'   : deliveryCharge,
      'schedule_at'       : scheduleAt,
      'scheduled'         : scheduled,
      'details_count'     : detailsCount,
      'delivery_address'  : deliveryAddress != null ? deliveryAddress!.toJson() : null,
    };
  }
}