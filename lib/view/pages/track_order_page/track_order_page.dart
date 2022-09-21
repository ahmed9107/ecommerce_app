import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/big_text.dart';
import 'package:store_app/view/widgets/small_text.dart';
import 'package:store_app/view/widgets/track_orders_widgets/track_order_rate_section.dart';
import 'package:store_app/view/widgets/track_orders_widgets/track_order_stepper.dart';

class TrackOrderPage extends StatelessWidget {
  const TrackOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15,50,15,15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: (){
                Get.back();
              },
              child: Icon(Icons.arrow_back, color: Theme.of(context).primaryColorLight)),
            const SizedBox(height: 15),
            BigText(text: 'Track Order', size: Dimensions.font20*2, fontWeight: FontWeight.bold),
            SmallText(text: 'Wed, 12 Sep', size: Dimensions.font16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallText(text: 'Order ID: 5t4534zq', size: Dimensions.font16),
                SmallText(text: 'Amt: 345', size: Dimensions.font16),
              ],
            ),
            const SizedBox(height: 20),
            const TrackOrderStepper(),
            const SizedBox(height: 40),
            const TrackOrderRateSection(),
          ],
        ),
      ),
    );
  }
}