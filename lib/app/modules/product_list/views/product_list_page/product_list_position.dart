import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:xiaomi_shop/app/modules/product_list/controllers/product_list_controller.dart';
import 'package:xiaomi_shop/app/services/screen_adapter.dart';
class ProductListPosition extends GetView<ProductListController> {
  const ProductListPosition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        width: ScreenAdapter.width(1080),
        height: ScreenAdapter.height(120),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              width: ScreenAdapter.width(2),
              color: const Color.fromRGBO(223, 223, 223, 0.9)
            )
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:  controller.subHeaderList.map((value) {
            return Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          0,
                          ScreenAdapter.height(16),
                          0,
                          ScreenAdapter.height(16)),
                      child: Text(
                        "${value["title"]}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: controller.selectHeaderId == value["id"]
                                ? Colors.red
                                : Colors.black54,
                            fontSize: ScreenAdapter.fontSize(32)),
                      ),
                    ),
                    onTap: () {
                      controller.subHeaderChange(value["id"]);
                    },
                  ),
                  _showIcon(value["id"])
                ],
              ),
            );
          }).toList()),
        ),
      );
  }
  //自定义箭头组件
  Widget _showIcon(id) {
    //controller.subHeaderListSort 作用 : 响应式状态  为了改变状态
    if (id == 2 || id == 3 || controller.subHeaderListSort.value==1 || controller.subHeaderListSort.value==-1) {
      if (controller.subHeaderList[id - 1]["sort"] == 1) {
        return const Icon(Icons.arrow_drop_down, color: Colors.black54);
      } else {
        return const Icon(Icons.arrow_drop_up, color: Colors.black54);
      }
    } else {
      return const Text("");
    }
  }
}
