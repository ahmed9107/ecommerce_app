import 'package:flutter/material.dart';
import 'package:store_app/view/widgets/item_container.dart';

class ListItems extends StatelessWidget {
  const ListItems({Key? key}) : super(key: key);

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
    return GridView.builder(
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
    );
  }
}
