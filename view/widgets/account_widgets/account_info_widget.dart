import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/big_text.dart';
import 'package:flutter/material.dart';

class AccountInfoWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? textClr;
  final Color? iconClr;
  const AccountInfoWidget({Key? key,
    required this.icon,
    required this.text, 
    this.textClr, this.iconClr})
  : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/18.75,
      margin: EdgeInsets.only(
        //top: Dimensions.height10,
        left: Dimensions.height15,
        right: Dimensions.height15),
      padding: EdgeInsets.all(Dimensions.height10),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Row(
        children: [
          Icon(icon, color: iconClr == null ? Theme.of(context).primaryColorLight : iconClr!),
          //AppIcon(icon: icon, backgroundClr: iconBgClr, iconClr: Colors.white),
          SizedBox(width: Dimensions.width15),
          BigText(text: text,
            size: Dimensions.font16,
            color: textClr == null 
              ? Theme.of(context).primaryColorLight 
              : textClr!),
          const Spacer(),
          Icon(Icons.arrow_forward_ios_outlined, color: Theme.of(context).primaryColorLight)
        ],
      ),
    );
  }
}