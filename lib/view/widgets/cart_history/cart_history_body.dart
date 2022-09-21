
import 'dart:convert';

import 'package:get/get.dart';
import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:store_app/view/widgets/cart_history/time_widget.dart';

import '../../../controller/cart_controller.dart';
import '../../../models/cart.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/constants/app_constants.dart';
import '../big_text.dart';
import '../no_data_page.dart';
import '../small_text.dart';

class CartHistoryBody extends StatelessWidget {
  const CartHistoryBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CartModel> getCartHistoryList = Get.find<CartController>().getCartHistoryList().reversed.toList();
    Map<String, int> cartItemsPerOrder = {};

    for (int i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemsPerOrder.containsKey(getCartHistoryList[i].time)) {
        cartItemsPerOrder.update(
            getCartHistoryList[i].time!, (value) => ++value);
      } else {
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }

    List<int> cartOrderitemToList() {
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }
    List<String> cartOrderTimeToList() {
      return cartItemsPerOrder.entries.map((e) => e.key).toList();
    }
    List<int> itemsPerOdrer = cartOrderitemToList();
    int listCounter = 0;

    return GetBuilder<CartController>(builder: (controller) {
      return controller.getCartHistoryList().isNotEmpty
        ? Expanded(
          child: Container(
            margin: EdgeInsets.fromLTRB(
              Dimensions.height20,
              Dimensions.height20,
              Dimensions.height20, 0.0),
            child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: ListView(
                children: [
                  for (int i = 0; i < itemsPerOdrer.length; i++)
                    Container(
                      height: Dimensions.height120 + 5,
                      margin: EdgeInsets.only(bottom: Dimensions.height20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TimeWidget(
                            getCartHistoryList: getCartHistoryList,
                            index: listCounter),
                          SizedBox(height: Dimensions.height10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Wrap(
                                direction: Axis.horizontal,
                                children: List.generate(itemsPerOdrer[i], (index) {
                                  if (listCounter < getCartHistoryList.length) {
                                    listCounter++;
                                  }
                                  return index <= 2
                                    ? Container(
                                        height: Dimensions.height7 * 10,
                                        width: Dimensions.height7 * 10,
                                        margin: EdgeInsets.only(right: Dimensions.width5),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(Dimensions.radius10),
                                          color: Theme.of(context).backgroundColor,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              AppConstants.BASE_URL + AppConstants.UPLOAD_URL +
                                                getCartHistoryList[listCounter - 1].img!))))
                                    : Container();
                                }),
                              ),
                              SizedBox(
                                height: Dimensions.height45 * 2,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SmallText(text: 'Total'),
                                    BigText(
                                      text: '${itemsPerOdrer[i]} items',
                                      color: Theme.of(context).primaryColorLight),
                                    GestureDetector(
                                      onTap: () {
                                        var orderTime = cartOrderTimeToList();
                                        Map<String, CartModel> moreOrder = {};
                                        for (int j = 0; j < getCartHistoryList.length; j++) {
                                          if (getCartHistoryList[j].time == orderTime[i]) {
                                            moreOrder.putIfAbsent(
                                                getCartHistoryList[j].id!,
                                                () => CartModel.fromJson(
                                                  jsonDecode(jsonEncode(getCartHistoryList[j])
                                                )
                                              )
                                            );
                                          }
                                        }
                                        Get.find<CartController>().setItemsToCartForMoreOrder = moreOrder;
                                        Get.find<CartController>().addToCartList();
                                        Get.toNamed(AppRoute.getCart());
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(horizontal:Dimensions.height5),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(Dimensions.radius5),
                                          border: Border.all(
                                            width: 1,
                                            color: Theme.of(context).primaryColor)),
                                        child: SmallText(
                                          text: 'One more',
                                          color: Theme.of(context).primaryColor)
                                      ),
                                    )
                                ])
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ),
          )
        : Container(
            margin: EdgeInsets.only(top: Dimensions.height120),
            child: const NoDataPage(text: 'No History'));
    });
  }
}
