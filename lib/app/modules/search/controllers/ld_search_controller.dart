import 'package:get/get.dart';
import 'package:xiaomi_shop/app/services/search_services.dart';

class LdSearchController extends GetxController {
  //TODO: Implement SearchController

  String keyWords = "";
  RxList hirstoryList = [].obs;
  @override
  void onInit() {
    super.onInit();
    getHirstoryList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  getHirstoryList() async{
    hirstoryList.value = await SearchServices.getHirstory();
    update();
  }
  clearHirstory()async{
    await SearchServices.clearHirstory();
    hirstoryList.value = await SearchServices.getHirstory();
    update();
  }
  deleteHirstory(String keyWords)async{
    await SearchServices.deleteHirstory(keyWords);
    hirstoryList.value = await SearchServices.getHirstory();
    update();
  }
}
