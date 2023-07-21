import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xiaomi_shop/app/modules/product_content/controllers/product_content_controller.dart';

import '../../../../../services/screen_adapter.dart';
class ThirdPage extends GetView<ProductContentController> {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: controller.gk3,
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.height(4000),
      color: Colors.yellow,
      child: const Text("推荐"),
    );
  }
}
