import 'package:get/get.dart';
import 'package:store_app/controller/auth_controllers/user_controller.dart';
import 'package:store_app/routes/app_routes.dart';
import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/big_text.dart';
import 'package:store_app/view/widgets/small_text.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class NotificationFieldSection extends StatelessWidget {
  const NotificationFieldSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Image.asset(
            'assets/images/photo1.jpg',
            height: 38,
            width: 38,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: Dimensions.width5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SmallText(text: 'Good Morning'),
            GetBuilder<UserController>(
              builder: (controller) {
                return BigText(
                  text: controller.userName,
                  color:Theme.of(context).primaryColorLight);
              }
            ),
          ],
        ),
        const Spacer(),
        InkWell(
          onTap: (){
            Get.toNamed(AppRoute.getNotificationPage());
          },
          child: Icon(EvaIcons.bellOutline, color:Theme.of(context).primaryColorLight)),
        SizedBox(width: Dimensions.width15),
        InkWell(
          onTap: (){
            Get.toNamed(AppRoute.getWishListPage());
          },
          child: Icon(EvaIcons.heartOutline, color:Theme.of(context).primaryColorLight)),
        SizedBox(width: Dimensions.width5),
      ],
    );
  }
}
