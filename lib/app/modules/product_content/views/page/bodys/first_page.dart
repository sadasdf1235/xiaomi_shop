import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xiaomi_shop/app/modules/product_content/controllers/product_content_controller.dart';
import 'package:xiaomi_shop/app/services/https_client.dart';

import '../../../../../services/screen_adapter.dart';

class FirstPage extends GetView<ProductContentController> {
  final Function showAttr;
  const FirstPage(this.showAttr, {super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.pcontent.value.sId != null
        ? SizedBox(
            key: controller.gk1,
            width: ScreenAdapter.width(1080),
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Image.network(HttpsClient.replaceUrl(controller.pcontent.value.pic!)),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: ScreenAdapter.width(20)),
                  child: Text(
                    controller.pcontent.value.title!,
                    style: TextStyle(fontSize: ScreenAdapter.fontSize(46)),
                  ),
                ),
                SizedBox(
                  height: ScreenAdapter.height(20),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: ScreenAdapter.width(20)),
                  child: Text(
                    controller.pcontent.value.subTitle!,
                    style: TextStyle(fontSize: ScreenAdapter.fontSize(34)),
                  ),
                ),
                SizedBox(
                  height: ScreenAdapter.height(20),
                ),
                SizedBox(
                  height: ScreenAdapter.height(140),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "价格:",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "￥${controller.pcontent.value.price}",
                            style: TextStyle(
                                fontSize: ScreenAdapter.fontSize(86),
                                color: Colors.red),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            "原价: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("￥${controller.pcontent.value.price}",
                              style: TextStyle(
                                fontSize: ScreenAdapter.fontSize(45),
                                decoration: TextDecoration.lineThrough,
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: ScreenAdapter.height(140),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text("已选"),
                          SizedBox(
                            width: ScreenAdapter.width(10),
                          ),
                          InkWell(
                              onTap: () {
                                showAttr();
                              },
                              child: Text("ddasdasdasdadada"))
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.black38,
                        size: ScreenAdapter.height(46),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: ScreenAdapter.height(140),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text("送至"),
                          SizedBox(
                            width: ScreenAdapter.width(10),
                          ),
                          const Text("ddasdasdasdadada")
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.black38,
                        size: ScreenAdapter.height(46),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: ScreenAdapter.height(140),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text("门店"),
                          SizedBox(
                            width: ScreenAdapter.width(10),
                          ),
                          InkWell(
                              onTap: () {
                                Get.bottomSheet(Container(
                                  color: Colors.white,
                                  height: ScreenAdapter.height(1000),
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "111111111111",
                                              style: TextStyle(
                                                  fontSize:
                                                      ScreenAdapter.fontSize(
                                                          45)),
                                            ),
                                            const Text("11111111111"),
                                            const Text("1111111111")
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ));
                              },
                              child: const Text("ddasdasdasdadada"))
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.black38,
                        size: ScreenAdapter.height(46),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: ScreenAdapter.height(140),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text("服务"),
                          SizedBox(
                            width: ScreenAdapter.width(10),
                          ),
                          InkWell(
                              onTap: () {
                                Get.bottomSheet(Container(
                                  color: Colors.white,
                                  height: ScreenAdapter.height(1000),
                                  width: double.infinity,
                                  child: ListView(
                                    children: const [
                                      Text(
                                          "1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111"),
                                    ],
                                  ),
                                ));
                              },
                              child: Image.asset("assets/images/service.png")),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.black38,
                        size: ScreenAdapter.height(46),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        : SizedBox(
            height: ScreenAdapter.height(2400),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ));
  }
}
