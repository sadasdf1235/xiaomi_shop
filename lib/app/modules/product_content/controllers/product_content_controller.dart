import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:xiaomi_shop/app/models/pcontent/pcontent_model.dart';
import 'package:xiaomi_shop/app/services/screen_adapter.dart';
import '../../../services/https_client.dart';

class ProductContentController extends GetxController {
  //TODO: Implement ProductContentController

  ScrollController scrollController = ScrollController();
  List tabList = [
    {
      "id":1,
      "title":"商品"
    },
    {
      "id":2,
      "title":"详情"
    },
    {
      "id":3,
      "title":"推荐"
    },
  ];
  RxDouble opactity = 0.0.obs;
  RxInt selectTabIndex = 1.obs;

  RxBool showTabs = false.obs;
  GlobalKey gk1 = GlobalKey();
  GlobalKey gk2 = GlobalKey();
  GlobalKey gk3 = GlobalKey();
  HttpsClient httpsClient = HttpsClient();
  //详情数据
  var pcontent = PcontentItemModel().obs;
  //已选 弹框
  RxList<PcontentAttrModel> pcontentAttr = <PcontentAttrModel>[].obs;
  //container的位置
  double gk2Position = 0.0;
  double gk3Position = 0.0;
  RxBool showSubHeader = false.obs;

  @override
  void onInit() {
    super.onInit();
    initScrollerController();
    getContent();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  //监听滚动
  initScrollerController(){
    scrollController.addListener(() {
      var pixels = scrollController.position.pixels;
      /*
      只有在元素渲染后，所以不能在onInit中
      手指滑动时，获取位置
       */
      if(gk2Position == 0 && gk3Position == 0){
        //获取的是距离顶部的高度，需要加上滚动条的高度
        getContainerPosition(pixels);
      }
      if(pixels > gk2Position && pixels < gk3Position){
          showSubHeader.value = true;
      }else{
        showSubHeader.value = false;
      }
      if(pixels <= 100){
        opactity.value = pixels / 100;
        showTabs.value = false;
      }else{
        showTabs.value = true;
      }
      update();
    });
  }
  //获取元素位置
  getContainerPosition(pixels){
    RenderBox renderBox1 = gk2.currentContext!.findRenderObject() as RenderBox;
    var h = pixels - (ScreenAdapter.getStatusBarHeight() + ScreenAdapter.height(120));
    gk2Position = renderBox1.localToGlobal(Offset.zero).dy + h;
    RenderBox renderBox2 = gk3.currentContext!.findRenderObject() as RenderBox;
    gk3Position = renderBox2.localToGlobal(Offset.zero).dy + h;
    update();
  }
  //顶部选中
  changeSelectTabIndex(index){
    selectTabIndex.value = index;
    update();
  }
  //获取详情数据
  getContent()async{
    var response = await httpsClient.get("/api/pcontent?id=${Get.arguments["id"]}");
    if(response != null){
      var tempData = Pcontent.fromJson(response.data);
      pcontent.value = tempData.result!;
      pcontentAttr.value = pcontent.value.attr!;
      initAttr(pcontentAttr);
      update();
    }
  }
  //初始化attr数据
  initAttr(List<PcontentAttrModel> attr){
    for(int i = 0; i < attr.length; i++){
      for(int j = 0; j < attr[i].list!.length; j++){
        bool check = j==0?true:false;
        attr[i].attrList!.add({
          "title":attr[i].list![j],
          "checked":check
        });
      }
    }
  }
  //点击切换颜色 cate  颜色    title 玫瑰红
  //排他
  changeAttr(cate, title) {
    for (var i = 0; i < pcontentAttr.length; i++) {
      if (pcontentAttr[i].cate == cate) {
        for (var j = 0; j < pcontentAttr[i].attrList!.length; j++) {
          pcontentAttr[i].attrList![j]["checked"] = false;
          if (pcontentAttr[i].attrList![j]["title"] == title) {
            pcontentAttr[i].attrList![j]["checked"] = true;
          }
        }
      }
    }
    update();
  }
}
