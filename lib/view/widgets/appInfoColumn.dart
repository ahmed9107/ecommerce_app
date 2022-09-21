import 'package:store_app/models/product.dart';
import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/big_text.dart';
import 'package:store_app/view/widgets/rating_section.dart';
import 'package:flutter/material.dart';

class AppInfoColumn extends StatelessWidget {
  final Product product;
  final String text;
  const AppInfoColumn({Key? key, required this.text, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(
            text: text,
            color: Theme.of(context).primaryColorLight,
            size: Dimensions.font26,
          ),
          SizedBox(height: Dimensions.height10),
          RatingSection(product:product),
          SizedBox(height: Dimensions.height10),
        ],
      ),
    );
  }
}
