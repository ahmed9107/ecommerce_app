import 'package:get/get.dart';
import 'package:store_app/controller/auth_controllers/user_controller.dart';
import 'package:store_app/controller/cart_controller.dart';
import 'package:store_app/controller/order_controller.dart';
import 'package:store_app/models/place_order_model.dart';
import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:store_app/view/widgets/cart_page_widgets/pay_method_bottom_sheet.dart';

class CartBottomNavBar extends StatelessWidget {
  const CartBottomNavBar({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(builder: (orderController) {
      orderController.noteController.text = orderController.note;
      return GetBuilder<CartController>(builder: (controller) {
        return Container(
          height: Dimensions.height15*12,
          padding: EdgeInsets.fromLTRB(
            Dimensions.width25, Dimensions.height20, Dimensions.width25, Dimensions.height20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius25), topRight: Radius.circular(Dimensions.radius25))),
          child: controller.getCartItems.isNotEmpty ?
          Column(
            children: [
              InkWell(
                onTap:()=> showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (_)=> PayMethodBottomSheet(
                    noteController: orderController.noteController
                  )
                ).whenComplete(() => orderController.setItemNote(orderController.noteController.text.trim())),
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.fromLTRB(
                    0, Dimensions.height15,
                    0, Dimensions.height15),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(Dimensions.radius10)),
                  child: Center(
                    child: BigText(
                      text: 'Payment Method',
                      color: Theme.of(context).scaffoldBackgroundColor)),
                ),
              ),
              SizedBox(height: Dimensions.height15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(
                      Dimensions.width20, Dimensions.height15,
                      Dimensions.width20, Dimensions.height15),
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.circular(Dimensions.radius10)),
                    child: Text('\$ ${controller.totalAmount}',
                      style: TextStyle(color: Theme.of(context).primaryColorLight)),
                  ),
                  GestureDetector(
                    onTap: () async {
                      /* if(Get.find<LocationController>().adressList.isEmpty){
                        Get.toNamed(AppRoute.getAddressPage());
                      } else { */
                        //Get.offNamed(AppRoute.getInitial());
                        //Get.offNamed(AppRoute.getPayment("001", Get.find<UserController>().userModel!.id));
                        //var location = Get.find<LocationController>().getUserAddress();
                        var cart = controller.getCartItems;
                        PlaceOrderModel placeOrder = PlaceOrderModel(
                          cart: PlaceOrderModel.getStringCart(cart),
                          userId: Get.find<UserController>().userId,
                          orderAmount: controller.totalAmount.toString(),
                          orderNote: 'NOTE' /* orderController.note */,
                          isAccepted: "1",
                          deliveryAddress: "NYK" /* location.adress! */,
                          deliveryCharge: "25.0" /* orderController.deliveryType */,
                          paymentStatus: orderController.paymentIndex == 0 
                            ? 'COD'
                            : 'Paid',
                          );
                        await orderController.placeOrder(placeOrder, controller.callBack);
                      /* } */
                      //controller.addCartItemsToHistory();
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(
                        Dimensions.width20, Dimensions.height15, Dimensions.width20, Dimensions.height15),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(Dimensions.radius10)),
                      child: BigText(
                        text: 'Check out',
                        color: Theme.of(context).scaffoldBackgroundColor),
                    ),
                  ),
                ],
              ),
            ],
          ) : Container(),
        );
      }
    );
  }
    );
  }
}
