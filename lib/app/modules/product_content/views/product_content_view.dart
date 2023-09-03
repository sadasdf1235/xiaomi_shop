import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:xiaomi_shop/app/modules/product_content/views/app_bar/product_content_app_bar.dart';
import 'package:xiaomi_shop/app/modules/product_content/views/page/product_content_body.dart';
import 'package:xiaomi_shop/app/modules/product_content/views/page/product_content_bottom.dart';
import '../../../services/screen_adapter.dart';
import '../controllers/product_content_controller.dart';

class ProductContentView extends GetView<ProductContentController> {
  const ProductContentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: _appbar(),
      body: Stack(
        children: [
          ProductContentBody(showAttr, subHeader),
          ProductContentBottom(showAttr),
          Obx(() => controller.showSubHeader.value
              ? Positioned(
                  left: 0,
                  right: 0,
                  top: ScreenAdapter.getStatusBarHeight() +
                      ScreenAdapter.height(120),
                  child: subHeader(),
                )
              : const Text(""))
        ],
      ),
    );
  }

  PreferredSizeWidget _appbar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(ScreenAdapter.height(120)),
      child: const ProductContentAppBar(),
    );
  }

  void showAttr() {
    Get.bottomSheet(GetBuilder<ProductContentController>(
        init: controller,
        builder: (controller) {
          return Container(
            color: Colors.white,
            height: ScreenAdapter.height(1200),
            width: double.infinity,
            padding: EdgeInsets.all(ScreenAdapter.width(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: controller.pcontent.value.attr!
                      .map((e) => Wrap(
                            children: [
                              Text("${e.cate}"),
                              Wrap(
                                children: e.attrList!
                                    .map(
                                      (v) => InkWell(
                                        onTap: () {
                                          //点击颜色切换
                                          controller.changeAttr(
                                              e.cate, v["title"]);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(
                                              ScreenAdapter.width(20)),
                                          child: Chip(
                                              padding: EdgeInsets.only(
                                                  left: ScreenAdapter.width(20),
                                                  right:
                                                      ScreenAdapter.width(20)),
                                              backgroundColor:
                                                  v["checked"] == true
                                                      ? Colors.red
                                                      : const Color.fromARGB(
                                                          31, 223, 213, 213),
                                              label: Text(v["title"])),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              )
                            ],
                          ))
                      .toList(),
                )
              ],
            ),
          );
        }));
  }

  Widget subHeader() {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              height: ScreenAdapter.height(120),
              alignment: Alignment.center,
              child: const Text(
                "商品详情",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ),
          Expanded(
              child: Container(
                  height: ScreenAdapter.height(120),
                  alignment: Alignment.center,
                  child: const Text("规格参数")))
        ],
      ),
    );
  }
}
