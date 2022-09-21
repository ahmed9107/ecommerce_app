import 'package:store_app/controller/products_controller.dart';
import 'package:store_app/models/product.dart';
import 'package:store_app/routes/app_routes.dart';
import 'package:store_app/utils/constants/app_constants.dart';
import 'package:store_app/utils/constants/status-request.dart';
import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/view/widgets/big_text.dart';
import 'package:store_app/view/widgets/custom_loader.dart';
import 'package:store_app/view/widgets/small_text.dart';

class CarouselItem extends StatelessWidget {
  final int position;
  final String page;
  final Product product;
  const CarouselItem(
      {Key? key,
      required this.position,
      required this.product,
      required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductsController>(builder: (controller) {
      return controller.statusRequest != StatusRequest.loading
        ? GestureDetector(
          onTap: () {
            Get.toNamed(AppRoute.getItemDetail(product.itemsId!, page));
          },
          child: Container(
            height: Dimensions.pageViewContainer,
            padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
            margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(Dimensions.radius10),
            ),
            child: Center(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigText(text: '${product.itemsDiscount} %', size: Dimensions.font28, fontWeight: FontWeight.bold),
                        SizedBox(height: Dimensions.height15),
                        BigText(text: 'Today\'s Special!', size: Dimensions.font18),
                        SizedBox(height: Dimensions.height10),
                        SmallText(
                          text: 'Get discount for every order, only valid for today',
                          color: Theme.of(context).primaryColorLight)
                      ],
                    ),
                  ),
                  Image.network(
                    AppConstants.BASE_URL + AppConstants.UPLOAD_URL + product.itemsImages![0].image!,
                    width: Dimensions.screenWidth*0.38)
                ],
              ),
            ),
          ),
        )
        : const CustomLoader(size: 20);
    });
  }
}
