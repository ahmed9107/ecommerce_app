import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/routes/app_routes.dart';
import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/small_text.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> icons = [
      CategoryModel(image: 'assets/images/icons/cloths.png', title: 'Cloths'),
      CategoryModel(image: 'assets/images/icons/shoe.png', title: 'Shoes'),
      CategoryModel(image: 'assets/images/icons/bag.png', title: 'Bags'),
      CategoryModel(image: 'assets/images/icons/diamond.png', title: 'Jewelry'),
    ];
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ...List.generate(4, (index) {
            return InkWell(
              onTap: (){Get.toNamed(AppRoute.getCategoryItems());},
              child: Column(
                children: [
                  Container(
                    height: Dimensions.height60,
                    width: Dimensions.height60,
                    padding: EdgeInsets.all(Dimensions.height15),
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.circular(Dimensions.height60/2),
                    ),
                    child: Image.asset(icons[index].image, color: Theme.of(context).primaryColorLight),
                  ),
                  SizedBox(height: Dimensions.height8),
                  SmallText(text: icons[index].title, color: Theme.of(context).primaryColorLight)
                ],
              ),
            );
          }),
        ]
      ),
    );
  }
}

class CategoryModel{
  final String image;
  final String title;

  CategoryModel({
    required this.image,
    required this.title,
  });
}