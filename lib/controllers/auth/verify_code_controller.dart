import 'package:get/get.dart';
import '../../utils/constants/routes.dart';

class VerifyCodeController extends GetxController {
  late String verifyCode;

  checkEmail() {}

  goToResetPassPage() {
    Get.offNamed(AppRoute.resetPassword);
  }
}
