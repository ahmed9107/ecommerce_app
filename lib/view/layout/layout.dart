import 'package:store_app/controller/layout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/view/widgets/layout_widgets/layout_bottom_navbar.dart';

class Layout extends StatelessWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LayoutController>(
      builder: (controller) {
        return Scaffold(
          body: controller.pages[controller.selectedIndex],
          bottomNavigationBar: const LayoutBottomNavBar(),
        );
      }
    );
  }
}
