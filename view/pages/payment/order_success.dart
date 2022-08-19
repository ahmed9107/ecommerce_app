import 'package:store_app/routes/app_routes.dart';
import 'package:store_app/utils/constants/colors.dart';
import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/custom_button.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderSuccess extends StatelessWidget {
  final String orderID;
  final int status;
  const OrderSuccess({Key? key,
    required this.orderID,
    required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(status == 0) {
      Future.delayed(const Duration(seconds: 1), (){
        // Get.dialog();
      });
    }
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(Dimensions.height10),
        child: Center(
          child: SizedBox(
            width: Dimensions.screenWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  status == 1 ? Icons.check_circle_outline : EvaIcons.alertTriangle,
                  size: 200,
                  color: status == 1 ? AppColor.successColor : AppColor.errorColor,
                ),
                SizedBox(height: Dimensions.height45),
                Text(
                  status == 1 ? 'You placed the order successfully' : 'Your order failed',
                  style: GoogleFonts.roboto(
                    fontSize: Dimensions.font20,
                    color: Theme.of(context).primaryColorLight
                  )
                ),
                SizedBox(height: Dimensions.height20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width20, vertical: Dimensions.width20),
                  child: Text(
                    status == 1 ? 'Successful order' : 'Failed order',
                    style: GoogleFonts.roboto(
                      fontSize: Dimensions.font20,
                      color: Colors.grey
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: Dimensions.height20),
                CustomButton(text: 'Back Home',
                  onPressed: ()=> Get.offAllNamed(AppRoute.getInitial())
                ),
              ]
            ),
          )
        ),
      ),
    );
  }
}