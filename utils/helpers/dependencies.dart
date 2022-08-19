import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/controller/auth_controllers/edit_profile_controller.dart';
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
import 'package:store_app/data/api/api_client.dart';
import 'package:store_app/data/api/api_http_clt.dart';
import 'package:store_app/data/repository/auth/check_email_repo.dart';
import 'package:store_app/data/repository/auth/forgetpass_verify_repo.dart';
import 'package:store_app/data/repository/auth/resetpass_repo.dart';
import 'package:store_app/data/repository/auth/verifycode_repo.dart';
import 'package:store_app/data/repository/auth_repo.dart';
import 'package:store_app/data/repository/location_repo.dart';
import 'package:store_app/data/repository/auth/signup_repo.dart';
import 'package:store_app/data/repository/auth/login_repo.dart';
import 'package:store_app/data/repository/user_repo.dart';
import 'package:get/get.dart';
import 'package:store_app/utils/constants/app_constants.dart';
import 'package:store_app/utils/localisation/change_local.dart';

class InitialBindings extends Bindings{
  @override
  Future<void> dependencies() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    Get.lazyPut(() => sharedPrefs, fenix: true);
    
    // ApiClient
    Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL, sharedPrefs: Get.find()), fenix: true);
    Get.lazyPut(() => ApiHttpClient(), fenix: true);

    // Repository
    Get.lazyPut(() => SignUpRepo(apiHttpClient: Get.find()), fenix: true);
    Get.lazyPut(() => LoginRepo(apiHttpClient: Get.find()), fenix: true);
    Get.lazyPut(() => VerifyCodeRepo(apiHttpClient: Get.find()), fenix: true);
    Get.lazyPut(() => CheckEmailRepo(apiHttpClient: Get.find()), fenix: true);
    Get.lazyPut(() => ForgetPassVerifyRepo(apiHttpClient: Get.find()), fenix: true);
    Get.lazyPut(() => ResetPassRepo(apiHttpClient: Get.find()), fenix: true);

    ///=============================================================================
    Get.lazyPut(() => LocationRepo(apiClient: Get.find(), sharedPrefs: Get.find()), fenix: true);
    Get.lazyPut(() => AuthRepo(apiClient: Get.find(), sharedPref: Get.find()), fenix: true);
    Get.lazyPut(() => UserRepo(apiClient: Get.find()), fenix: true);

    // Controllers
    Get.lazyPut(() => LocaleController(sharedPref: Get.find()), fenix: true);
    Get.lazyPut(() => SignUpController(signUpRepo: Get.find()), fenix: true);
    Get.lazyPut(() => SignUpVerifyCodeController(verifyCodeRepo: Get.find()), fenix: true);
    Get.lazyPut(() => ForgetPassController(checkEmailRepo: Get.find()), fenix: true);
    Get.lazyPut(() => ResetPasswordController(resetPassRepo: Get.find()), fenix: true);
    Get.lazyPut(() => VerifyCodeController(forgetPassVerifyRepo: Get.find()), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => EditProfileController(), fenix: true);
    Get.lazyPut(() => LayoutController(sharedPref: Get.find()), fenix: true);
    Get.lazyPut(() => OnBoardingController(sharedPref: Get.find()));
    Get.lazyPut(() => UserController(userRepo: Get.find()), fenix: true);
    Get.lazyPut(() => LoginController(loginRepo: Get.find()), fenix: true);
    Get.lazyPut(() => LocationController(locationRepo: Get.find()), fenix: true);
  }
}