import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/item_detail_widgets/bottom_nav_bar.dart';
import 'package:store_app/view/widgets/item_detail_widgets/item_detail_bar_icons.dart';
import 'package:store_app/view/widgets/item_detail_widgets/item_detail_info.dart';
import 'package:flutter/material.dart';

class ItemDetail extends StatelessWidget {
  final int pageId;
  final String page;
  const ItemDetail({Key? key, required this.pageId, required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    /* var product = Get.find<ProductController>().productList[pageId];
    Get.find<ProductController>().initProduct(product, Get.find<CartController>()); */
    return Scaffold(
      body: Stack(children: [
        Positioned(
          left: 0.0,
          right: 0.0,
          child: Container(
            width: double.infinity,
            height: Dimensions.itemdetailImgSize,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/products/10.png')
                //image: NetworkImage(AppConstants.BASE_URL + AppConstants.UPLOAD_URL + product.img!)
              )
            ),
          )
        ),
        ItemDetailAppBarIcons(page: page),
        ItemDetailsInfo(pageId: pageId, /* product: product */)
      ]),
      bottomNavigationBar: BottomNavBar(pageId: pageId, /* product: product */),
    );
  }
}
