import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:store_app/routes/app_routes.dart';
import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/app_icon.dart';
import 'package:store_app/view/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/products_controller.dart';

class ItemDetailAppBarIcons extends StatelessWidget {
  final String page;
  const ItemDetailAppBarIcons({Key? key, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: Dimensions.height45,
      left: Dimensions.width20,
      right: Dimensions.width20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              if (page == 'cart-page') {
                Get.toNamed(AppRoute.getCart());
              } else {
                Get.toNamed(AppRoute.getInitial());
              }
            },
            child: AppIcon(
              icon: Icons.arrow_back_ios,
              backgroundClr: const Color(0xFFfcf4e4).withOpacity(0.25)),
          ),
          GetBuilder<ProductsController>(builder: (controller) {
            return GestureDetector(
              onTap: () {
                if (controller.getTotalItemsInCart >= 1) {
                  Get.toNamed(AppRoute.getCart());
                }
              },
              child: Stack(
                children: [
                  AppIcon(
                    icon: EvaIcons.shoppingCartOutline,
                    backgroundClr: const Color(0xFFfcf4e4).withOpacity(0.25)),
                  controller.getTotalItemsInCart >= 1
                  ? Positioned(
                      right: 0,
                      top: 0,
                      child: AppIcon(
                        size: 22,
                        icon: Icons.circle,
                        iconClr: Theme.of(context).primaryColorLight,
                        backgroundClr: Theme.of(context).primaryColorLight),
                      )
                  : Container(),
                  controller.getTotalItemsInCart >= 1
                  ? Positioned(
                      right: 5,
                      top: 5,
                      child: BigText(
                        text: '${controller.getTotalItemsInCart}',
                        color: Colors.white,
                        size: 12),
                      )
                  : Container()
                ],
              ),
            );
          }),
        ],
      ));
  }
}
