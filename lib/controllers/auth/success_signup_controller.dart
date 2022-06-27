import 'package:get/get.dart';
import '../../utils/constants/routes.dart';

class SuccessSignUpController extends GetxController {
  goToLoginPage() {
    Get.offAllNamed(AppRoute.login);
  }
}
