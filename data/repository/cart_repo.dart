/* import 'package:store_app/utils/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/models/cart.dart';
import 'dart:convert';

class CartRepo {
  final SharedPreferences sharedPrefs;

  CartRepo({required this.sharedPrefs});

  List<String> cart = [];
  List<String> cartHistory = [];

  void addToCartList(List<CartModel> cartList) {
    var time = DateTime.now().toString();
    cart = [];

    /// Convert object to string using jsonEncode method
    /// cuz shardpreferences only accepts string
    cartList.forEach(((element) {
      element.time = time;
      cart.add(jsonEncode(element));
    }));
    sharedPrefs.setStringList(AppConstants.CART_LIST, cart);
  }

  List<CartModel> getCartList() {
    List<String> cart = [];
    if (sharedPrefs.containsKey(AppConstants.CART_LIST)) {
      cart = sharedPrefs.getStringList(AppConstants.CART_LIST)!;
    }
    List<CartModel> cartList = [];
    cart.forEach(((element) {
      cartList.add(CartModel.fromJson(jsonDecode(element)));
    }));
    return cartList;
  }

  List<CartModel> getCartHistoryList() {
    List<CartModel> cartHistoryItems = [];
    if (sharedPrefs.containsKey(AppConstants.CART_HISTORY_LIST)) {
      cartHistory = [];
      cartHistory = sharedPrefs.getStringList(AppConstants.CART_HISTORY_LIST)!;
    }
    for (var element in cartHistory) {
      cartHistoryItems.add(CartModel.fromJson(jsonDecode(element)));
    }
    return cartHistoryItems;
  }

  void addToCartHistoryList() {
    if (sharedPrefs.containsKey(AppConstants.CART_HISTORY_LIST)) {
      //cartHistory = [];
      cartHistory = sharedPrefs.getStringList(AppConstants.CART_HISTORY_LIST)!;
    }
    for (int i = 0; i < cart.length; i++) {
      cartHistory.add(cart[i]);
    }
    removeCart();
    sharedPrefs.setStringList(AppConstants.CART_HISTORY_LIST, cartHistory);
  }

  void removeCart() {
    cart = [];
    sharedPrefs.remove(AppConstants.CART_LIST);
  }

  void clearCartHistory() {
    removeCart();
    cartHistory = [];
    sharedPrefs.remove(AppConstants.CART_HISTORY_LIST);
  }

  void removeCartSharedPrefs(){
    sharedPrefs.remove(AppConstants.CART_LIST);
    sharedPrefs.remove(AppConstants.CART_HISTORY_LIST);
  }
}
 */