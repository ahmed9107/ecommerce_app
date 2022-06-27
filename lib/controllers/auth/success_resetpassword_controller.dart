import 'package:get/get.dart';
import '../../utils/constants/routes.dart';

class SuccessResetPassController extends GetxController {
  goToLoginPage() {
    Get.offAllNamed(AppRoute.login);
  }
}
