import 'package:store_app/routes/app_routes.dart';
import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/big_text.dart';
import 'package:store_app/view/widgets/cart_history/cart_history_body.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.maxFinite,
          color: Theme.of(context).backgroundColor,
          padding: EdgeInsets.only(
            top: Dimensions.height50,
            bottom: Dimensions.height15,
            left: Dimensions.height15,
            right: Dimensions.height15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BigText(text: 'Cart History', color: Theme.of(context).primaryColorLight),
              InkWell(
                onTap: (){Get.toNamed(AppRoute.getCart());},
                child: Container(
                  padding: EdgeInsets.all(Dimensions.height10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius10),
                    color: Theme.of(context).backgroundColor
                  ),
                  child: Icon(EvaIcons.shoppingCart, color: Theme.of(context).primaryColorLight),
                ),
              )
            ],
          ),
        ),
        const CartHistoryBody()
      ],
    );
  }
}
