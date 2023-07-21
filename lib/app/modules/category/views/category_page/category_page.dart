import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:xiaomi_shop/app/modules/category/controllers/category_controller.dart';
import 'package:xiaomi_shop/app/modules/category/views/category_page/category_page_left.dart';
import 'package:xiaomi_shop/app/modules/category/views/category_page/category_page_right.dart';

class CategoryPage extends GetView<CategoryController> {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CategoryPageLeft(),
        CategoryPageRight()
      ],
    );
  }
}
