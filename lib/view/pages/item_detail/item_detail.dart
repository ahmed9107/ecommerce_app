import 'package:get/get.dart';
import 'package:store_app/controller/cart_controller.dart';
import 'package:store_app/controller/items_details_controller.dart';
import 'package:store_app/controller/products_controller.dart';
import 'package:store_app/utils/constants/app_constants.dart';
import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/dot_indicator.dart';
import 'package:store_app/view/widgets/item_detail_widgets/bottom_nav_bar.dart';
import 'package:store_app/view/widgets/item_detail_widgets/item_detail_bar_icons.dart';
import 'package:store_app/view/widgets/item_detail_widgets/item_detail_info.dart';
import 'package:flutter/material.dart';

class ItemDetail extends StatelessWidget {
  final String pageId;
  final String page;
  const ItemDetail({Key? key, required this.pageId, required this.page})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<ProductsController>().productsMap[pageId];
    Get.find<ProductsController>().initProduct(product!, Get.find<CartController>());
    return Scaffold(
      body: Stack(children: [
        Positioned(
          top: 25,
          left: 0.0,
          right: 0.0,
          child: GetBuilder<ItemsDetailController>(
            builder: (controller) {
              return Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height *0.33,
                    child: PageView.builder(
                      controller: controller.pageController,
                      itemCount: product.itemsImages!.length,
                      itemBuilder: (context, index) => Container(
                        width: double.infinity,
                        height: Dimensions.itemdetailImgSize,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(AppConstants.BASE_URL + AppConstants.UPLOAD_URL + product.itemsImages![index].image!)
                          )
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height *0.32,
                    child: DotsIndicator(
                      currentPage: controller.currentPageValue,
                      dotsNumber: product.itemsImages!.length <= 1
                        ? 1
                        : product.itemsImages!.length
                    ),
                  )
                ],
              );
            }
          )
        ),
        ItemDetailAppBarIcons(page: page),
        ItemDetailsInfo(pageId: pageId, product: product)
      ]),
      bottomNavigationBar: BottomNavBar(pageId: pageId, product: product),
    );
  }
}
