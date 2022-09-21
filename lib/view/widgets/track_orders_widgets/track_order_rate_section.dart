import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:store_app/view/widgets/big_text.dart';
import 'package:store_app/view/widgets/small_text.dart';

class TrackOrderRateSection extends StatelessWidget {
  const TrackOrderRateSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(EvaIcons.starOutline, color: Theme.of(context).primaryColorLight, size: 40),
        const SizedBox(width:25),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const BigText(text: 'Don\'t forget to rate'),
              const SmallText(text: 'text text text text'),
              Wrap(
                direction: Axis.horizontal,
                children: List.generate(5, (index) {
                  return const Icon(EvaIcons.star, color: Color(0xFFDBDBDB));
                }),
              )
            ],
          )
        )
      ]
    );
  }
}