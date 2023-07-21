import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:xiaomi_shop/app/modules/product_content/controllers/product_content_controller.dart';
import 'package:xiaomi_shop/app/services/screen_adapter.dart';

class ProductContentBottom extends GetView<ProductContentController> {
  final Function showAttr;
  const ProductContentBottom(this.showAttr,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: ScreenAdapter.height(160),
        decoration: BoxDecoration(
          color: Colors.white,
          border:Border(
            top: BorderSide(width: ScreenAdapter.width(2))
          )
        ),
        child: Row(
          children: [
            SizedBox(
              width: ScreenAdapter.width(170),
              child: const Column(
                children: [Icon(Icons.people), Text("客服")],
              ),
            ),
            SizedBox(
              width: ScreenAdapter.width(170),
              child: const Column(
                children: [Icon(Icons.add), Text("收藏")],
              ),
            ),
            SizedBox(
              width: ScreenAdapter.width(170),
              child: const Column(
                children: [Icon(Icons.shopping_cart), Text("购物车")],
              ),
            ),
            Expanded(
                child: SizedBox(
              height: ScreenAdapter.height(120),
              child: ElevatedButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(255, 165, 0, 0.9)),
                  shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(20)))),
                ),
                child: const Text("加入购物车"),
                onPressed: () {
                  showAttr();
                },
              ),
            )),
            Expanded(
                child: SizedBox(
                  height: ScreenAdapter.height(120),
                  child: ElevatedButton(
              style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(253, 1, 0, 0.9)),
                    shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(20))))),
              child: const Text("立即购买"),
              onPressed: () {
                showAttr();
              },
            ),
                )),
          ],
        ),
      ),
    );
  }
}
