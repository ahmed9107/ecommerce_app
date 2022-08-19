import 'package:store_app/routes/app_routes.dart';
import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/view/widgets/big_text.dart';
import 'package:store_app/view/widgets/small_text.dart';

class CarouselItem extends StatelessWidget {
  final int position;
  final String page;
  /* final Products product; */
  const CarouselItem(
      {Key? key,
      required this.position,
      /* required this.product, */
      required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return /* GetBuilder<ProductController>(builder: (controller) {
      return controller.isLoaded
          ?  */GestureDetector(
            onTap: () {
              Get.toNamed(AppRoute.getItemDetail(position, page));
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
                          BigText(text: '30 %', size: Dimensions.font28, fontWeight: FontWeight.bold),
                          SizedBox(height: Dimensions.height15),
                          BigText(text: 'Today\'s Special!', size: Dimensions.font18),
                          SizedBox(height: Dimensions.height10),
                          SmallText(
                            text: 'Get discount for every order, only valid for today',
                            color: Theme.of(context).primaryColorLight,)
                        ],
                      ),
                    ),
                    Image.asset('assets/images/products/6.png', width: Dimensions.screenWidth*0.38)
                  ],
                ),
              ),
            ),
          );
          /* : const CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ); */
    /* }); */
  }
}
