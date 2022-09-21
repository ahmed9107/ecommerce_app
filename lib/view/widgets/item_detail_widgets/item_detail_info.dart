import 'package:store_app/models/product.dart';
import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/appInfoColumn.dart';
import 'package:store_app/view/widgets/big_text.dart';
import 'package:store_app/view/widgets/expandebal_text.dart';
import 'package:flutter/material.dart';

class ItemDetailsInfo extends StatelessWidget {
  final String pageId;
  final Product product;
  const ItemDetailsInfo({Key? key, required this.pageId, required this.product})
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
            AppInfoColumn(text: product.itemsName!, product:product),
            SizedBox(height: Dimensions.height20),
            BigText(text: 'Introduce', color: Theme.of(context).primaryColorLight),
            SizedBox(height: Dimensions.height20),
            Expanded(
              child: SingleChildScrollView(
                child: ExpandableText(text: product.itemsDescription!),
              ),
            )
          ],
        ),
      ),
    );
  }
}
