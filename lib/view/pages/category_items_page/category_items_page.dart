import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/products_controller.dart';
import 'package:store_app/routes/app_routes.dart';
import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/big_text.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:store_app/view/widgets/item_container.dart';

class CategoryItemsPage extends StatelessWidget {
  final String catId;
  const CategoryItemsPage({Key? key, required this.catId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const BigText(text: 'Shoes'),
        elevation: 0.0,
        leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: Icon(Icons.arrow_back, color: Theme.of(context).primaryColorLight)),
      ),
      body: GetBuilder<ProductsController>(
        builder: (controller) {
          //List<Product> categoryItems = controller.productList.where((item) => item.itemsCatId == catId).toList();
          return Container(
            padding: EdgeInsets.all(Dimensions.width15),
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
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
                    controller.changeFavoriteProduct(controller.productsPerCategories(catId)[index].itemsId!);
                  },
                  onTap: () {
                  Get.toNamed(
                    AppRoute.getItemDetail(controller.productsPerCategories(catId)[index].itemsId!,
                    'initial'));
                  },
                  icon: controller.favoritesProducts[controller.productsPerCategories(catId)[index].itemsId!]!
                    ? EvaIcons.heart : EvaIcons.heartOutline,
                  product: controller.productsPerCategories(catId)[index]
                );
              },
              itemCount: controller.productsPerCategories(catId).length,
            ),
          );
        }
      ),
    );
  }
}