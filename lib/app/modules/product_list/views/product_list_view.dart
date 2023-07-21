import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xiaomi_shop/app/modules/product_list/views/product_list_page/product_list_page.dart';
import 'package:xiaomi_shop/app/routes/app_pages.dart';

import '../../../services/screen_adapter.dart';
import '../controllers/product_list_controller.dart';

class ProductListView extends GetView<ProductListController> {
  const ProductListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.globalKey,
      appBar: _appBar(),
      body: const ProductListPage(),
      endDrawer:const Drawer(
        child: DrawerHeader(child: Text("抽屉")),
      ) ,
    );
  }
  PreferredSizeWidget _appBar(){
    return AppBar(
      title: AnimatedContainer(
        duration: const Duration(milliseconds: 600),
        width: ScreenAdapter.width(800),
        height: ScreenAdapter.height(96),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(padding: EdgeInsets.all(ScreenAdapter.width(20)),
          child:InkWell(
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.search),
                    SizedBox(width: ScreenAdapter.width(10),),
                    Text(controller.keyWords??"",style: TextStyle(fontSize: ScreenAdapter.fontSize(40)),)
                  ],
                ),
              ],
            ),
            onTap: (){
              Get.offAndToNamed(Routes.SEARCH);
            },
          ),
        ),
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
      actions: const [
        Text(""),
      ],
    );
  }
}
