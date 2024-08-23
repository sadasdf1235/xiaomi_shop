import 'package:dio/dio.dart';
class HttpsClient{
  static String domain = "https://miapp.itying.com";
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

  Future post(String url,{Map? data}) async{
    try{
      final response = await dio.post(url,data: data);
      return response;
    }catch(e){
      print(e);
    }
  }

  static String replaceUrl(String url){
    String s = url.replaceAll("\\", "/");
    String imageUrl = "$domain/$s";
    return imageUrl;
  }
}