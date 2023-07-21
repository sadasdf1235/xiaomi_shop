import 'package:flutter/material.dart';

import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';

import 'package:xiaomi_shop/app/modules/home/controllers/home_controller.dart';
import 'package:xiaomi_shop/app/services/https_client.dart';
import '../../../../services/screen_adapter.dart';

class HomePageCategorySwiper extends GetView<HomeController> {
  const HomePageCategorySwiper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenAdapter.height(1080),
      height: ScreenAdapter.height(470),
      child: SizedBox(
        width: ScreenAdapter.height(1080),
        height: ScreenAdapter.height(470),
        child: Obx(() => Swiper(
              itemBuilder: (context, index) {
                return GridView.builder(
                  itemCount: 10,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: ScreenAdapter.width(20)),
                  itemBuilder: (content, i) {
                    return Column(
                      children: [
                        Container(
                          width: ScreenAdapter.height(140),
                          height: ScreenAdapter.height(140),
                          alignment: Alignment.center,
                          child: Image.network(
                            HttpsClient.replaceUrl(controller.categoryList[index * 10 + i].pic!),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        Text(controller.categoryList[index * 10 + i].title!),
                      ],
                    );
                  },
                );
              },
              itemCount: controller.categoryList.length ~/ 10,
              pagination:
                  const SwiperPagination(builder: SwiperPagination.rect),
            )),
      ),
    );
  }
}
