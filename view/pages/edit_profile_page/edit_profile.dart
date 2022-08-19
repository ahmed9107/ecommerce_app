import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/auth_controllers/edit_profile_controller.dart';
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
          return Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomInputField(
                    type: TextInputType.emailAddress,
                    //title: 'Email',
                    hint: 'Enter your Name',
                    controller: controller.username,
                    bgColor: Theme.of(context).backgroundColor,
                    suffixIcon: EvaIcons.person,
                  ),
                  CustomInputField(
                    type: TextInputType.emailAddress,
                    //title: 'Email',
                    hint: 'Enter your Date of birth',
                    controller: controller.birthday,
                    bgColor: Theme.of(context).backgroundColor,
                    suffixIcon: EvaIcons.calendarOutline,
                  ),
                  CustomInputField(
                    type: TextInputType.emailAddress,
                    //title: 'Email',
                    hint: 'Phone number',
                    controller: controller.phone,
                    bgColor: Theme.of(context).backgroundColor,
                    suffixIcon: EvaIcons.phone,
                  ),
                  CustomInputField(
                    type: TextInputType.emailAddress,
                    //title: 'Email',
                    hint: 'Enter your Country',
                    controller: controller.country,
                    bgColor: Theme.of(context).backgroundColor,
                    suffixIcon: EvaIcons.globe2Outline,
                  ),
                  CustomInputField(
                    type: TextInputType.emailAddress,
                    //title: 'Email',
                    hint: 'Gender',
                    controller: controller.username,
                    bgColor: Theme.of(context).backgroundColor,
                    suffixIcon: EvaIcons.person,
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}