import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymenyOptionButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final int index;
  const PaymenyOptionButton({Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return /* GetBuilder<OrderController>(
      builder: (controller) {
        bool isSelected = controller.paymentIndex == index;
        return */ 
        InkWell(
          onTap: (){
            //controller.setPaymentIndex(index);
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: Dimensions.height5, horizontal: Dimensions.height5),
            padding: EdgeInsets.all(Dimensions.height5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius10),
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(icon,
                  size: Dimensions.iconSize20*2,
                  color: /* isSelected 
                      ? */ Theme.of(context).primaryColor 
                      /* : Theme.of(context).disabledColor */),
              title: Text(title,
                style: GoogleFonts.roboto(
                  color: Theme.of(context).primaryColorLight,
                  fontSize: Dimensions.font20
                )
              ),
              subtitle: Text(subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.roboto(
                  color: Colors.grey,
                  fontSize: Dimensions.font12
                )
              ),
              trailing: /* isSelected ?  */Icon(Icons.check_circle,
                color:Theme.of(context).primaryColor) /* : null */,
            ),
          ),
        );
      /* }
    ); */
  }
}