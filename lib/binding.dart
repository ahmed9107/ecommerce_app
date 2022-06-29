import 'package:get/get.dart';

import 'controllers/auth/signup_verifycode_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpVerifyCodeController(), fenix: true);
  }
}
