import 'package:flutter/material.dart';

import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';

import 'package:xiaomi_shop/app/modules/home/controllers/home_controller.dart';
import 'package:xiaomi_shop/app/services/https_client.dart';
import 'package:xiaomi_shop/app/services/ld_title_bar.dart';
import 'package:xiaomi_shop/app/services/screen_adapter.dart';

class HomePageBestSelling extends GetView<HomeController> {
  const HomePageBestSelling({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_top(), _bottom()],
    );
  }

  Widget _top() {
    return LdTitleBar(
        leftTitle: "热销臻选",
        right: Text(
          "更多手机推荐  >",
          style: TextStyle(
            fontSize: ScreenAdapter.fontSize(38),
          ),
        ));
  }

  Widget _bottom() {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Container(
              color: const Color.fromRGBO(246, 246, 246, 1),
              height: ScreenAdapter.height(738),
              child: Obx(() => Swiper(
                    itemCount: controller.bestSellingSwiperList.length,
                    itemBuilder: (ctx, index) {
                      return Image.network(HttpsClient.replaceUrl(
                          controller.bestSellingSwiperList[index].pic!));
                    },
                    autoplay: true,
                    pagination:
                        const SwiperPagination(builder: SwiperPagination.rect),
                  )),
            )),
        SizedBox(
          width: ScreenAdapter.width(30),
        ),
        Expanded(
          flex: 1,
          child: SizedBox(
            height: ScreenAdapter.height(738),
            child: Obx(() => Column(
                  children: controller.bestSellingShopList.asMap().entries.map(
                    (e) {
                      var value = e.value;
                      return Expanded(
                        child: Container(
                          color: const Color.fromRGBO(246, 246, 246, 1),
                          margin: EdgeInsets.fromLTRB(0, 0, 0,
                              e.key == 2 ? 0 : ScreenAdapter.height(20)),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: ScreenAdapter.height(20),
                                    ),
                                    Text(
                                      value.title!,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: ScreenAdapter.fontSize(38)),
                                    ),
                                    SizedBox(
                                      height: ScreenAdapter.height(20),
                                    ),
                                    Text(
                                      value.subTitle!,
                                      style: TextStyle(
                                          fontSize: ScreenAdapter.fontSize(28)),
                                    ),
                                    SizedBox(
                                      height: ScreenAdapter.height(20),
                                    ),
                                    Text(
                                      "￥${value.price!}元",
                                      style: TextStyle(
                                          fontSize: ScreenAdapter.fontSize(34)),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Image.network(
                                  "http://xiaomi.itying.com/${value.pic!.replaceAll("\\", "/")}",
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ).toList(),
                )),
          ),
        )
      ],
    );
  }
}
