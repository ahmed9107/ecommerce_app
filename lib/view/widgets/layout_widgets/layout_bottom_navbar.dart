import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/layout_controller.dart';
import 'package:store_app/utils/constants/colors.dart';

class LayoutBottomNavBar extends StatelessWidget {
  const LayoutBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LayoutController>(
      builder: (controller) {
        return BottomNavigationBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 5.0,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: AppColor.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: controller.selectedIndex,
          type: BottomNavigationBarType.fixed,
          //selectedFontSize: 0.0,
          //unselectedFontSize: 0.0,
          onTap: (int index) {
            controller.onTapNavBar(index);
          },
          items: [
            ...List.generate(
              controller.pages.length,
              (index) => BottomNavigationBarItem(
                icon: Icon(controller.pagesIcons()[index]),
                label: controller.pagesTitles[index]),
            )
          ],
        );
      }
    );
  }
}