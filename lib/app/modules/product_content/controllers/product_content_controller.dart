import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:xiaomi_shop/app/models/pcontent/pcontent_model.dart';
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
      if(pixels <= 100){
        opactity.value = pixels / 100;
        showTabs.value = false;
      }else{
        showTabs.value = true;
      }
      update();
    });
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
