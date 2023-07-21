import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:xiaomi_shop/app/modules/product_list/controllers/product_list_controller.dart';
import 'package:xiaomi_shop/app/modules/product_list/views/product_list_page/product_list_position.dart';
import 'package:xiaomi_shop/app/modules/product_list/views/product_list_page/product_list_view.dart';

class ProductListPage extends GetView<ProductListController> {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        ProductListPosition(),
        ProductListView()
      ],
    );
  }
}
