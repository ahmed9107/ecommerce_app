import 'package:get/get.dart';
import 'package:store_app/routes/app_routes.dart';
import 'package:store_app/view/widgets/big_text.dart';
import 'package:store_app/view/widgets/cart_page_widgets/cart_bottom_nav_bar.dart';
import 'package:store_app/view/widgets/cart_page_widgets/cart_list_items.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        title: const BigText(text: 'My Cart'),
        leading: InkWell(
          onTap: (){
            Get.toNamed(AppRoute.getInitial());
          },
          child: Icon(Icons.arrow_back, color: Theme.of(context).primaryColorLight)),
      ),
      body: const CartListItems(),
      bottomNavigationBar: CartBottomNavBar(),
    );
  }
}
