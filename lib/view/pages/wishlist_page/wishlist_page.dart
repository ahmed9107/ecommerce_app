import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/products_controller.dart';
import 'package:store_app/routes/app_routes.dart';
import 'package:store_app/utils/constants/status-request.dart';
import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/big_text.dart';
import 'package:store_app/view/widgets/custom_loader.dart';
import 'package:store_app/view/widgets/item_container.dart';

class WishlistPagePage extends StatelessWidget {
  const WishlistPagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        title: const BigText(text: 'My Wishlist'),
        leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: Icon(Icons.arrow_back, color: Theme.of(context).primaryColorLight)),
      ),
      body: GetBuilder<ProductsController>(
        builder: (controller) {
          return controller.statusRequest == StatusRequest.loading
          ? const CustomLoader(size: 50)
          : Container(
            padding: EdgeInsets.all(Dimensions.width15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  /* const CustomButtonList(),
                  SizedBox(height: Dimensions.height10), */
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 15.0,
                      mainAxisExtent: MediaQuery.of(context).size.width * 0.74
                    ),
                    itemBuilder: (context, index) {
                      return ItemContainer(
                        onTapFavorite: (){
                          controller.changeFavoriteProduct(controller.favoritesItems[index].itemsId!);
                        },
                        onTap: () {
                        Get.toNamed(
                          AppRoute.getItemDetail(controller.favoritesItems[index].itemsId!,
                          'initial'));
                        },
                        icon: controller.favoritesProducts[controller.favoritesItems[index].itemsId!]!
                          ? EvaIcons.heart : EvaIcons.heartOutline,
                        product: controller.favoritesItems[index]
                      );
                    },
                    itemCount: controller.favoritesItems.length,
                  )
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}