import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:xiaomi_shop/app/modules/category/controllers/category_controller.dart';
import 'package:xiaomi_shop/app/services/https_client.dart';
import 'package:xiaomi_shop/app/services/screen_adapter.dart';

import '../../../../routes/app_pages.dart';

class CategoryPageRight extends GetView<CategoryController> {
  const CategoryPageRight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          height: double.infinity,
      child: Obx(() => GridView.builder(
        itemCount: controller.pcateList2.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: ScreenAdapter.width(40),
          mainAxisSpacing: ScreenAdapter.height(20),
          childAspectRatio: 240 / 340
        ),
        itemBuilder: (ctx, index) {
          return InkWell(
            onTap: ()=>Get.toNamed(Routes.PRODUCT_LIST,arguments: {
              "cid":controller.pcateList2[index].sId,
            }),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: Image.network(
                    HttpsClient.replaceUrl(controller.pcateList2[index].pic!),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                SizedBox(
                  height: ScreenAdapter.height(10),
                ),
                Text(
                  controller.pcateList2[index].title!,
                  style: TextStyle(
                    fontSize: ScreenAdapter.fontSize(34),
                  ),
                )
              ],
            ),
          );
        },
      )),
    ));
  }
}
