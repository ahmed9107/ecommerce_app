import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryOptions extends StatelessWidget {
  final String value;
  final String title;
  final double amount;
  final bool isFree;
  const DeliveryOptions({Key? key, required this.value,
    required this.title,
    required this.amount,
    required this.isFree}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return /* GetBuilder<OrderController>(
      builder: (controller) {
        return  */
        Row(
          children: [
            /* Radio(
              activeColor: Theme.of(context).primaryColor,
              value: value,
              groupValue: controller.deliveryType,
              onChanged: (String? value) {
                //controller.setDeliveryType(value!);
              }), */
            SizedBox(width: Dimensions.height10/2),
            Text(title, style: GoogleFonts.roboto(color: Theme.of(context).primaryColorLight)),
            SizedBox(width: Dimensions.height10/2),
            Text('(${value == 'take away' ||isFree ? 'Free' : '\$${amount/10}'})',
              style: GoogleFonts.roboto(color: Theme.of(context).primaryColorLight)),
          ],
        );
      /* }
    ); */
  }
}