import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/big_text.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int pageId;
  /* final Products product; */
  const BottomNavBar({Key? key, required this.pageId,/*  required this.product */})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height120,
      padding: EdgeInsets.fromLTRB(Dimensions.width25, Dimensions.height20,
        Dimensions.width25, Dimensions.height20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimensions.radius25),
          topRight: Radius.circular(Dimensions.radius25))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /* GetBuilder<ProductController>(builder: (controller) {
            return  */
            Container(
              padding: EdgeInsets.symmetric(vertical: Dimensions.height15, horizontal: Dimensions.height20),
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.circular(Dimensions.radius10)
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      //controller.setQuantity(false);
                    },
                    child: Icon(Icons.remove, color: Theme.of(context).primaryColorLight)),
                  SizedBox(width: Dimensions.width15),
                  Text('5', //'${controller.cartItems}',
                    style: TextStyle(color: Theme.of(context).primaryColorLight)),
                  SizedBox(width: Dimensions.width15),
                  GestureDetector(
                    onTap: () {
                      //controller.setQuantity(true);
                    },
                    child: Icon(Icons.add, color: Theme.of(context).primaryColorLight)
                  ),
                ],
              ),
            ),
          /* }), */
          /* GetBuilder<ProductController>(builder: (controller) {
            return  */
            GestureDetector(
              onTap: () {
                //controller.addItem(product);
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(
                    Dimensions.width20,
                    Dimensions.height15,
                    Dimensions.width20,
                    Dimensions.height15),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(Dimensions.radius10)),
                child: BigText(
                    text: '\$150| Add to cart',
                    color: Theme.of(context).scaffoldBackgroundColor),
              ),
            )
          /* }), */
        ],
      ),
    );
  }
}
