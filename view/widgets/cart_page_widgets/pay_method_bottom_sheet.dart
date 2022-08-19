import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/custom_input_field.dart';
import 'package:store_app/view/widgets/order_widgets/delivery_option.dart';
import 'package:store_app/view/widgets/payment_option_btn.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PayMethodBottomSheet extends StatelessWidget {
  final TextEditingController noteController;
  const PayMethodBottomSheet({Key? key,
    required this.noteController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10, top: Dimensions.width10),
      height: Dimensions.height270* 2.5,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimensions.radius20),
          topRight: Radius.circular(Dimensions.radius20))
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PaymenyOptionButton(
                icon: Icons.money,
                title: 'Cash On Delivery',
                subtitle: 'You pay after getting the delivery',
                index: 0),
              const PaymenyOptionButton(
                icon: Icons.paypal,
                title: 'Paypal Payment',
                subtitle: 'Safer and faster way to pay',
                index: 1),
              SizedBox(height: Dimensions.height10),
              Container(
                margin: EdgeInsets.symmetric(horizontal: Dimensions.height10),
                child: Text('Delivery options',
                  style: GoogleFonts.roboto(
                    fontSize: Dimensions.font20, color: Theme.of(context).primaryColorLight)),
              ),
              SizedBox(height: Dimensions.height10),
              const DeliveryOptions(
                amount: 160.0/* Get.find<CartController>().totalAmount.toDouble() */,
                value: 'delivery',
                isFree: false,
                title: 'Home Delivery'),
              const DeliveryOptions(
                amount: 0.0,
                value: 'take away',
                isFree: true,
                title: 'Take away'),
              SizedBox(height: Dimensions.height10),
              Container(
                margin: EdgeInsets.symmetric(horizontal: Dimensions.height10),
                child: Text('Additional info',
                  style: GoogleFonts.roboto(
                    fontSize: Dimensions.font20, color: Theme.of(context).primaryColorLight)),
              ),
              CustomInputField(
                type: TextInputType.text,
                controller: noteController,
                height: Dimensions.height80,
                hint: 'Note',
                maxLines: 5,
                bgColor: Theme.of(context).backgroundColor
              ),
              SizedBox(height: Dimensions.height10),
            ]
          ),
        )
      );
  }
}