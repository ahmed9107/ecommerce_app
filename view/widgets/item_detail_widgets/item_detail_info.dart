import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/appInfoColumn.dart';
import 'package:store_app/view/widgets/big_text.dart';
import 'package:store_app/view/widgets/expandebal_text.dart';
import 'package:flutter/material.dart';

class ItemDetailsInfo extends StatelessWidget {
  final int pageId;
  /* final Products product; */
  const ItemDetailsInfo({Key? key, required this.pageId, /* required this.product */})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 0.0,
      top: Dimensions.itemdetailImgSize - 20,
      child: Container(
        padding: EdgeInsets.fromLTRB(
          Dimensions.width20, Dimensions.height20, Dimensions.width20, 0.0),
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius25),
            topRight: Radius.circular(Dimensions.radius25))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppInfoColumn(text: 'Product Name ' /* product.name! */),
            SizedBox(height: Dimensions.height20),
            BigText(text: 'Introduce', color: Theme.of(context).primaryColorLight),
            SizedBox(height: Dimensions.height20),
            const Expanded(
              child: SingleChildScrollView(
                child: ExpandableText(text: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.' /* product.description! */),
              ),
            )
          ],
        ),
      ),
    );
  }
}
