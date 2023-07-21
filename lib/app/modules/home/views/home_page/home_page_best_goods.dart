import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:xiaomi_shop/app/modules/home/controllers/home_controller.dart';
import 'package:xiaomi_shop/app/services/https_client.dart';
import 'package:xiaomi_shop/app/services/ld_title_bar.dart';
import 'package:xiaomi_shop/app/services/screen_adapter.dart';

import '../../../../routes/app_pages.dart';

class HomePageBestGoods extends GetView<HomeController> {
  const HomePageBestGoods({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LdTitleBar(leftTitle: "省心优惠", right: Text(
          "全部优惠",
          style: TextStyle(
            fontSize: ScreenAdapter.fontSize(38),
          ),
        )),
        Container(
          color: const Color.fromRGBO(246, 246, 246, 1),
          padding: EdgeInsets.all(ScreenAdapter.width(26)),
          child: Obx(() => MasonryGridView.count(//瀑布流布局
            crossAxisCount: 2,
            shrinkWrap: true, //自适应
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: ScreenAdapter.width(26),
            crossAxisSpacing: ScreenAdapter.width(26),
            itemCount: controller.bestGoodsList.length,
            itemBuilder: (context, index) {
              var value = controller.bestGoodsList[index];
              return InkWell(
                onTap: (){
                  Get.toNamed(Routes.PRODUCT_CONTENT,arguments: {
                    "id":controller.bestGoodsList[index].sId,
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white
                  ),
                  child: Column(
                    children: [
                      Container(
                        color: const Color.fromRGBO(246, 246, 246, 1),
                        padding: EdgeInsets.all(ScreenAdapter.width(10)),
                        child: Image.network(
                          HttpsClient.replaceUrl(value.pic!)
                            ),
                      ),
                      SizedBox(
                        width:double.infinity,
                        child: Text(
                          value.title!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(
                        width:double.infinity,
                        child: Text(
                          value.subTitle!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(
                        width:double.infinity,
                        child: Text(
                          "￥${value.price!}",
                          textAlign: TextAlign.start,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          )),
        )
      ],
    );
  }
}
