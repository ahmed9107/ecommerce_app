import 'package:store_app/controller/layout_controller.dart';
import 'package:store_app/utils/constants/colors.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Layout extends StatelessWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LayoutController>(
      builder: (controller) {
        return Scaffold(
          body: controller.pages[controller.selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            elevation: 5.0,
            selectedItemColor: Theme.of(context).primaryColor,
            unselectedItemColor: AppColor.grey,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: controller.selectedIndex,
            selectedFontSize: 0.0,
            unselectedFontSize: 0.0,
            onTap: (int index) {
              controller.onTapNavBar(index);
            },
            items: [
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                icon: Icon(controller.selectedIndex == 0
                  ? EvaIcons.home : EvaIcons.homeOutline), label: 'home'.tr),
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                icon: Icon( controller.selectedIndex == 1
                  ? EvaIcons.archive: EvaIcons.archiveOutline), label: 'history'),
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                icon: Icon(controller.selectedIndex == 2
                  ? EvaIcons.shoppingCart : EvaIcons.shoppingCartOutline), label: 'cart'),
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                icon: Icon(controller.selectedIndex == 3
                  ? EvaIcons.person : EvaIcons.personOutline), label: 'profile'),
            ],
          ),
        );
      }
    );
  }
}
