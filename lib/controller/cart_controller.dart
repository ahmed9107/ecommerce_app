import 'package:store_app/controller/auth_controllers/user_controller.dart';
import 'package:store_app/controller/order_controller.dart';
import 'package:store_app/data/repository/cart_repo.dart';
import 'package:store_app/models/cart.dart';
import 'package:store_app/models/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/routes/app_routes.dart';
import 'package:store_app/utils/constants/colors.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});

  Map<String, CartModel> _items = {};
  List<CartModel> storageItems = [];

  void addItem(Product product, int quantity) {
    if (_items.containsKey(product.itemsId!)) {
      updateItemInCartIfExist(product, quantity);
    } else {
      putItemInCartIfAbsent(product, quantity);
    }
    cartRepo.addToCartList(getCartItems);
    update();
  }

  void updateItemInCartIfExist(Product product, int quantity) {
    int totalQuantity = 0;
    _items.update(product.itemsId!, (value) {
      totalQuantity = value.quantity! + quantity;
      return CartModel(
        id: product.itemsId!,
        name: product.itemsName,
        price: int.parse(product.itemsPrice!),
        img: product.itemsImages![0].image,
        quantity: quantity + value.quantity!,
        isExist: true,
        time: DateTime.now().toString(),
        product: product
      );
    });
    if (totalQuantity <= 0) {
      _items.remove(product.itemsId);
    }
  }

  void putItemInCartIfAbsent(Product product, int quantity) {
    if (quantity > 0) {
      _items.putIfAbsent(
        product.itemsId!,
        () => CartModel(
          id: product.itemsId!,
          name: product.itemsName,
          price: int.parse(product.itemsPrice!),
          img: product.itemsImages![0].image,
          quantity: quantity,
          isExist: true,
          time: DateTime.now().toString(),
          product: product
        ));
    } else {
      Get.snackbar(
        'Item count',
        'You should at least add an item in the cart',
        backgroundColor: AppColor.errorColor,
        colorText: Colors.white
      );
    }
  }

  // Reason of this method to check if the product is exist in the cart or not
  bool existInCart(Product product) {
    if (_items.containsKey(product.itemsId!)) {
      return true;
    }
    return false;
  }

  int getQuantityIfExist(Product product) {
    int quantity = 0;
    if (_items.containsKey(product.itemsId!)) {
      _items.forEach((key, value) {
        if (key == product.itemsId) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalItemsInCart {
    int totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }

  List<CartModel> get getCartItems {
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }

  int get totalAmount {
    int total = 0;
    _items.forEach((key, value) {
      total += value.quantity! * value.price!;
    });
    return total;
  }

  List<CartModel> getCartData() {
    setCart = cartRepo.getCartList();
    return storageItems;
  }

  set setCart(List<CartModel> items) {
    storageItems = items;
    for (int i = 0; i < storageItems.length; i++) {
      _items.putIfAbsent(storageItems[i].product!.itemsId!, () => storageItems[i]);
    }
  }

  void addCartItemsToHistory() {
    cartRepo.addToCartHistoryList();
    clear();
  }

  void clear() {
    _items = {};
    update();
  }

  void removeCartSharedPrefs(){
    cartRepo.removeCartSharedPrefs();
  }

  List<CartModel> getCartHistoryList() {
    return cartRepo.getCartHistoryList();
  }

  set setItemsToCartForMoreOrder(Map<String, CartModel> setItems) {
    _items = {};
    _items = setItems;
  }

  void addToCartList() {
    cartRepo.addToCartList(getCartItems);
    update();
  }

  void clearCartHistory(){
    cartRepo.clearCartHistory();
    update();
  }

  void callBack(bool isSuccess, String msg, String orderID){
    if(isSuccess){
      clear();
      removeCartSharedPrefs();
      addCartItemsToHistory();
      if(Get.find<OrderController>().paymentIndex == 0){
        Get.offNamed(AppRoute.getOrderSuccessRoute(orderID, 'success'));
      }else{
        Get.offNamed(AppRoute.getPayment(orderID, int.parse(Get.find<UserController>().userId)));
      }
    } else {
      Get.snackbar('Error!', msg);
    }
  }
}