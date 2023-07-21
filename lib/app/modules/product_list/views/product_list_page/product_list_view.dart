import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:xiaomi_shop/app/modules/product_list/controllers/product_list_controller.dart';
import 'package:xiaomi_shop/app/services/https_client.dart';
import '../../../../services/screen_adapter.dart';

class ProductListView extends GetView<ProductListController> {
  const ProductListView({Key? key}) : super(key: key);

  Widget _load(){
    return controller.hasData.value?const Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("加载中"),
          CircularProgressIndicator()
        ],
      ),
    ):const Center(child: Text("我是有底线的"));
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.plistTemp.isNotEmpty?ListView.builder(
      controller: controller.scrollController,
      padding: EdgeInsets.only(top: ScreenAdapter.height(140)),
      itemCount: controller.plistTemp.length,
      itemBuilder: (ctx,index){
        final temp = controller.plistTemp[index];
        return Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: ScreenAdapter.width(400),
                    height: ScreenAdapter.height(460),
                    child: Image.network(HttpsClient.replaceUrl(temp.pic!)),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(temp.title!),
                        SizedBox(height: ScreenAdapter.height(20),),
                        Text(temp.subTitle!,),
                        SizedBox(height: ScreenAdapter.height(20),),
                        Row(
                          children: [
                            Expanded(child: Column(
                              children: [
                                Text("111",style: TextStyle(fontSize: ScreenAdapter.fontSize(34)),),
                                Text("2222")
                              ],
                            )),
                            Container(
                              width: ScreenAdapter.width(2),
                              height: ScreenAdapter.height(20),
                              color: Colors.grey,
                            ),
                            Expanded(child: Column(
                              children: [
                                Text("111",style: TextStyle(fontSize: ScreenAdapter.fontSize(34)),),
                                Text("2222")
                              ],
                            )),
                            Container(
                              width: ScreenAdapter.width(2),
                              height: ScreenAdapter.height(20),
                              color: Colors.grey,
                            ),
                            Expanded(child: Column(
                              children: [
                                Text("111",style: TextStyle(fontSize: ScreenAdapter.fontSize(34)),),
                                Text("2222")
                              ],
                            ))
                          ],
                        ),
                        Text("￥${temp.price}元")
                      ],
                    ),
                  )
                ],
              ),
            ),
            controller.plistTemp.length-1 == index ? _load() :const Text(""),
          ],
        );
      },
    ):_load());
  }
}
