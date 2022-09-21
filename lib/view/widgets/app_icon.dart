import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundClr;
  final Color iconClr;
  final double size;
  final double iconSize;
  const AppIcon(
      {Key? key,
      required this.icon,
      this.backgroundClr = const Color(0xFFfcf4e4),
      this.iconClr = const Color(0xFF201E18),
      this.size = 45, this.iconSize = 16})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size / 2), color: backgroundClr),
      child: Icon(icon, color: iconClr, size: iconSize == 16 ? Dimensions.iconSize16: iconSize),
    );
  }
}
