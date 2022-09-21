import 'package:flutter/material.dart';
import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/big_text.dart';
import 'package:store_app/view/widgets/small_text.dart';

class NotifyContainer extends StatelessWidget {
  final String title;
  final String subTitle;
  const NotifyContainer({Key? key,
    required this.title, required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(Dimensions.height10),
      margin: EdgeInsets.only(top: Dimensions.height10),
      height: Dimensions.height60*1.15,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.circular(Dimensions.radius10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BigText(text: title, size: Dimensions.font20),
          SmallText(text: subTitle)
        ],
      ),
    );
  }
}