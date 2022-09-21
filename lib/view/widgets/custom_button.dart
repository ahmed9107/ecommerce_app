import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool transparent;
  final EdgeInsets? margin;
  final double? height;
  final double? width;
  final double? fontSize;
  final double radius;
  final IconData? icon;

  const CustomButton({Key? key,
    required this.text,
    this.onPressed,
    this.transparent = false,
    this.margin,
    this.height,
    this.width,
    this.fontSize,
    this.radius = 5,
    this.icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyle =  TextButton.styleFrom(
      backgroundColor: onPressed == null
          ? Theme.of(context).disabledColor
          : transparent ? Colors.transparent : Theme.of(context).primaryColor,
      minimumSize: Size(
        width != null ? width! : Dimensions.screenWidth,
        height != null ? height! : Dimensions.height50),
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius)
      )
    );
    return Center(
      child: SizedBox(
        width: width != null ? width! : Dimensions.screenWidth,
        height: height != null ? height! : Dimensions.height50,
        child: TextButton(
          onPressed: onPressed,
          style: buttonStyle,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon != null
                ? Padding(
                    padding: EdgeInsets.only(right: Dimensions.width10/2),
                    child: Icon(icon, color : transparent ? Theme.of(context).primaryColor : Theme.of(context).cardColor),
                )
                : const SizedBox(),
              Text(text,
                style: TextStyle(
                  fontSize: fontSize != null ? fontSize! : Dimensions.font16,
                  color : transparent ? Theme.of(context).primaryColor : Theme.of(context).cardColor
              ))
            ]
          ),
        )
      ),
    );
  }
}
