import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:xiaomi_shop/app/modules/home/controllers/home_controller.dart';
import '../../../../routes/app_pages.dart';
import '../../../../services/ld_icon.dart';
import '../../../../services/screen_adapter.dart';
class HomeAppBar extends GetView<HomeController> {
  const HomeAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      child: Obx(() => AppBar(
        leading: controller.flag.value
            ? const Text('')
            : const Icon(
          LdIcon.xiaomi,
          color: Colors.white,
        ),
        leadingWidth:
        controller.flag.value ? 0 : ScreenAdapter.width(140),
        title: InkWell(
          onTap: (){
            Get!.toNamed(Routes.SEARCH);
          },
          child: Obx(() => AnimatedContainer(
            duration: const Duration(milliseconds: 600),
            width: controller.flag.value
                ? ScreenAdapter.width(800)
                : ScreenAdapter.width(620),
            height: ScreenAdapter.height(96),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(padding: EdgeInsets.all(ScreenAdapter.width(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.search),
                      SizedBox(width: ScreenAdapter.width(10),),
                      Text("搜索",style: TextStyle(fontSize: ScreenAdapter.fontSize(40)),)
                    ],
                  ),
                  const Icon(LdIcon.qr,)
                ],
              ),
            ),
          )),
        ),
        backgroundColor:
        controller.flag.value ? Colors.white : Colors.transparent,
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.qr_code,
              color: controller.flag.value
                  ? Colors.black87
                  : Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.message,
              color: controller.flag.value
                  ? Colors.black87
                  : Colors.white,
            ),
          ),
        ],
      )),
    );
  }
}
