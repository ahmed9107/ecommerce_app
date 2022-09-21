import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/products_controller.dart';
import 'package:store_app/routes/app_routes.dart';
import 'package:store_app/utils/constants/app_constants.dart';
import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/big_text.dart';
import 'package:store_app/view/widgets/small_text.dart';

class SpecialOffersPage extends StatelessWidget {
  const SpecialOffersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const BigText(text: 'Special offers'),
        elevation: 0.0,
        leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: Icon(Icons.arrow_back, color: Theme.of(context).primaryColorLight)),
      ),
      body: GetBuilder<ProductsController>(
        builder: (controller) {
          return Container(
            padding: EdgeInsets.all(Dimensions.width15),
            child: ListView.builder(
              itemCount: controller.discountProductList.length,
              itemBuilder: (context, index){
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoute.getItemDetail(
                      controller.discountProductList[index].itemsId!, 'specialOffers'));
                  },
                  child: Container(
                    height: Dimensions.pageViewContainer,
                    padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
                    margin: EdgeInsets.only(bottom: Dimensions.height20),
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
                                BigText(
                                  text: '${controller.discountProductList[index].itemsDiscount} %',
                                  size: Dimensions.font28, fontWeight: FontWeight.bold),
                                SizedBox(height: Dimensions.height15),
                                BigText(text: 'Today\'s Special!', size: Dimensions.font18),
                                SizedBox(height: Dimensions.height10),
                                SmallText(
                                  text: 'Get discount for every order, only valid for today',
                                  color: Theme.of(context).primaryColorLight,)
                              ],
                            ),
                          ),
                          Image.network(
                            AppConstants.BASE_URL + AppConstants.UPLOAD_URL + controller.discountProductList[index].itemsImages![0].image!,
                            width: Dimensions.screenWidth*0.38)
                        ],
                      ),
                    ),
                  ),
                );
              }
            ),
          );
        }
      ),
    );
  }
}