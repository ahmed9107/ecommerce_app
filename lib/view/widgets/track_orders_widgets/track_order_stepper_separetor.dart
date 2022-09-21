import 'package:flutter/material.dart';
import 'package:store_app/utils/helpers/dimensions.dart';

class TrackOrderSeparator extends StatelessWidget {
  const TrackOrderSeparator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      children: List.generate(4, (index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.width15*1.1),
          child: Container(
            height: 3,
            width: 1,
            margin: EdgeInsets.symmetric(vertical: Dimensions.width5/2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius10),
              color: Theme.of(context).primaryColorLight)),
        );
      }),
    );
  }
}