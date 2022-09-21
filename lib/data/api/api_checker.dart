/* import 'package:store_app/routes/app_routes.dart';
import 'package:get/get.dart';

class ApiChecker{
  static void checkApi(Response response){
    /// 401 error: user dont login or authorization problem
    if(response.statusCode == 401){
      Get.offNamed(AppRoute.getLogin());
    }else{
      Get.snackbar('Error!', response.statusText!);
    }
  }
} */