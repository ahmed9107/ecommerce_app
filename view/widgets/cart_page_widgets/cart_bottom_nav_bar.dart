import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/big_text.dart';
import 'package:flutter/material.dart';

class CartBottomNavBar extends StatelessWidget {
  CartBottomNavBar({Key? key}) : super(key: key);

  final TextEditingController _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return /* GetBuilder<OrderController>(builder: (orderController) {
        _noteController.text = orderController.note;
        return GetBuilder<CartController>(builder: (controller) {
          return  */
          Container(
            height: Dimensions.height15*12,
            padding: EdgeInsets.fromLTRB(
              Dimensions.width25, Dimensions.height20,
              Dimensions.width25, Dimensions.height20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius25),
                topRight: Radius.circular(Dimensions.radius25))),
            child: /* controller.getCartItems.isNotEmpty ? */ 
            Column(
              children: [
                InkWell(
                  /* onTap:()=> showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (_)=> PayMethodBottomSheet(
                      noteController: _noteController
                    )
                  ).whenComplete(() => orderController.setItemNote(_noteController.text.trim())), */
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
                      child: Text('150', //'\$ ${controller.totalAmount}',
                        style: TextStyle(color: Theme.of(context).primaryColorLight)),
                    ),
                    GestureDetector(
                      onTap: () {
                       /*  if(Get.find<LoginController>().userLoggedIn()){
                          //controller.addCartItemsToHistory();
                          if(Get.find<LocationController>().adressList.isEmpty){
                            Get.toNamed(AppRoute.getAddressPage());
                          } else {
                            //Get.offNamed(AppRoute.getInitial());
                            //Get.offNamed(AppRoute.getPayment("001", Get.find<UserController>().userModel!.id));
                            var location = Get.find<LocationController>().getUserAddress();
                            var cart = controller.getCartItems;
                            var user = Get.find<UserController>().userModel!;
                            PlaceOrderModel placeOrder = PlaceOrderModel(
                              cart: cart,
                              orderAmount: 100,
                              orderNote: orderController.note,
                              distance: 10.0,
                              address: location.adress!,
                              latitude: location.latitude!,
                              longitude: location.longitude!,
                              contactPersonName: user.name,
                              contactPersonNumber: user.phone,
                              deliveryType: orderController.deliveryType,
                              paymentMethod: orderController.paymentIndex == 0 
                                ? 'cash_on_delivery'
                                : 'digital_payment');
                            //Get.find<OrderController>().placeOrder(placeOrder, controller.callBack);
                          }
                        } else {
                          Get.toNamed(AppRoute.getLogin());
                        } */
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(
                          Dimensions.width20, Dimensions.height15,
                          Dimensions.width20, Dimensions.height15),
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
            ) /* : Container(), */
          );
        /* }); */
      }
}
