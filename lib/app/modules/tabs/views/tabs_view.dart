import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tabs_controller.dart';
import 'bottom_bar/bottom_bar_list.dart';

class TabsView extends GetView<TabsController> {
  const TabsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: controller.currentIndex.value,
        selectedItemColor: Colors.red,
        items: bottomBarList,
        onTap: (index){
          controller.changeCurrentIndex(index);
          controller.pageController.jumpToPage(index);
        },
      ),
      body: PageView(
        controller: controller.pageController,
        children: controller.pages,
        onPageChanged: (index){
          controller.changeCurrentIndex(index);
        },
      ),
    ));
  }
}
