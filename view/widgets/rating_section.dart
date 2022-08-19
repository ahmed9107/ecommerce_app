import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/small_text.dart';
import 'package:flutter/material.dart';

class RatingSection extends StatelessWidget {
  const RatingSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star, color: Theme.of(context).primaryColorLight, size: 13.0),
        const SizedBox(width: 5.0),
        const SmallText(text: '4.5'),
        const SizedBox(width: 5.0),
        const SmallText(text: '|'),
        const SizedBox(width: 5.0),
        Container(
          padding: EdgeInsets.all(Dimensions.height8/2),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(Dimensions.radius10)
          ),
          child: SmallText(text: '1287 Sold', color: Theme.of(context).primaryColorLight,
        )),
      ],
    );
  }
}
