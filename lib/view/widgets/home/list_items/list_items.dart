import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/products_controller.dart';
import 'package:store_app/routes/app_routes.dart';
import 'package:store_app/utils/constants/status-request.dart';
import 'package:store_app/view/widgets/custom_loader.dart';
import 'package:store_app/view/widgets/discount_item_container.dart';
import 'package:store_app/view/widgets/item_container.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class ListItems extends StatelessWidget {
  const ListItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductsController>(
      builder: (controller) {
        return controller.statusRequest == StatusRequest.loading
          ? const CustomLoader(size: 50)
          : GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 15.0,
              mainAxisExtent: MediaQuery.of(context).size.width * 0.74
            ),
            itemBuilder: (context, index) {
              return controller.productList[index].itemsDiscount == "0" 
              ? ItemContainer(
                onTapFavorite: (){
                  controller.changeFavoriteProduct(controller.productList[index].itemsId!);
                },
                icon: controller.favoritesProducts[controller.productList[index].itemsId!]!
                    ? EvaIcons.heart : EvaIcons.heartOutline,
                onTap: () {
                  Get.toNamed(AppRoute.getItemDetail(controller.productList[index].itemsId!, 'initial'));
                },
                product: controller.productList[index]
              )
              : DiscountItemContainer(
                onTapFavorite: (){
                  controller.changeFavoriteProduct(controller.productList[index].itemsId!);
                },
                icon: controller.favoritesProducts[controller.productList[index].itemsId!]!
                    ? EvaIcons.heart : EvaIcons.heartOutline,
                onTap: () {
                  Get.toNamed(AppRoute.getItemDetail(controller.productList[index].itemsId!, 'initial'));
                },
                bannerMsg: controller.productList[index].itemsDiscount!,
                product: controller.productList[index],
              );
            },
            itemCount: controller.productList.length
          );
      }
    );
  }
}
