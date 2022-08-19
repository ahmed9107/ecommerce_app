import 'package:get/get.dart';
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
        Container(
          height: Dimensions.height50,
          width: Dimensions.height50,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColorLight,
            borderRadius: BorderRadius.circular(Dimensions.height50/2)
          )
        ),
        SizedBox(width: Dimensions.width5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SmallText(text: 'Good Morning'),
            BigText(text: 'Morocco', color:Theme.of(context).primaryColorLight),
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
