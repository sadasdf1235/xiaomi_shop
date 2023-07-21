import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xiaomi_shop/app/modules/category/controllers/category_controller.dart';

import '../../../../routes/app_pages.dart';
import '../../../../services/screen_adapter.dart';
class CategoryAppBar extends GetView<CategoryController> {
  const CategoryAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>Get.toNamed(Routes.SEARCH),
      child: Container(
        width: ScreenAdapter.width(840),
        height: ScreenAdapter.height(96),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: EdgeInsets.all(ScreenAdapter.width(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.search),
                  SizedBox(
                    width: ScreenAdapter.width(10),
                  ),
                  Text("搜索",style: TextStyle(fontSize: ScreenAdapter.fontSize(40)),)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
