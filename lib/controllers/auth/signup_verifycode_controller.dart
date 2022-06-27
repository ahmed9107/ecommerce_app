import 'package:get/get.dart';
import '../../utils/constants/routes.dart';

class SignUpVerifyCodeController extends GetxController {
  late String verifyCode;

  checkEmail() {}

  goToSuccessSignUp() {
    Get.offNamed(AppRoute.successSignUp);
  }
}
