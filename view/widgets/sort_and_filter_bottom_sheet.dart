import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/big_text.dart';
import 'package:store_app/view/widgets/custom_button.dart';
import 'package:store_app/view/widgets/custom_button_list.dart';
import 'package:flutter/material.dart';

class SortAndFilterBottomSheet extends StatelessWidget {
  const SortAndFilterBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: Dimensions.width10,
        right: Dimensions.width10,
        top: Dimensions.width25),
      height: Dimensions.height270* 2.5,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimensions.radius20),
          topRight: Radius.circular(Dimensions.radius20))
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.center,
                child: BigText(text: 'Sort & Filter', fontWeight: FontWeight.bold)),
              SizedBox(height: Dimensions.height15),
              Container(
                width: double.maxFinite,
                height: 1.0,
                color: Theme.of(context).backgroundColor
              ),
              SizedBox(height: Dimensions.height15),
              const BigText(text: 'Categories'),
              SizedBox(height: Dimensions.height15),
              const CustomButtonList(),
              SizedBox(height: Dimensions.height15),
              const BigText(text: 'Price Range'),
              SizedBox(height: Dimensions.height15),
              Slider(
                activeColor: Theme.of(context).primaryColorLight,
                inactiveColor: Colors.grey[300],
                value: 100,
                max: 220.0,
                min: 80.0,
                onChanged: (value){}
              ),
              const CustomButton(text: 'Submit', transparent :true),
              SizedBox(height: Dimensions.height10),
            ]
          ),
        )
      );
  }
}