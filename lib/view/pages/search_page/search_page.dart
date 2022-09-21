import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_app/controller/products_controller.dart';
import 'package:store_app/controller/search_controller.dart';
import 'package:store_app/models/product.dart';
import 'package:store_app/routes/app_routes.dart';
import 'package:store_app/utils/constants/colors.dart';
import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/discount_item_container.dart';
import 'package:store_app/view/widgets/item_container.dart';
import 'package:store_app/view/widgets/no_data_page.dart';
import 'package:store_app/view/widgets/sort_and_filter_bottom_sheet.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController patternController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: Icon(Icons.arrow_back, color: Theme.of(context).primaryColorLight)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: InkWell(
              onTap: ()=> showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (_)=> const SortAndFilterBottomSheet()
              ),
              child: Icon(
                EvaIcons.options2Outline ,
                color: Colors.grey, size: Dimensions.iconSize20)),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(Dimensions.width15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.height10, vertical: Dimensions.height10/2),
                width: double.maxFinite,
                height: Dimensions.height50*1.1,
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.circular(Dimensions.radius10)
                ),
                child: Center(
                  child: GetBuilder<ProductsController>(
                    builder: (controller) {
                      return TypeAheadField(
                        //hideSuggestionsOnKeyboardHide: false,
                        textFieldConfiguration: TextFieldConfiguration(
                          controller: patternController,
                          textInputAction: TextInputAction.search,
                          autofocus: true,
                          textCapitalization: TextCapitalization.words,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            icon: Icon(
                              EvaIcons.searchOutline,
                              color: Colors.grey, size: Dimensions.iconSize16*1.1),
                            hintText: 'Search Product',
                            hintStyle: GoogleFonts.roboto(
                              color: AppColor.grey, fontSize: 12.0, height: 1.5),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(Dimensions.radius5),
                              borderSide: const BorderSide(
                                style: BorderStyle.none, width: 0
                              )
                            )
                          )
                        ),
                        itemBuilder: (BuildContext context, Product suggestion) {
                          return Padding(
                            padding: EdgeInsets.all(Dimensions.width10),
                            child: Row(
                              children: [
                                const Icon(EvaIcons.search),
                                Expanded(
                                  child: Text(
                                    suggestion.itemsName!,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context).textTheme.headline2?.copyWith(
                                      color: Theme.of(context).textTheme.bodyText1!.color,
                                      fontSize: Dimensions.font18
                                    )
                                  )
                                ),
                              ],
                            ),
                          );
                        },
                        onSuggestionSelected: (Product suggestion) {
                          //Get.find<SearchController>().setProduct(suggestion.itemsName!);
                          Get.toNamed(AppRoute.getItemDetail(suggestion.itemsId!, 'search'));
                        },
                        suggestionsCallback: (String pattern) async {
                          return await Get.find<SearchController>().searchProduct(context, pattern);
                        },
                      );
                    }
                  ),
                ),
              ),
              SizedBox(height: Dimensions.height10),
              GetBuilder<SearchController>(
                builder: (controller) {
                  return controller.predictionProductsList.isNotEmpty ? GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 15.0,
                      mainAxisExtent: MediaQuery.of(context).size.width * 0.74
                    ),
                    itemCount: controller.predictionProductsList.length,
                    itemBuilder: (context, index) {
                      return controller.predictionProductsList[index].itemsDiscount == "0" 
                      ? ItemContainer(
                        onTapFavorite: (){
                          Get.find<ProductsController>().changeFavoriteProduct(controller.predictionProductsList[index].itemsId!);
                        },
                        icon: Get.find<ProductsController>().favoritesProducts[controller.predictionProductsList[index].itemsId!]!
                          ? EvaIcons.heart : EvaIcons.heartOutline,
                        onTap: () {
                          Get.toNamed(AppRoute.getItemDetail(controller.predictionProductsList[index].itemsId!, 'initial'));
                        },
                        product: controller.predictionProductsList[index]
                      )
                      : DiscountItemContainer(
                        onTapFavorite: (){
                          Get.find<ProductsController>().changeFavoriteProduct(controller.predictionProductsList[index].itemsId!);
                        },
                        icon: Get.find<ProductsController>().favoritesProducts[controller.predictionProductsList[index].itemsId!]!
                          ? EvaIcons.heart : EvaIcons.heartOutline,
                        onTap: () {
                          Get.toNamed(AppRoute.getItemDetail(controller.predictionProductsList[index].itemsId!, 'initial'));
                        },
                        bannerMsg: controller.predictionProductsList[index].itemsDiscount!,
                        product: controller.predictionProductsList[index],
                      );
                    },
                  ): const NoDataPage(text: 'Not found!');
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}