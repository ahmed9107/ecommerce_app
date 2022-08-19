import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/big_text.dart';
import 'package:store_app/view/widgets/rating_section.dart';
import 'package:flutter/material.dart';

class AppInfoColumn extends StatelessWidget {
  final String text;
  const AppInfoColumn({Key? key, required this.text}) : super(key: key);

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
          const RatingSection(),
          SizedBox(height: Dimensions.height10),
          /* Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              IconAndText(
                icon: Icons.circle_sharp,
                iconColor: Colors.amber,
                text: 'Normal'),
              IconAndText(
                icon: Icons.location_on,
                iconColor: Theme.of(context).primaryColor,
                text: '1.7km'),
              IconAndText(
                icon: Icons.access_time_rounded,
                iconColor: Color(0xFFC27E3E),
                text: '32min'),
            ],
          ) */
        ],
      ),
    );
  }
}
