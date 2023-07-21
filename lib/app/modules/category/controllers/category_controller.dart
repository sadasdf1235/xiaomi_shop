import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:xiaomi_shop/app/services/https_client.dart';

import '../../../models/category/pcate_model.dart';
import '../../../models/category/pcate2_model.dart';

class CategoryController extends GetxController {
  //TODO: Implement CategoryController

  HttpsClient request = HttpsClient();

  RxInt selectIndex = 0.obs;
  RxList<PcateItemModel> pcateList = <PcateItemModel>[].obs;
  RxList<Pcate2ItemModel> pcateList2 = <Pcate2ItemModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getPcateList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  //选中
  void changeSelectIndex(int index) {
    selectIndex.value = index;
    getPcateList2(pcateList[index].sId!);
    update();
  }
  //获取一级分类的数据
  getPcateList() async{
    final response = await request.get("/api/pcate");
    pcateList.value = PcateModel.fromJson(response.data).result!;
    getPcateList2(pcateList[0].sId!);
    update();
  }
  //获取二级分类的数据
  getPcateList2(String pid) async{
    final response = await request.get("/api/pcate?pid=$pid");
    pcateList2.value = Pcate2Model.fromJson(response.data).result!;
    update();
  }
}
