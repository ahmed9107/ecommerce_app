import 'package:flutter/material.dart';
import 'package:store_app/models/product.dart';
import 'package:store_app/utils/constants/app_constants.dart';
import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/big_text.dart';
import 'package:store_app/view/widgets/small_text.dart';

class DiscountItemContainer extends StatelessWidget {
  final void Function()? onTap;
  final void Function()? onTapFavorite;
  final Product product;
  final IconData icon;
  final String bannerMsg;
  const DiscountItemContainer({Key? key,
    this.onTap, 
    required this.product,
    required this.icon,
    this.onTapFavorite, 
    required this.bannerMsg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              ClipRect(
                child: Banner(
                  message: '$bannerMsg%',
                  location: BannerLocation.topStart,
                  color: const Color(0xFFD41847),
                  child: Container(
                    width: MediaQuery.of(context).size.width *0.48,
                    height: MediaQuery.of(context).size.width *0.48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius10),
                      color: Theme.of(context).backgroundColor,
                      ),
                    child: Image.network(AppConstants.BASE_URL + AppConstants.UPLOAD_URL + product.itemsImages![0].image!),
                  ),
                ),
              ),
              Positioned(
                top: Dimensions.height10,
                right: Dimensions.height10,
                child: GestureDetector(
                  onTap: onTapFavorite,
                  child: Icon(icon, color: Theme.of(context).primaryColorLight)
                )
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmallText(text: product.itemsName!, color: Theme.of(context).primaryColorLight, size: Dimensions.font16),
                SizedBox(height: Dimensions.height8/2),
                Row(
                  children: [
                    Icon(Icons.star, color: Theme.of(context).primaryColorLight, size: 13.0),
                    const SizedBox(width: 5.0),
                    SmallText(text: product.itemsRating!),
                    const SizedBox(width: 5.0),
                    const SmallText(text: '|'),
                    const SizedBox(width: 5.0),
                    Container(
                      padding: EdgeInsets.all(Dimensions.height8/2),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(Dimensions.radius10)
                      ),
                      child: SmallText(text: '1287 Sold', color: Theme.of(context).primaryColorLight,
                    )),
                  ],
                ),
                //SmallText(text: itemRate),
                SizedBox(height: Dimensions.height8/2),
                BigText(text: '${product.itemsPrice!} \$', color: const Color(0xFF2D886A)),
              ]),
          ),
        ],
    ),
    );
  }
}