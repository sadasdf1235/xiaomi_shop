import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:xiaomi_shop/app/modules/product_content/controllers/product_content_controller.dart';
import '../../../../services/screen_adapter.dart';

class ProductContentAppBar extends GetView<ProductContentController> {
  const ProductContentAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => AppBar(
      leading: Container(
        alignment: Alignment.center,
        child: Container(
          margin: EdgeInsets.only(left: ScreenAdapter.width(20)),
          width: ScreenAdapter.width(88),
          height: ScreenAdapter.height(88),
          child: ElevatedButton(
            onPressed: () {
              Get.back();
            },
            style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                alignment: Alignment.center,
                backgroundColor: MaterialStateProperty.all(Colors.black12),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(const CircleBorder())),
            child: const Icon(Icons.arrow_back_ios_new_outlined),
          ),
        ),
      ),
      title: Obx(() => controller.showTabs.value
          ? SizedBox(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: controller.tabList
              .map(
                (e) => InkWell(
              onTap: () {
                controller.selectTabIndex(e["id"]);
                if (e["id"] == 1) {
                  Scrollable.ensureVisible(
                      controller.gk1.currentContext as BuildContext);
                } else if (e["id"] == 2) {
                  Scrollable.ensureVisible(
                      controller.gk2.currentContext as BuildContext);
                } else {
                  Scrollable.ensureVisible(
                      controller.gk3.currentContext as BuildContext);
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(e["title"]),
                  SizedBox(
                    height: ScreenAdapter.height(10),
                  ),
                  Container(
                    width: ScreenAdapter.width(100),
                    height: ScreenAdapter.height(4),
                    color: controller.selectTabIndex == e["id"]
                        ? Colors.red
                        : Colors.transparent,
                  )
                ],
              ),
            ),
          )
              .toList(),
        ),
      )
          : const Text("")),
      centerTitle: true,
      backgroundColor: Colors.white.withOpacity(controller.opactity.value),
      actions: [
        Container(
          margin: EdgeInsets.only(right: ScreenAdapter.width(10)),
          width: ScreenAdapter.width(88),
          height: ScreenAdapter.height(88),
          alignment: Alignment.center,
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                alignment: Alignment.center,
                backgroundColor: MaterialStateProperty.all(Colors.black12),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(const CircleBorder())),
            child: const Icon(Icons.file_upload_outlined),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: ScreenAdapter.width(10)),
          width: ScreenAdapter.width(88),
          height: ScreenAdapter.height(88),
          child: ElevatedButton(
            onPressed: () {
              showMenu(
                context: context,
                position: RelativeRect.fromLTRB(
                    ScreenAdapter.width(800), ScreenAdapter.height(180), 0, 0),
                items: const [
                  PopupMenuItem(
                      child: Row(
                        children: [
                          Text("首页"),
                          Icon(Icons.add),
                        ],
                      )),
                  PopupMenuItem(
                      child: Row(
                        children: [
                          Text("首页"),
                          Icon(Icons.add),
                        ],
                      )),
                  PopupMenuItem(
                      child: Row(
                        children: [
                          Text("首页"),
                          Icon(Icons.add),
                        ],
                      )),
                ],
              );
            },
            style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                alignment: Alignment.center,
                backgroundColor: MaterialStateProperty.all(Colors.black12),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(const CircleBorder())),
            child: const Icon(Icons.more_horiz_outlined),
          ),
        ),
      ],
    ));
  }
}
