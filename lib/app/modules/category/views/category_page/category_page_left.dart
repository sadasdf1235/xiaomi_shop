import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:xiaomi_shop/app/modules/category/controllers/category_controller.dart';
import '../../../../services/screen_adapter.dart';
class CategoryPageLeft extends GetView<CategoryController> {
  const CategoryPageLeft({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenAdapter.width(280),
      height: double.infinity,
      child: Obx(() => ListView.builder(
          itemCount: controller.pcateList.length,
          itemBuilder: (ctx, index) {
            return InkWell(
              onTap: () => controller.changeSelectIndex(index),
              child: Obx(() => SizedBox(
                width: double.infinity,
                height: ScreenAdapter.height(180),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: ScreenAdapter.width(10),
                        height: ScreenAdapter.height(46),
                        color: controller.selectIndex.value == index
                            ? Colors.orange
                            : Colors.white,
                      ),
                    ),
                    Center(
                      child: Text(
                        controller.pcateList[index].title!,
                        style: TextStyle(
                          fontSize: ScreenAdapter.fontSize(38),
                          fontWeight:
                          controller.selectIndex.value == index
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
            );
          })),
    );
  }
}
