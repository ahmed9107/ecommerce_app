import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/controller/auth_controllers/edit_profile_controller.dart';
import 'package:store_app/controller/items_details_controller.dart';
import 'package:store_app/controller/order_controller.dart';
import 'package:store_app/controller/products_controller.dart';
import 'package:store_app/controller/forget_password/forget_pass_controller.dart';
import 'package:store_app/controller/forget_password/forgetpass_verify_code_controller.dart';
import 'package:store_app/controller/auth_controllers/login_controller.dart';
import 'package:store_app/controller/forget_password/reset_pass_controller.dart';
import 'package:store_app/controller/auth_controllers/signup_controller.dart';
import 'package:store_app/controller/auth_controllers/signup_verifycode_controller.dart';
import 'package:store_app/controller/auth_controllers/user_controller.dart';
import 'package:store_app/controller/home_controller.dart';
import 'package:store_app/controller/layout_controller.dart';
import 'package:store_app/controller/location_controller.dart';
import 'package:store_app/controller/onboarding_controller.dart';
import 'package:store_app/controller/search_controller.dart';
import 'package:store_app/data/api/api_client.dart';
import 'package:store_app/data/repository/auth/check_email_repo.dart';
import 'package:store_app/data/repository/auth/forgetpass_verify_repo.dart';
import 'package:store_app/data/repository/auth/resetpass_repo.dart';
import 'package:store_app/data/repository/auth/verifycode_repo.dart';
import 'package:store_app/data/repository/category_repo.dart';
import 'package:store_app/data/repository/location_repo.dart';
import 'package:store_app/data/repository/order_repo.dart';
import 'package:store_app/data/repository/product_repo.dart';
import 'package:store_app/data/repository/auth/signup_repo.dart';
import 'package:store_app/data/repository/auth/login_repo.dart';
import 'package:store_app/data/repository/search_repo.dart';
import 'package:store_app/utils/constants/app_constants.dart';
import 'package:store_app/utils/localisation/change_local.dart';
import 'package:store_app/controller/cart_controller.dart';
import 'package:store_app/data/repository/cart_repo.dart';
import 'package:store_app/data/api/api_client_get.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings{
  @override
  Future<void> dependencies() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    Get.lazyPut(() => sharedPrefs, fenix: true);
    
    // ApiClient
    Get.lazyPut(() => ApiClientGet(appBaseUrl: AppConstants.BASE_URL, sharedPrefs: Get.find()), fenix: true);
    Get.lazyPut(() => ApiClient(), fenix: true);

    // Repository
    Get.lazyPut(() => SignUpRepo(apiClient: Get.find()), fenix: true);
    Get.lazyPut(() => LoginRepo(apiClient: Get.find()), fenix: true);
    Get.lazyPut(() => VerifyCodeRepo(apiClient: Get.find()), fenix: true);
    Get.lazyPut(() => CheckEmailRepo(apiClient: Get.find()), fenix: true);
    Get.lazyPut(() => ForgetPassVerifyRepo(apiClient: Get.find()), fenix: true);
    Get.lazyPut(() => ResetPassRepo(apiClient: Get.find()), fenix: true);
    Get.lazyPut(() => ProductsRepo(apiClient: Get.find()), fenix: true);
    Get.lazyPut(() => CategoryRepo(apiClient: Get.find()), fenix: true);
    Get.lazyPut(() => CartRepo(sharedPrefs: Get.find()), fenix: true);
    Get.lazyPut(() => SearchRepo(apiClient: Get.find()), fenix: true);
    Get.lazyPut(() => OrderRepo(apiClient: Get.find()), fenix: true);

    ///=============================================================================
    Get.lazyPut(() => LocationRepo(apiClient: Get.find(), sharedPrefs: Get.find()), fenix: true);
    //Get.lazyPut(() => AuthRepo(apiClient: Get.find(), sharedPref: Get.find()), fenix: true);
    //Get.lazyPut(() => UserRepo(apiClient: Get.find()), fenix: true);

    // Controllers
    Get.lazyPut(() => LocaleController(sharedPref: Get.find()), fenix: true);
    Get.lazyPut(() => SignUpController(signUpRepo: Get.find()), fenix: true);
    Get.lazyPut(() => SignUpVerifyCodeController(verifyCodeRepo: Get.find()), fenix: true);
    Get.lazyPut(() => ForgetPassController(checkEmailRepo: Get.find()), fenix: true);
    Get.lazyPut(() => ResetPasswordController(resetPassRepo: Get.find()), fenix: true);
    Get.lazyPut(() => ProductsController(productRepo: Get.find(), sharedPref: Get.find()), fenix: true);
    Get.lazyPut(() => CartController(cartRepo: Get.find()), fenix: true);
    Get.lazyPut(() => VerifyCodeController(forgetPassVerifyRepo: Get.find()), fenix: true);
    Get.lazyPut(() => HomeController(categoryRepo: Get.find()), fenix: true);
    Get.lazyPut(() => ItemsDetailController(), fenix: true);
    Get.lazyPut(() => EditProfileController(), fenix: true);
    Get.lazyPut(() => LayoutController(sharedPref: Get.find()), fenix: true);
    Get.lazyPut(() => OnBoardingController(sharedPref: Get.find()));
    Get.lazyPut(() => UserController(sharedPref: Get.find()), fenix: true);
    Get.lazyPut(() => LoginController(sharedPref: Get.find(), loginRepo: Get.find()), fenix: true);
    Get.lazyPut(() => LocationController(sharedPref: Get.find(), locationRepo: Get.find()), fenix: true);
    Get.lazyPut(() => SearchController(searchRepo: Get.find()), fenix: true);
    Get.lazyPut(() => OrderController(orderRepo: Get.find()), fenix: true);
  }
}