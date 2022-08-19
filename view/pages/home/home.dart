import 'package:get/get.dart';
import 'package:store_app/routes/app_routes.dart';
import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/big_text.dart';
import 'package:store_app/view/widgets/custom_button_list.dart';
import 'package:store_app/view/widgets/home/carousel_slider/carousel_slider.dart';
import 'package:store_app/view/widgets/home/categories_section.dart';
import 'package:store_app/view/widgets/home/notification_field_section.dart';
import 'package:store_app/view/widgets/home/search_field_section.dart';
import 'package:flutter/material.dart';
import '../../widgets/home/list_items/list_items.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: Dimensions.width15, right: Dimensions.width15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: Dimensions.height15),
                const NotificationFieldSection(),
                SizedBox(height: Dimensions.height15),
                const SearchFieldSection(),
                SizedBox(height: Dimensions.height15),
                Container(
                  margin: EdgeInsets.only(left: Dimensions.width8, right: Dimensions.width8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BigText(text: 'Special Offers', size: Dimensions.font18),
                      InkWell(
                        onTap: (){Get.toNamed(AppRoute.getSpecialOffers());},
                        child: BigText(
                          text: 'See All',
                          size: Dimensions.font18, fontWeight: FontWeight.bold
                        )
                      ),
                    ],
                  ),
                ),
                SizedBox(height: Dimensions.height15),
                const CarouselSlider(),
                SizedBox(height: Dimensions.height15),
                const CategoriesSection(),
                SizedBox(height: Dimensions.height15),
                Container(
                  margin: EdgeInsets.only(left: Dimensions.width8, right: Dimensions.width8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const BigText(text: 'Most Popular'),
                      InkWell(
                        onTap: (){Get.toNamed(AppRoute.getPopularItems());},
                        child: BigText(
                          text: 'See All', size: Dimensions.font18,
                          fontWeight: FontWeight.bold
                        )
                      ),
                    ],
                  )),
                SizedBox(height: Dimensions.height10),
                const CustomButtonList(),
                SizedBox(height: Dimensions.height10),
                const ListItems(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
