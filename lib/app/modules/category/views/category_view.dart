import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xiaomi_shop/app/modules/category/views/app_bar/CategoryAppBar.dart';
import 'package:xiaomi_shop/app/modules/category/views/category_page/category_page.dart';

import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: const CategoryPage(),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: const CategoryAppBar(),
      backgroundColor: Colors.white,
      actions: const [
        Icon(
          Icons.message_outlined,
          color: Colors.black54,
        )
      ],
      centerTitle: true,
      elevation: 0,
    );
  }
}
