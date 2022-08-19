import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/big_text.dart';
import 'package:store_app/view/widgets/custom_button_list.dart';
import 'package:store_app/view/widgets/item_container.dart';

class WishlistPagePage extends StatelessWidget {
  const WishlistPagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> itemImages = [
      'assets/images/products/1.png',
      'assets/images/products/2.png',
      'assets/images/products/3.png',
      'assets/images/products/4.png',
      'assets/images/products/5.png',
      'assets/images/products/6.png',
      'assets/images/products/7.png',
      'assets/images/products/8.png',
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        title: const BigText(text: 'My Wishlist'),
        leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: Icon(Icons.arrow_back, color: Theme.of(context).primaryColorLight)),
      ),
      body: Container(
        padding: EdgeInsets.all(Dimensions.width15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomButtonList(),
              SizedBox(height: Dimensions.height10),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 15.0,
                  mainAxisExtent: MediaQuery.of(context).size.width * 0.74
                ),
                itemBuilder: (context, index) {
                  return ItemContainer(
                    itemImage: itemImages[index],
                    itemName: 'Air Jordan',
                    itemRate: '4.5');
                },
                itemCount: 8,
              )
            ],
          ),
        ),
      ),
    );
  }
}