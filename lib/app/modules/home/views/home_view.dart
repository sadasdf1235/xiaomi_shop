import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:xiaomi_shop/app/modules/home/views/app_bar/home_app_bar.dart';
import 'package:xiaomi_shop/app/modules/home/views/home_page/home_page.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          HomePage(),
          HomeAppBar(),
        ],
      ),
    );
  }
}
