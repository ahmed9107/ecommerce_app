import 'package:store_app/models/adress_model.dart';

class OrderModel{
  late int id;
  late int userId;
  double? orderAmount;
  String? orderStatus;

  String? paymentStatus;
  double? totalTaxAmount;
  String? orderNote;
  String? createdAt;
  String? updatedAt;
  double? deliveryCharge;
  String? scheduleAt;
  String? otp;
  String? pending;
  String? accepted;
  String? confirmed;
  String? processing;
  String? handover;
  String? pickedUp;
  String? delivered;
  String? canceled;
  String? refundRequested;
  String? refunded;
  int? scheduled;
  String? failed;
  int? detailsCount;
  AdressModel? deliveryAddress;

  OrderModel({
    required this.id,
    required this.userId,
    this.orderAmount,
    this.orderStatus,
    this.paymentStatus,
    this.totalTaxAmount,
    this.orderNote,
    this.createdAt,
    this.updatedAt,
    this.deliveryCharge,
    this.scheduleAt,
    this.otp,
    this.pending,
    this.accepted,
    this.confirmed,
    this.processing,
    this.handover,
    this.pickedUp,
    this.delivered,
    this.canceled,
    this.refundRequested,
    this.refunded,
    this.scheduled,
    this.failed,
    this.detailsCount,
    this.deliveryAddress,
  });

  OrderModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    userId = json['user_id'];
    orderAmount = json['order_amount'].toDouble();
    paymentStatus = json['payment_status']??"pending";
    totalTaxAmount = 0.2;
    orderNote = json['order_note'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deliveryCharge = 25.0;
    scheduleAt = json['schedule_at']??"";
    otp = json['otp'];
    pending = json['pending']??"";
    confirmed = json['confirmed']??"";
    processing = json['processing']??"";
    handover = json['handover']??"";
    pickedUp = json['picked_up']??"";
    delivered = json['delivered']??"";
    canceled = json['canceled']??"";
    scheduled = json['scheduled'];
    failed = json['failed']??"";
    detailsCount = json['details_count'];
    deliveryAddress = (json['delivery_address'] != null 
        ? AdressModel.fromJson(json['delivery_address'])
        : null)!;
  }

  Map<String, dynamic> toJson(){
    return {
      'id' : id,
      'user_id' : userId,
      'order_amount' : orderAmount,
      'payment_status' : paymentStatus,
      'total_tax_amount' : totalTaxAmount,
      'order_note' : orderNote,
      'created_at' : createdAt,
      'updated_at' : updatedAt,
      'delivery_charge' : deliveryCharge,
      'schedule_at' : scheduleAt,
      'otp' : otp,
      'pending' : pending,
      'confirmed' : confirmed,
      'processing' : processing,
      'handover' : handover,
      'picked_up' : pickedUp,
      'delivered' : delivered,
      'canceled' : canceled,
      'scheduled' : scheduled,
      'refund_requested' : refundRequested,
      'refunded' : refunded,
      'failed' : failed,
      'details_count' : detailsCount,
      'delivery_address' : deliveryAddress != null ? deliveryAddress!.toJson() : null,
    };
  }
}