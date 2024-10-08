import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../widget/passButton.dart';
import '../../../services/screen_adapter.dart';
import '../controllers/pay_controller.dart';

class PayView extends GetView<PayController> {
  const PayView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('去支付'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(ScreenAdapter.width(20)),
        children: [
          Obx(()=>ListView.builder(
              itemCount: controller.payList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      onTap: (){
                          controller.changePayList(index);
                      },
                      leading:
                          Image.network(controller.payList[index]["image"]),
                      title: Text("${controller.payList[index]["title"]}"),
                      trailing: controller.payList[index]["chekced"]
                          ? Icon(Icons.check)
                          : Text(""),
                    ),
                    const Divider()
                  ],
                );
              })),
          SizedBox(
            height: ScreenAdapter.height(200),
          ),
          PassButton(
              text: "支付",
              onPressed: () {
                // print("支付");
                if(controller.payType==0){
                  print("支付宝支付");
                }else{
                  print("微信支付");
                }
                Get.toNamed("/order");
              })
        ],
      ),
    );
  }
}
