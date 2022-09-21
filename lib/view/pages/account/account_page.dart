import 'package:store_app/controller/auth_controllers/user_controller.dart';
import 'package:store_app/controller/layout_controller.dart';
import 'package:store_app/controller/location_controller.dart';
import 'package:store_app/routes/app_routes.dart';
import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/account_widgets/account_info_widget.dart';
import 'package:store_app/view/widgets/account_widgets/profile_image_section.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //bool userLoggedIn = Get.find<LoginController>().userLoggedIn();
    bool userLoggedIn = true;
    if(userLoggedIn){
      Get.find<UserController>().getUserInfo();
    }
    return Scaffold(
      /* appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: BigText(text: 'Profile', color: Theme.of(context).primaryColorLight),
        /* actions: [
          GetBuilder<LayoutController>(
            builder: (controller) {
              return InkWell(
                onTap: (){
                  controller.switchTheme();
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: Dimensions.height10),
                  padding: EdgeInsets.all(Dimensions.height10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius10),
                    color: Theme.of(context).backgroundColor,
                  ),
                  child: Icon(EvaIcons.moon, color: Theme.of(context).primaryColorLight),
                )
              );
            }
          ),
          SizedBox(width: Dimensions.width15)
        ], */
      ), */
      body: GetBuilder<UserController>(
        builder: (userController) {
          return /* userLoggedIn ?  */
            /* !userController.isLoaded
              ? */ Container(
                width: double.maxFinite,
                margin: EdgeInsets.only(top: Dimensions.height15),
                child: Column(
                  children: [
                    ProfileImageSection(
                      phone: userController.userPhone,
                      username: userController.userName,
                      email: userController.userEmail,
                    ),
                    //SizedBox(height: Dimensions.height20),
                    Container(
                      width: double.maxFinite,
                      height: 1.0,
                      color: Theme.of(context).backgroundColor
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            /* AccountInfoWidget(
                              icon: Icons.email,
                              text: userController.userEmail
                            ), */
                            InkWell(
                              onTap: (){
                                Get.toNamed(AppRoute.getEditProfilePage());
                              },
                              child: AccountInfoWidget(
                                icon: Icons.person,
                                text: 'edit'.tr
                              ),
                            ),
                            AccountInfoWidget(
                              icon: EvaIcons.globe2Outline,
                              text: 'languages'.tr
                            ),
                            GetBuilder<LocationController>(
                              builder: (locationController) {
                                if(userLoggedIn && locationController.adressList.isEmpty){
                                  return GestureDetector(
                                    onTap: () {
                                      Get.toNamed(AppRoute.getAddressPage());
                                    },
                                    child: AccountInfoWidget(
                                      icon: Icons.location_on,
                                      text: 'fillAddress'.tr
                                    ),
                                  );
                                } else {
                                  return GestureDetector(
                                    onTap: () {
                                      Get.toNamed(AppRoute.getAddressPage());
                                    },
                                    child: AccountInfoWidget(
                                      icon: Icons.location_on,
                                      text: 'address'.tr
                                    ),
                                  );
                                }
                              }
                            ),
                            GetBuilder<LayoutController>(
                              builder: (controller) {
                                return InkWell(
                                  onTap: (){
                                    controller.switchTheme();
                                  },
                                  child: AccountInfoWidget(
                                    icon: EvaIcons.moonOutline,
                                    text: 'darkMode'.tr
                                  ),
                                );
                              }
                            ),
                            AccountInfoWidget(
                              icon: Icons.message_outlined,
                              text: 'messages'.tr
                            ),
                            InkWell(
                              onTap: (){
                                Get.toNamed(AppRoute.getChatPage());
                              },
                              child: AccountInfoWidget(
                                icon: EvaIcons.questionMarkCircleOutline,
                                text: 'customerServ'.tr
                              ),
                            ),
                            AccountInfoWidget(
                              icon: EvaIcons.peopleOutline,
                              text: 'invitefriends'.tr
                            ),
                            GestureDetector(
                              onTap: (){
                                /* if(Get.find<LoginController>().userLoggedIn()) {
                                  Get.find<LoginController>().clearSharedData();
                                  Get.find<CartController>().clear();
                                  Get.find<CartController>().clearCartHistory();
                                  Get.find<LocationController>().clearAddressList();
                                  Get.offNamed(AppRoute.getLogin());
                                } else {
                                  Get.offNamed(AppRoute.getLogin());
                                } */
                              },
                              child: AccountInfoWidget(
                                textClr: const Color(0xFFFD3751),
                                iconClr: const Color(0xFFFD3751),
                                icon: Icons.logout,
                                text: 'logout'.tr)),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ); 
              /* : const CustomLoader(); */
        }
      ),
    );
  }
}