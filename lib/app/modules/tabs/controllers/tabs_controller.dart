import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:xiaomi_shop/app/modules/category/views/category_view.dart';
import 'package:xiaomi_shop/app/modules/give/views/give_view.dart';
import 'package:xiaomi_shop/app/modules/home/views/home_view.dart';
import 'package:xiaomi_shop/app/modules/user/views/user_view.dart';
import '../../cart/views/cart_view.dart';

class TabsController extends GetxController {
  //TODO: Implement TabsController

  RxInt currentIndex = 0.obs;
  PageController pageController = PageController(initialPage: 0);
  List<Widget> pages = const <Widget>[
    HomeView(),
    CategoryView(),
    GiveView(),
    CartView(),
    UserView()
  ];

  void changeCurrentIndex(int index){
    currentIndex.value = index;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

class CardView {
}
