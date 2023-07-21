import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:xiaomi_shop/app/modules/home/views/home_page/home_page_banner.dart';
import 'package:xiaomi_shop/app/modules/home/views/home_page/home_page_banner2.dart';
import 'package:xiaomi_shop/app/modules/home/views/home_page/home_page_best_goods.dart';
import 'package:xiaomi_shop/app/modules/home/views/home_page/home_page_best_selling.dart';
import 'package:xiaomi_shop/app/modules/home/views/home_page/home_page_category_swiper.dart';
import 'package:xiaomi_shop/app/modules/home/views/home_page/home_page_swiper.dart';
import 'package:xiaomi_shop/app/modules/home/controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: -40,
      bottom: 0,
      child: ListView(
        controller: controller.scrollController,
        children: const [
          HomePageSwiper(),
          HomePageBanner(),
          HomePageCategorySwiper(),
          HomePageBanner2(),
          HomePageBestSelling(),
          HomePageBestGoods(),
        ],
      ),
    );
  }
}
