import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/big_text.dart';
import 'package:store_app/view/widgets/small_text.dart';
import 'package:store_app/view/widgets/track_orders_widgets/track_order_stepper_separetor.dart';

class TrackOrderStepper extends StatelessWidget {
  const TrackOrderStepper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> stepperIcon = [
      "assets/images/icons/package-box.png",
      "assets/images/icons/delivery-van.png",
      "assets/images/icons/home-delivery.png",
      "assets/images/icons/package.png",
    ];
    
    List<String> stepperTitles = [
      'Ready to pickup',
      'Packet in delivery',
      'handover',
      'Enjoy!',
    ];
    
    List<String> stepperSubTitles = [
      'Order: #2548796',
      'Your order in delivery',
      'Ready for Handover',
      'Enjoy your order',
    ];
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index)=> Row(
          children: [
            Icon(EvaIcons.checkmarkCircle2, color: Theme.of(context).primaryColorLight),
            const SizedBox(width: 10),
            Container(
              margin: EdgeInsets.only(right: Dimensions.height10),
              height: Dimensions.height60,
              width: Dimensions.height60,
              padding: EdgeInsets.all(Dimensions.height15),
              child: Image.asset(
                stepperIcon[index],
                color: Theme.of(context).primaryColorLight),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(text: stepperTitles[index]),
                SmallText(text: stepperSubTitles[index])
              ],
            )
          ],
        ),
        separatorBuilder: (context, index)=> const TrackOrderSeparator(),
        itemCount: 4
      ),
    );
  }
}