import 'package:store_app/models/product.dart';

class CartModel {
  String? id;
  String? name;
  String? img;
  int? price;
  int? quantity;
  bool? isExist;
  String? time;
  Product? product;

  CartModel({
    this.id,
    this.name,
    this.price,
    this.img,
    this.quantity,
    this.isExist,
    this.time,
    this.product,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id        = json['id'];
    name      = json['name'];
    price     = json['price'];
    img       = json['img'];
    quantity  = json['quantity'];
    isExist   = json['isExist'];
    time      = json['time'];
    product   = Product.fromJson(json['product']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id'        : id,
      'name'      : name,
      'price'     : price,
      'img'       : img,
      'quantity'  : quantity,
      'isExist'   : isExist,
      'time'      : time,
      'product'   : product!.toJson()
    };
  }
}
