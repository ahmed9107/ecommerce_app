import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/data/repository/search_repo.dart';
import 'package:store_app/models/product.dart';
import 'package:store_app/utils/constants/status-request.dart';
import 'package:store_app/utils/functions/handling_data.dart';

class SearchController extends GetxController{
  final SearchRepo searchRepo;

  SearchController({required this.searchRepo});

  StatusRequest statusRequest = StatusRequest.none;

  Product? productSearched;
  List<Product> _predictionProductsList = [];
  List<Product> get predictionProductsList => _predictionProductsList;

  Future<List<Product>> searchProduct(BuildContext context, String pattern) async {
    if(pattern.isNotEmpty){
      var response = await searchRepo.searchProducts(pattern);
      statusRequest = handlingData(response);
      if(statusRequest == StatusRequest.success){
        if(response["status"] == 'success'){
          _predictionProductsList = [];
          response['data'].forEach((prediction)
            => _predictionProductsList.add(Product.fromJson(prediction)));
        }else{
          _predictionProductsList = [];
        }
      }else{
        Get.snackbar('Faild', 'Oops! Somthing went wrong!!!!',
          backgroundColor: Colors.red.withOpacity(0.5), colorText: Colors.white);
      }
      update();
    }
    return _predictionProductsList;
  }

  /* setProduct(String pattern) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await searchRepo.setProduct(pattern);
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response["status"] == 'success'){
        _predictionProductsList = [];
        response['data'].forEach((prediction)
          => _predictionProductsList.add(Product.fromJson(prediction)));
      }
    }else{
      Get.snackbar('Faild', 'Oops! Somthing went wrong!!!! From Set Product',
        backgroundColor: Colors.red.withOpacity(0.5), colorText: Colors.white);
    }
    /* productSearched = Product.fromJson(response['data']);
    statusRequest = StatusRequest.success; */
    update();
  } */
}