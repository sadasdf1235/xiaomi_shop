import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:xiaomi_shop/app/modules/home/controllers/home_controller.dart';
import 'package:xiaomi_shop/app/services/https_client.dart';
import '../../../../services/screen_adapter.dart';

class HomePageSwiper extends GetView<HomeController> {
  const HomePageSwiper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenAdapter.width(1000),
      height: ScreenAdapter.height(682),
      child: Obx(() => Swiper(
        itemBuilder: (context, index){
          return Image.network(HttpsClient.replaceUrl(controller.swiperList[index].pic!),fit: BoxFit.fill,);
        },
        autoplay: true,
        duration: 1000,
        itemCount: controller.swiperList.length,
        pagination: const SwiperPagination(
            builder: SwiperPagination.rect
        ),
      )),
    );
  }
}
