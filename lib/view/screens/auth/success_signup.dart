import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/auth/success_signup_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../widgets/auth/custom_button_auth.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessSignUpController controller = Get.put(SuccessSignUpController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.appBackgroundColor,
        elevation: 0.0,
        title: Text('32'.tr,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey)),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          const Center(
              child: Icon(
            Icons.check_circle_outline,
            size: 200,
            color: AppColor.primaryColor,
          )),
          Text("37".tr,
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontSize: 30)),
          Text("38".tr),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: CustomButtonAuth(
                text: "31".tr,
                onPressed: () {
                  controller.goToLoginPage();
                }),
          ),
          const SizedBox(height: 30)
        ]),
      ),
    );
  }
}
