/* import 'package:store_app/routes/app_routes.dart';
import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/view/widgets/big_text.dart';

class CartMenuBarWidget extends StatelessWidget {
  const CartMenuBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: Dimensions.height40,
        left: Dimensions.width15,
        right: Dimensions.width15,
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoute.getInitial());
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: Dimensions.height10),
                padding: EdgeInsets.all(Dimensions.height10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius10),
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                child: Icon(Icons.arrow_back_ios,
                color: Theme.of(context).primaryColor,size: Dimensions.height30,)
              )
            ),
            SizedBox(width: Dimensions.width10),
            const BigText(text: 'My Cart')
            /* SizedBox(width: Dimensions.width160),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoute.getInitial());
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: Dimensions.height10),
                  padding: EdgeInsets.all(Dimensions.height10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius10),
                    color: Theme.of(context).backgroundColor,
                  ),
                  child: Icon(Icons.home_outlined, color: Theme.of(context).primaryColor,size: Dimensions.height30,)
              )
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: Dimensions.height10),
              padding: EdgeInsets.all(Dimensions.height10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius10),
                color: Theme.of(context).backgroundColor,
              ),
              child: Icon(Icons.shopping_cart_outlined, color: Theme.of(context).primaryColor,size: Dimensions.height30,)
            ) */
          ],
        ));
  }
}
 */