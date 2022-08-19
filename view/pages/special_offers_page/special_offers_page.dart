import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      body: Container(
        padding: EdgeInsets.all(Dimensions.width15),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index){
            return Container(
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
            );
          }
        ),
      ),
    );
  }
}