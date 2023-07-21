import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:xiaomi_shop/app/models/home/plist_model.dart';
import 'package:xiaomi_shop/app/services/https_client.dart';

class ProductListController extends GetxController {
  //TODO: Implement ProductListController
  HttpsClient request = HttpsClient();
  ScrollController scrollController = ScrollController();
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  /*二级导航数据*/
  List subHeaderList = [
    {
      "id": 1,
      "title": "综合",
      "fileds": "all",
      "sort":
      -1, // 排序     升序：price_1     {price:1}        降序：price_-1   {price:-1}
    },
    {"id": 2, "title": "销量", "fileds": 'salecount', "sort": -1},
    {"id": 3, "title": "价格", "fileds": 'price', "sort": -1},
    {"id": 4, "title": "筛选"}
  ];
  //二级导航选中判断
  RxInt selectHeaderId = 1.obs;
  String sort = "";
  //主要解决的问题是排序箭头无法更新
  RxInt subHeaderListSort=0.obs;
  String keyWords = Get.arguments["keyWords"]??"";

  RxList<PlistItemModel> plistTemp = <PlistItemModel>[].obs;
  int page = 1;
  bool flag = true;
  RxBool hasData = true.obs;

  @override
  void onInit() {
    super.onInit();
    getPlistTemp();
    initScrollerController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void initScrollerController() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >
          scrollController.position.maxScrollExtent - 30) {
        getPlistTemp();
      }
    });
  }

  //获取商品列表数据
  void getPlistTemp() async {
    if (flag && hasData.value) {
      flag = false;
      String url;
      if(Get.arguments["cid"] != null){
        url = "/api/plist?cid=${Get.arguments["cid"]}&page=$page&pageSize=8&sort=$sort";
      }else{
        url = "/api/plist?search=${Get.arguments["keyWords"]}&page=$page&pageSize=8&sort=$sort";
      }
      final response = await request
          .get(url);
      if (response != null) {
        final list = PlistModel.fromJson(response.data).result;
        plistTemp.addAll(list!);
        page++;
        flag = true;
        if (list.length < 8) {
          hasData.value = false;
        }
        update();
      }
    }
  }
  //二级导航改变的时候触发的方法
  void subHeaderChange(id) {
    selectHeaderId.value = id;
    if (id == 4) {
      globalKey.currentState!.openEndDrawer();
      //弹出侧边栏
    } else {
      //改变排序  sort=price_-1     sort=price_1
      sort =
      "${subHeaderList[id - 1]["fileds"]}_${subHeaderList[id - 1]["sort"]}";
      //改变状态
      subHeaderList[id - 1]["sort"]=subHeaderList[id - 1]["sort"]*-1;
      //作用更新状态
      subHeaderListSort.value=subHeaderList[id - 1]["sort"];
      //重置page
      page = 1;
      //重置数据
      plistTemp.value = [];
      //重置hasData
      hasData.value = true;
      //滚动条回到顶部
      scrollController.jumpTo(0);
      //重新请求接口
      getPlistTemp();
    }
  }
}