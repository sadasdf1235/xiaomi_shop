import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xiaomi_shop/app/modules/home/controllers/home_controller.dart';
import 'package:xiaomi_shop/app/services/screen_adapter.dart';

class HomePageBanner2 extends GetView<HomeController> {
  const HomePageBanner2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(ScreenAdapter.width(20),
          ScreenAdapter.height(20), ScreenAdapter.width(20), 0),
      child: Container(
        height: ScreenAdapter.height(420),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: const DecorationImage(
              image: AssetImage("assets/images/xiaomiBanner2.png"),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
