import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/item_container.dart';
import 'package:store_app/view/widgets/small_text.dart';
import 'package:store_app/view/widgets/sort_and_filter_bottom_sheet.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

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
              Positioned(
                top: Dimensions.height15,
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
                      InkWell(
                        onTap: ()=> showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          builder: (_)=> const SortAndFilterBottomSheet()
                        ),
                        child: Icon(
                          EvaIcons.options2Outline ,
                          color: Colors.grey, size: Dimensions.iconSize16*1.1))
                    ]
                  ),
                ),
              ),
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