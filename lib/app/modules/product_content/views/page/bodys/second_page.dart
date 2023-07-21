import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xiaomi_shop/app/modules/product_content/controllers/product_content_controller.dart';

import '../../../../../services/screen_adapter.dart';
class SecondPage extends GetView<ProductContentController> {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: controller.gk2,
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.height(3000),
      color: Colors.green,
      child: const Text("详情"),
    );
  }
}
