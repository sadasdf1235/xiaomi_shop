import 'storage.dart';
class SearchServices{
  static setHirstory(String keyWords)async{
    List list = await Storage.getData("searchList")??[];
    if(list!.isNotEmpty){
      var re = list.any((element) => element==keyWords);
      if(re) {
       return;
      }
    }
      list.add(keyWords);
     await Storage.setData("searchList", list);
  }
  static Future<List> getHirstory()async{
    List list = await Storage.getData("searchList")??[];
    return list;
  }
  static deleteHirstory(String keyWords)async{
    List list = await Storage.getData("searchList");
      list.remove(keyWords);
      await Storage.setData("searchList", list);
  }
  static clearHirstory()async{
    await Storage.removeData("searchList");
  }
}