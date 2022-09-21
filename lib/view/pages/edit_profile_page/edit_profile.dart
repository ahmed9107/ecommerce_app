import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/auth_controllers/edit_profile_controller.dart';
import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/big_text.dart';
import 'package:store_app/view/widgets/custom_input_field.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        title: const BigText(text: 'Edit Profile'),
        leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: Icon(Icons.arrow_back, color: Theme.of(context).primaryColorLight)),
      ),
      body: GetBuilder<EditProfileController>(
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: Dimensions.height120,
                      width: Dimensions.height120,
                      margin: const EdgeInsets.symmetric(vertical: 25),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.height120 / 2), color: Colors.grey),
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: Dimensions.iconSize24*3),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: Dimensions.height30,
                        width: Dimensions.height30,
                        margin: const EdgeInsets.symmetric(vertical: 25),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.height30 / 2),
                          color: const Color(0xFF256294)),
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: Dimensions.iconSize20),
                      ),
                    )
                  ],
                ),
                CustomInputField(
                  type: TextInputType.emailAddress,
                  hint: 'Enter your Name',
                  controller: controller.username,
                  bgColor: Theme.of(context).backgroundColor,
                  suffixIcon: EvaIcons.person,
                ),
                CustomInputField(
                  type: TextInputType.emailAddress,
                  hint: 'Enter your Email',
                  controller: controller.email,
                  bgColor: Theme.of(context).backgroundColor,
                  suffixIcon: EvaIcons.emailOutline,
                ),
                CustomInputField(
                  type: TextInputType.emailAddress,
                  hint: 'Phone number',
                  controller: controller.phone,
                  bgColor: Theme.of(context).backgroundColor,
                  suffixIcon: EvaIcons.phone,
                ),
                /* CustomInputField(
                  type: TextInputType.emailAddress,
                  hint: 'Enter your Country',
                  controller: controller.country,
                  bgColor: Theme.of(context).backgroundColor,
                  suffixIcon: EvaIcons.globe2Outline,
                ),
                CustomInputField(
                  type: TextInputType.emailAddress,
                  hint: 'Gender',
                  controller: controller.username,
                  bgColor: Theme.of(context).backgroundColor,
                  suffixIcon: EvaIcons.person,
                ), */
              ],
            ),
          );
        }
      ),
    );
  }
}