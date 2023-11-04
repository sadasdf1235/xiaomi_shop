import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

import 'package:xiaomi_shop/app/models/home/category_model.dart';
import 'package:xiaomi_shop/app/models/home/focus_model.dart';
import 'package:xiaomi_shop/app/services/https_client.dart';

import '../../../models/home/plist_model.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  ScrollController scrollController = ScrollController();
  HttpsClient request = HttpsClient();
  //是否向下滚动
  RxBool flag = false.obs;
  RxList<FoucsItemModel> swiperList = <FoucsItemModel>[].obs;
  RxList<CategoryItemModel> categoryList = <CategoryItemModel>[].obs;
  RxList<FoucsItemModel> bestSellingSwiperList = <FoucsItemModel>[].obs;
  RxList<PlistItemModel> bestSellingShopList = <PlistItemModel>[].obs;
  RxList<PlistItemModel> bestGoodsList = <PlistItemModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    scrollControllerListener();
    getSwiperList();
    getCategoryList();
    getBestSellingShopList();
    getBestSellingSwiperList();
    getBestGoodsList();
  }

  //ListView的滚动监听
  void scrollControllerListener(){
    scrollController.addListener(() {
      if(scrollController.position.pixels > 10 && scrollController.position.pixels < 30){
        if(flag.value == false){
          flag.value = true;
          update();
        }
      }
      if(scrollController.position.pixels < 10){
        if(flag.value == true){
          flag.value = false;
          update();
        }
      }
    });
  }
  //获取轮播图数据
  void getSwiperList() async{
    final response = await request.get("/api/focus");
    print("发起了请求");
    var focus = FocusModel.fromJson(response.data);
    swiperList.value = focus.result!;
    print("swiper${swiperList.value}");
    update();
  }
  //获取分类数据
  void getCategoryList() async{
    final response = await request.get("/api/bestCate");
    categoryList.value = CategoryModel.fromJson(response.data).result!;
    update();
  }
  //获取热销臻选轮播图数据
  getBestSellingSwiperList() async{
    final response = await request.get("/api/focus?position=2");
    bestSellingSwiperList.value = FocusModel.fromJson(response.data).result!;
    update();
  }
  //获取热销臻选商品数据
  getBestSellingShopList() async{
    final response = await request.get("/api/plist?is_hot=1");
    bestSellingShopList.value = PlistModel.fromJson(response.data).result!;
    update();
  }
  //获取推荐商品数据
  getBestGoodsList() async{
    final response = await request.get("/api/plist?is_best=1");
    bestGoodsList.value = PlistModel.fromJson(response.data).result!;
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
