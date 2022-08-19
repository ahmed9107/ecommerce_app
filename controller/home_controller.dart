import 'package:get/get.dart';

class HomeController extends GetxController{

  int catIndex = 0;
  
  void changeCatIndex(int index){
    catIndex = index;
    update();
  }
}