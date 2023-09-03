import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:xiaomi_shop/app/modules/product_content/controllers/product_content_controller.dart';
import 'package:xiaomi_shop/app/modules/product_content/views/page/bodys/first_page.dart';
import 'package:xiaomi_shop/app/modules/product_content/views/page/bodys/second_page.dart';
import 'package:xiaomi_shop/app/modules/product_content/views/page/bodys/third_page.dart';

class ProductContentBody extends GetView<ProductContentController> {
  final Function showAttr;
  final Function subHeader;
  const ProductContentBody(this.showAttr,this.subHeader,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller.scrollController,
      child: Column(
        children: [
          FirstPage(showAttr),
          SecondPage(subHeader),
          const ThirdPage(),
        ],
      ),
    );
  }
}
