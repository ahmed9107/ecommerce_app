import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/home_controller.dart';
import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/big_text.dart';

class CustomButtonList extends StatelessWidget {
  const CustomButtonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return SizedBox(
          height: Dimensions.height7*5,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 50,
            itemBuilder: (context, index){
              return InkWell(
                onTap: (){
                  controller.changeCatIndex(index);
                },
                child: Container(
                  margin: EdgeInsets.only(right: Dimensions.width8),
                  padding: EdgeInsets.symmetric(
                    vertical: Dimensions.height8/3,
                    horizontal: Dimensions.width10),
                  decoration: BoxDecoration(
                    color: index == controller.catIndex
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).backgroundColor,
                    border: Border.all(color: Theme.of(context).primaryColorLight, width: 1.5),
                    borderRadius: BorderRadius.circular(Dimensions.radius25)
                  ),
                  child: Center(
                    child: BigText(
                      text: index == 0 ? 'All' : 'Category',
                      color: index == controller.catIndex
                        ? Theme.of(context).backgroundColor 
                        : Theme.of(context).primaryColorLight,
                      size: Dimensions.font16,
                  ),
                )),
              );
            },
          ),
        );
      }
    );
  }
}