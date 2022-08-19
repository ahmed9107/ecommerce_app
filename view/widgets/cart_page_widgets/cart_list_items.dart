import 'package:store_app/utils/constants/app_constants.dart';
import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/small_text.dart';
import 'package:store_app/view/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartListItems extends StatelessWidget {
  const CartListItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return /* GetBuilder<CartController>(builder: (controller) { 
      return controller.getCartItems.isNotEmpty ? Positioned(
        top: Dimensions.height20 * 5.2,
        left: Dimensions.width15,
        right: Dimensions.width15,
        bottom: 0,
        child:  */
        Container(
          margin: EdgeInsets.only(
            top: Dimensions.height10,
            left: Dimensions.width15,
            right: Dimensions.width15
          ),
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: /* GetBuilder<CartController>(builder: (controller) {
              List<CartModel> cartList = controller.getCartItems;
              return  */
              ListView.builder(
                itemCount: 10,//cartList.length,
                itemBuilder: (_, index) {
                  return Container(
                    padding: EdgeInsets.all(Dimensions.height10),
                    width: double.maxFinite,
                    height: Dimensions.height120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius10),
                      color: Theme.of(context).backgroundColor,
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            /* int productIndex = Get.find<ProductController>()
                                  .productList.indexOf(cartList[index].product!);
                            if (productIndex >= 0) {
                              Get.toNamed(AppRoute.getItemDetail(productIndex, 'cart-page'));
                            } else {
                              int recommendedProductIndex =
                                  Get.find<RecommendedProductController>()
                                      .recommendedProductList.indexOf(cartList[index].product!);
                              if (recommendedProductIndex < 0) {
                                Get.snackbar(
                                  'History product',
                                  'Product review is not availble for history product',
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white);
                              } else {
                                Get.toNamed(
                                  AppRoute.getRecommendedProduct(recommendedProductIndex, 'cart-page')
                                );
                              }
                            } */
                          },
                          child: Container(
                            width: Dimensions.width100,
                            height: Dimensions.height20 * 5,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(Dimensions.radius10),
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/images/products/10.png'),
                                /* image: NetworkImage(AppConstants.BASE_URL +
                                    AppConstants.UPLOAD_URL + cartList[index].img!)), */
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: Dimensions.width15),
                        Expanded(
                          child: SizedBox(
                            height: Dimensions.height20 * 5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                BigText(text: 'Name' /* cartList[index].name! */,
                                  color: Theme.of(context).primaryColorLight),
                                const SmallText(text: 'Spicy'),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const BigText(
                                      text: '150', //'\$${cartList[index].price!}',
                                      color: Colors.redAccent),
                                    Container(
                                      padding: EdgeInsets.only(
                                        top: Dimensions.height10, 
                                        left: Dimensions.height15, 
                                        right: Dimensions.height15, 
                                        bottom: Dimensions.height10),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).scaffoldBackgroundColor,
                                        borderRadius: BorderRadius.circular(Dimensions.radius25)),
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              //controller.addItem(cartList[index].product!, -1);
                                            },
                                            child: Icon(
                                              Icons.remove,
                                              color: Theme.of(context).primaryColorLight)),
                                          SizedBox(width: Dimensions.width10),
                                          Text(
                                            '10',//'${cartList[index].quantity}',
                                            style: TextStyle(
                                              color: Theme.of(context).primaryColorLight)),
                                          SizedBox(
                                              width: Dimensions.width10),
                                          GestureDetector(
                                            onTap: () {
                                              //controller.addItem(cartList[index].product!, 1);
                                            },
                                            child: Icon(Icons.add,
                                              color:Theme.of(context).primaryColorLight)),
                                        ],
                                      ),
                                    )
                                  ])
                              ]),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                )
              /* }), */
            ),
          );
       /*  ) */ /* : const NoDataPage(text: 'Empty Cart'); */
      }
}
