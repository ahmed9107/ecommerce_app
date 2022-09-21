import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/data/repository/category_repo.dart';
import 'package:store_app/models/category_model.dart';
import 'package:store_app/utils/constants/status-request.dart';
import 'package:store_app/utils/functions/handling_data.dart';

class HomeController extends GetxController{
  final CategoryRepo categoryRepo;
  HomeController({required this.categoryRepo});

  int catIndex = 0;

  void changeCatIndex(int index){
    catIndex = index;
    update();
  }

  List<CategoryModel> _categoriesList = [];
  List<CategoryModel> get categoriesList => _categoriesList;
  StatusRequest statusRequest = StatusRequest.none;

  Future<void> getCategoriesList() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await categoryRepo.postData();
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if(response['status'] == 'success'){
        _categoriesList = [];
        response['categories'].forEach((v)=> _categoriesList.add(CategoryModel.fromJson(v)));
        update();
      } else {
        Get.snackbar('Faild', 'Faild to get data!',
          backgroundColor: Colors.red.withOpacity(0.5), colorText: Colors.white);
      }
    } else {}
  }
  @override
  Future<void> onInit() async {
    await getCategoriesList();
    super.onInit();
  }
}