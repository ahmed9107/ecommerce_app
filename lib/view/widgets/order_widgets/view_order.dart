import 'package:get/get.dart';
import 'package:store_app/routes/app_routes.dart';
import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:store_app/view/widgets/custom_button.dart';
import 'package:store_app/view/widgets/custom_input_field.dart';
import 'package:store_app/view/widgets/small_text.dart';

class OrderView extends StatelessWidget {
  final bool isCurrent;
  const OrderView({Key? key, required this.isCurrent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> itemImages = [
      'assets/images/products/1.png',
      'assets/images/products/2.png',
      'assets/images/products/3.png',
      'assets/images/products/4.png',
      'assets/images/products/5.png',
      'assets/images/products/6.png',
      'assets/images/products/7.png',
      'assets/images/products/8.png',
    ];
    TextEditingController noteController = TextEditingController();
    return Scaffold(
      body: SizedBox(
        width: Dimensions.screenWidth,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.width15, vertical: Dimensions.width15),
          child: ListView.builder(
            itemCount: 8,
            itemBuilder: (context, index){
              return Container(
                padding: EdgeInsets.all(Dimensions.height10),
                margin: EdgeInsets.only(bottom: Dimensions.height10),
                width: double.maxFinite,
                height: Dimensions.height120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius10),
                  color: Theme.of(context).backgroundColor,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: Dimensions.width100,
                        height: Dimensions.height20 * 5,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(Dimensions.radius10),
                          /* image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(AppConstants.BASE_URL +
                                AppConstants.UPLOAD_URL + cartList[index].img!)), */
                        ),
                        child: Image.asset(itemImages[index]),
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
                            BigText(text: 'AIR Jordan',
                              color: Theme.of(context).primaryColorLight),
                            const SmallText(text: 'Spicy'),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const BigText(
                                  text: '\$ 350',
                                  color: Colors.redAccent),
                                InkWell(
                                  onTap: () {
                                    if(isCurrent){
                                      Get.toNamed(AppRoute.getTrackOrderPage());
                                    } else {
                                      showBottomSheet(context, itemImages[index],noteController);
                                    }
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(
                                      top: Dimensions.height10, 
                                      left: Dimensions.height15, 
                                      right: Dimensions.height15, 
                                      bottom: Dimensions.height10),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.circular(Dimensions.radius25)),
                                    child: BigText(
                                      text: isCurrent ? 'Track order' :'Leave review',
                                      color: Theme.of(context).scaffoldBackgroundColor,
                                      size: Dimensions.font16)
                                  ),
                                )
                              ])
                          ]),
                        ),
                      )
                    ],
                  ),
                );
              }
            ),
          ),
        )
    );
  }

  showBottomSheet(context, String img, TextEditingController noteController) {
    Get.bottomSheet(Container(
      padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10, top: Dimensions.width10),
      height: Dimensions.height270* 2.5,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimensions.radius25),
          topRight: Radius.circular(Dimensions.radius25))
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const BigText(text: 'Leave review', fontWeight: FontWeight.bold),
              SizedBox(height: Dimensions.height15),
              Container(
                width: double.maxFinite,
                height: 1.0,
                color: Theme.of(context).backgroundColor
              ),
              SizedBox(height: Dimensions.height15),
              Container(
                padding: EdgeInsets.all(Dimensions.height10),
                margin: EdgeInsets.only(bottom: Dimensions.height10),
                width: double.maxFinite,
                height: Dimensions.height120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius10),
                  color: Theme.of(context).backgroundColor,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: Dimensions.width100,
                        height: Dimensions.height20 * 5,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(Dimensions.radius10),
                          /* image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(AppConstants.BASE_URL +
                                AppConstants.UPLOAD_URL + cartList[index].img!)), */
                        ),
                        child: Image.asset(img),
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
                            BigText(text: 'AIR Jordan',
                              color: Theme.of(context).primaryColorLight),
                            const SmallText(text: 'Spicy'),
                            const BigText(
                              text: '\$ 350',
                              color: Colors.redAccent)
                          ]),
                        ),
                      )
                    ],
                  ),
                ),
              SizedBox(height: Dimensions.height10),
              const BigText(text: 'How is your order?'),
              SizedBox(height: Dimensions.height10),
              const SmallText(text: 'Please give your rating and also your review'),
              SizedBox(height: Dimensions.height10),
              CustomInputField(
                type: TextInputType.text,
                controller: noteController,
                height: Dimensions.height80,
                hint: 'Note',
                maxLines: 5,
                bgColor: Theme.of(context).backgroundColor
              ),
              SizedBox(height: Dimensions.height15),
              const CustomButton(text: 'Submit', transparent :true),
            ]
          ),
        )
      ),
    );
  }
}


/* class OrderView extends StatelessWidget {
  final bool isCurrent;
  const OrderView({Key? key, required this.isCurrent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<OrderController>(builder: (controller){
        if(controller.isLoaded == false){
          late List<OrderModel> orderList;
          if(controller.currentOrderList.isNotEmpty){
            orderList = isCurrent 
              ? controller.currentOrderList.reversed.toList()
              : controller.historyOrderList.reversed.toList();
          }else{
            orderList = [];
          }
          return orderList.isNotEmpty
          ? SizedBox(
            width: Dimensions.screenWidth,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
              child: ListView.builder(
                itemCount: orderList.length,
                itemBuilder: (context, index){
                  return Container(
                    margin: EdgeInsets.only(bottom: Dimensions.height10),
                    child: InkWell(
                      onTap: (){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('#Order ID:  ${orderList[index].id}'),
                          Column(
                            children:[
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(Dimensions.radius5)
                                ),
                                child: Text(
                                  '${orderList[index].orderStatus}',
                                  style: GoogleFonts.roboto(
                                    color: Colors.white
                                  )
                                )
                              ),
                              SizedBox(height: Dimensions.height10),
                              InkWell(
                                onTap: (){},
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(Dimensions.radius5),
                                    border: Border.all(width: 1, color: Theme.of(context).primaryColor,)
                                  ),
                                  child: Text(
                                    'Track Order',
                                    style: GoogleFonts.roboto(
                                      color: Theme.of(context).primaryColor
                                    )
                                  )
                                )
                              )
                            ]
                          )
                        ],
                      ),
                    ),
                  );
                }
              ),
            ),
          ) : const NoDataPage(text: 'You don\'t have Orders');
        } else {
          return Center(child: Text(
            'Loading',
            style: GoogleFonts.roboto(color:Theme.of(context).primaryColorLight)));
        }
      }),
    );
  }
} */