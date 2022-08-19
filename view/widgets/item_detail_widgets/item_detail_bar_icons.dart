import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:store_app/routes/app_routes.dart';
import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/app_icon.dart';
import 'package:store_app/view/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              backgroundClr: const Color(0xFFfcf4e4).withOpacity(0.5)
            ),
          ),
          SizedBox(width: Dimensions.width160),
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRoute.getChatPage());
            },
            child: AppIcon(
              icon: EvaIcons.messageCircleOutline,
              backgroundClr: const Color(0xFFfcf4e4).withOpacity(0.5)),
          ),
          /* GetBuilder<ProductController>(builder: (controller) {
            return  */
            GestureDetector(
              onTap: () {
                /* if (controller.getTotalItemsInCart >= 1) {
                  Get.toNamed(AppRoute.getCart());
                } */
              },
              child: Stack(
                children: [
                  AppIcon(
                    icon: Icons.shopping_cart_outlined,
                    backgroundClr: const Color(0xFFfcf4e4).withOpacity(0.5)),
                  /* controller.getTotalItemsInCart >= 1
                    ? */ Positioned(
                        right: 0,
                        top: 0,
                        child: AppIcon(
                          size: 22,
                          icon: Icons.circle,
                          iconClr: Theme.of(context).primaryColor,
                          backgroundClr: Theme.of(context).primaryColor),
                      ),
                    /* : Container(), */
                  /* controller.getTotalItemsInCart >= 1
                      ?  */Positioned(
                          right: 5,
                          top: 5,
                          child: BigText(
                              text: '10', //'${controller.getTotalItemsInCart}',
                              color: Theme.of(context).scaffoldBackgroundColor,
                              size: 12),
                        )
                      /* : Container() */
                ],
              ),
            )
          /* }), */
        ],
      )
    );
  }
}
