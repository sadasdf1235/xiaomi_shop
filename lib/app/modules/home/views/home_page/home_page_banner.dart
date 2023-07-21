import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xiaomi_shop/app/modules/home/controllers/home_controller.dart';

import '../../../../services/screen_adapter.dart';
class HomePageBanner extends GetView<HomeController> {
  const HomePageBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.height(92),
      child: Image.asset(
        "assets/images/xiaomiBanner.png",
        fit: BoxFit.cover,
      ),
    );
  }
}
