import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:store_app/view/widgets/big_text.dart';
import 'package:store_app/view/widgets/small_text.dart';

class ProfileImageSection extends StatelessWidget {
  const ProfileImageSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height*0.33,
      margin: EdgeInsets.only(
        //top: Dimensions.height20,
        left: Dimensions.height15,
        right: Dimensions.height15),
      padding: EdgeInsets.only(
        top: Dimensions.height20,
        //left: Dimensions.height15,
        bottom: Dimensions.height20),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppIcon(
            icon: Icons.person,
            iconClr: Colors.white,
            backgroundClr: Colors.grey,
            iconSize: Dimensions.iconSize24*3,
            size: Dimensions.height120
          ),
          SizedBox(height: Dimensions.height10/2),
          const BigText(text: 'Ahmed Azami'),
          SizedBox(height: Dimensions.height10/2),
          const SmallText(text: '+212 624112232')
        ],
      ),
    );
  }
}