import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/routes/app_routes.dart';
import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/small_text.dart';

class SearchFieldSection extends StatelessWidget {
  const SearchFieldSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.toNamed(AppRoute.getSearchPage());
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.height10, vertical: Dimensions.height10/2),
        width: double.maxFinite,
        height: Dimensions.height50*1.1,
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(Dimensions.radius10)
        ),
        child: Row(
          children: [
            Icon(EvaIcons.searchOutline, color: Colors.grey, size: Dimensions.iconSize16*1.1),
            SizedBox(width: Dimensions.width10),
            const SmallText(text: 'Search'),
            const Spacer(),
            Icon(EvaIcons.options2Outline , color: Colors.grey, size: Dimensions.iconSize16*1.1)
          ]
        ),
      ),
    );
  }
}