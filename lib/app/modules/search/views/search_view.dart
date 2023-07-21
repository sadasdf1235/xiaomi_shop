import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:xiaomi_shop/app/services/ld_title_bar.dart';
import 'package:xiaomi_shop/app/services/search_services.dart';
import '../../../routes/app_pages.dart';
import '../../../services/screen_adapter.dart';
import '../controllers/ld_search_controller.dart';

class SearchView extends GetView<LdSearchController> {
  const SearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(223, 223, 223, 1),
      appBar: _appBar(),
      body: ListView(
        children: [
          Obx(() => controller.hirstoryList.isNotEmpty
              ? LdTitleBar(
                  leftTitle: "搜索历史",
                  right: IconButton(
                      onPressed: () {
                        Get.bottomSheet(Container(
                          width: ScreenAdapter.width(1080),
                          height: ScreenAdapter.height(360),
                          color: Colors.white,
                          padding: EdgeInsets.all(ScreenAdapter.width(20)),
                          child: Column(
                            children: [
                              const Text("你确定清除历史记录吗?"),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: const Text("取消")),
                                  ElevatedButton(
                                      onPressed: () {
                                        controller.clearHirstory();
                                        Get.back();
                                      },
                                      child: const Text("删除"))
                                ],
                              )
                            ],
                          ),
                        ));
                      },
                      icon: const Icon(Icons.delete)))
              : const Text("")),
          Obx(() => Wrap(
                children: controller.hirstoryList
                    .map((element) => GestureDetector(
                  onLongPress: (){
                    Get.defaultDialog(
                      title: "提示信息",
                      middleText: "你确定要删除吗?",
                      confirm: ElevatedButton(onPressed: (){
                        controller.deleteHirstory(element);
                        Get.back();
                      }, child: const Text("确定")),
                      cancel: ElevatedButton(onPressed: (){Get.back();}, child: const Text("取消")),
                    );
                  },
                      child: Container(
                        padding: EdgeInsets.all(ScreenAdapter.width(20)),
                            margin: EdgeInsets.symmetric(
                                horizontal: ScreenAdapter.width(10)),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(element),
                          ),
                    ))
                    .toList(),
              )),
          SizedBox(
            height: ScreenAdapter.height(20),
          ),
          const LdTitleBar(leftTitle: "猜你想搜", right: Icon(Icons.refresh)),
          Wrap(
            children: [
              Container(
                padding: EdgeInsets.all(ScreenAdapter.width(20)),
                margin:
                    EdgeInsets.symmetric(horizontal: ScreenAdapter.width(10)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text("手机"),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenAdapter.width(40),
                vertical: ScreenAdapter.height(30)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: ScreenAdapter.height(128),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/hot_search.png"),
                          fit: BoxFit.cover)),
                ),
                Container(
                  color: Colors.white,
                  child: GridView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3 / 1,
                        crossAxisSpacing: ScreenAdapter.width(40),
                        mainAxisSpacing: ScreenAdapter.height(20),
                      ),
                      itemBuilder: (ctx, index) {
                        Row(
                          children: [
                            Container(
                              width: ScreenAdapter.width(120),
                              child: Image.network(
                                "src",
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            Expanded(
                                child: Container(
                              child: Text("asddasdasdhjadjakdhakd"),
                            ))
                          ],
                        );
                      }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: AnimatedContainer(
        duration: const Duration(milliseconds: 600),
        width: ScreenAdapter.width(840),
        height: ScreenAdapter.height(96),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: EdgeInsets.all(ScreenAdapter.width(20)),
          child: TextField(
            style: TextStyle(fontSize: ScreenAdapter.fontSize(36)),
            autofocus: true,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(0),
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                )),
            onChanged: (value) {
              controller.keyWords = value;
            },
            onSubmitted: (value) {
              Get.offAndToNamed(Routes.PRODUCT_LIST, arguments: {
                "keyWords": value,
              });
              SearchServices.setHirstory(value);
            },
          ),
        ),
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
      actions: [
        TextButton(
            onPressed: () {
              SearchServices.setHirstory(controller.keyWords);
              Get.offAndToNamed(Routes.PRODUCT_LIST, arguments: {
                "keyWords": controller.keyWords,
              });
            },
            child: const Text("搜索")),
      ],
    );
  }
}
