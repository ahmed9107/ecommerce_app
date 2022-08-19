import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/big_text.dart';
import 'package:store_app/view/widgets/rating_section.dart';
import 'package:store_app/view/widgets/small_text.dart';

class ItemContainer extends StatelessWidget {
  final void Function()? onTap;
  final String itemImage;
  final String itemName;
  final String itemRate;
  const ItemContainer({Key? key,
    this.onTap,
    required this.itemImage,
    required this.itemName,
    required this.itemRate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: /* Container(
        padding: EdgeInsets.all(Dimensions.height10),
        margin: EdgeInsets.fromLTRB(
          Dimensions.width15, 0.0,
          Dimensions.width15, Dimensions.height10),
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(Dimensions.radius10)
        ), 
        child: */Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width *0.48,
                  height: MediaQuery.of(context).size.width *0.48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius10),
                    color: Theme.of(context).backgroundColor,
                    /* image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        AppConstants.BASE_URL + AppConstants.UPLOAD_URL + product.img!
                      )
                    ) */
                  ),
                  child: Image.asset(itemImage),
                ),
                Positioned(
                  top: Dimensions.height10,
                  right: Dimensions.height10,
                  child: Icon(EvaIcons.heartOutline, color: Theme.of(context).primaryColorLight)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SmallText(text: itemName, color: Theme.of(context).primaryColorLight, size: Dimensions.font16),
                  SizedBox(height: Dimensions.height8/2),
                  const RatingSection(),
                  //SmallText(text: itemRate),
                  SizedBox(height: Dimensions.height8/2),
                  const BigText(text: '350 \$'),
                ]),
            ),
          ],
        /* ), */
      ),
    );
  }
}