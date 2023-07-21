import 'package:dio/dio.dart';
class HttpsClient{
  static String domain = "https://xiaomi.itying.com";
  static Dio dio = Dio();
  HttpsClient(){
    dio.options.baseUrl = domain;
    dio.options.connectTimeout = const Duration(seconds: 5);
    dio.options.receiveTimeout = const Duration(seconds: 5);
  }
  Future get(String url) async{
    try{
      final response = await dio.get(url);
      return response;
    }catch(e){
      print(e);
    }
  }
  static String replaceUrl(String url){
    String s = url.replaceAll("\\", "/");
    String imageUrl = domain + "/" + s;
    return imageUrl;
  }
}