import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/small_text.dart';
import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  const ExpandableText({Key? key, required this.text}) : super(key: key);
  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String secondHalf;
  bool hiddenText = true;
  double textHeight = Dimensions.screenHeight / 5.63;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
      ? SmallText(text: firstHalf)
      : Column(
        children: [
          SmallText(
            text: hiddenText ? '$firstHalf...' : '$firstHalf$secondHalf',
            size: Dimensions.font16,
            height: 2,
          ),
          InkWell(
            onTap: () {
              setState(() {
                hiddenText = !hiddenText;
              });
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SmallText(
                  text: hiddenText ? 'Show more' : 'Show less',
                  size: Dimensions.font16,
                  height: 2,
                  color: Theme.of(context).primaryColor),
                Icon(
                  hiddenText
                    ? Icons.arrow_drop_down
                    : Icons.arrow_drop_up,
                  color: Theme.of(context).primaryColor)
              ],
            ),
          )
        ],
      ),
    );
  }
}
