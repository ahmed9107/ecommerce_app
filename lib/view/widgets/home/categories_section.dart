import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/home_controller.dart';
import 'package:store_app/routes/app_routes.dart';
import 'package:store_app/utils/constants/app_constants.dart';
import 'package:store_app/utils/constants/status-request.dart';
import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/custom_loader.dart';
import 'package:store_app/view/widgets/small_text.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return controller.statusRequest == StatusRequest.loading
          ? const CustomLoader(size: 20)
          : SizedBox(
            height: Dimensions.height120,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: controller.categoriesList.length,
              itemBuilder: (context, index){
                return InkWell(
                onTap: () {
                  //Get.find<ProductsController>().productsPerCategories(controller.categoriesList[index].id!);
                  Get.toNamed(AppRoute.getCategoryItems(controller.categoriesList[index].id!));
                },
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: Dimensions.height10),
                      height: Dimensions.height60*1.1,
                      width: Dimensions.height60*1.1,
                      padding: EdgeInsets.all(Dimensions.height15),
                      decoration: BoxDecoration(
                        color: Theme.of(context).backgroundColor,
                        borderRadius: BorderRadius.circular(Dimensions.height10),
                      ),
                      child: Image.network(
                        AppConstants.BASE_URL + AppConstants.UPLOAD_URL + controller.categoriesList[index].image!,
                        color: Theme.of(context).primaryColorLight),
                    ),
                    SizedBox(height: Dimensions.height8),
                    SmallText(
                      text: controller.categoriesList[index].name!,
                      color: Theme.of(context).primaryColorLight)
                  ],
                ),
              );
            },
          ),
        );
      }
    );
  }
}