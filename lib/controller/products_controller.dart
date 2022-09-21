import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/data/repository/product_repo.dart';
import 'package:store_app/models/product.dart';
import 'package:store_app/utils/constants/status-request.dart';
import 'package:store_app/utils/functions/handling_data.dart';

import '../utils/constants/colors.dart';
import 'cart_controller.dart';

class ProductsController extends GetxController{
  final ProductsRepo productRepo;
  final SharedPreferences sharedPref;
  ProductsController({required this.sharedPref, required this.productRepo});

  List<Product> _productList = [];
  List<Product> get productList => _productList;
  List<Product> _discountProductList = [];
  List<Product> get discountProductList => _discountProductList;
  List<Product> _favoritesItems = [];
  List<Product> get favoritesItems => _favoritesItems;
  Map<String, Product> productsMap = {};
  Map<String, bool> favoritesProducts = {};

  StatusRequest statusRequest = StatusRequest.none;

  Future<void> getProductList() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await productRepo.postData();
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if(response['status'] == 'success'){
        _productList = [];
        _discountProductList = [];
        response['products'].forEach((v)=> _productList.add(Product.fromJson(v)));
        response['discountProducts'].forEach((v)=> _discountProductList.add(Product.fromJson(v)));
        for(var i=0; i<_productList.length; i++){
          productsMap[_productList[i].itemsId!] = _productList[i];
        }
        update();
      } else {
        Get.snackbar('Faild', 'Faild to get data!',
          backgroundColor: Colors.red.withOpacity(0.5), colorText: Colors.white);
      }
    } else {}
  }

  Future<void> getFavoriteProduct() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await productRepo.getFavoritesProducts(sharedPref.getString('id')!);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if(response['status'] == 'success'){
        List<String> productsIds = [];
        _favoritesItems = [];
        response['data'].forEach((v)=> productsIds.add(v['favorites_item_id']));
        for(var i=0; i<_productList.length; i++){
          favoritesProducts[_productList[i].itemsId!] = productsIds.contains(_productList[i].itemsId!);
          if(productsIds.contains(_productList[i].itemsId!)){
            _favoritesItems.add(_productList[i]);
          }
        }
        update();
      } else {
        Get.snackbar(
          'Failed',
          'Failed to get data!',
          backgroundColor: Colors.red.withOpacity(0.5),
          colorText: Colors.white
        );
      }
    } else {}
  }

  Future<void> changeFavoriteProduct(String productId) async {
    favoritesProducts[productId] = !favoritesProducts[productId]!;
    update();
    var response = await productRepo.changeFavoritesProducts(sharedPref.getString('id')!, productId);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if(response['status'] == 'success'){
        await getFavoriteProduct();
        update();
      } else {
        favoritesProducts[productId] = !favoritesProducts[productId]!;
        Get.snackbar(
          'Failed',
          'Failed to get data!',
          backgroundColor: Colors.red.withOpacity(0.5),
          colorText: Colors.white
        );
      }
    } else {}
  }

  int _quantity = 0;
  int get quantity => _quantity;
  int _cartItems = 0;
  int get cartItems => _cartItems + _quantity;
  late CartController _cart;

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if ((_cartItems + quantity) < 0) {
      Get.snackbar('Item count', 'You can\'t reduce more',
          backgroundColor: AppColor.primaryColor, colorText: Colors.white);
      if (_cartItems > 0) {
        _quantity = -_cartItems;
        return _quantity;
      }
      return 0;
    } else if ((_cartItems + quantity) > 25) {
      Get.snackbar(
        'Item count',
        'You can\'t add more',
        backgroundColor: AppColor.primaryColor,
        colorText: Colors.white
      );
      return 25;
    } else {
      return quantity;
    }
  }

  void initProduct(Product product, CartController cart) {
    _quantity = 0;
    _cartItems = 0;
    _cart = cart;

    /// Check if the product is exist in the cart or not
    bool isExist = false;
    isExist = _cart.existInCart(product);

    /// Get the product in the cart if exist
    if (isExist) {
      _cartItems = _cart.getQuantityIfExist(product);
    }
  }

  void addItem(Product product) {
    _cart.addItem(product, _quantity);
    _quantity = 0;
    _cartItems = _cart.getQuantityIfExist(product);
    update();
  }

  int get getTotalItemsInCart {
    return _cart.totalItemsInCart;
  }

  List<Product> productsPerCategories(String catId) {
    return productList.where((item) => item.itemsCatId == catId).toList();
  }

  @override
  Future<void> onInit() async {
    await getProductList();
    await getFavoriteProduct();
    super.onInit();
  }
}