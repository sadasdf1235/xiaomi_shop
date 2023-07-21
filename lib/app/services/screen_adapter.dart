import 'package:flutter_screenutil/flutter_screenutil.dart';

//TODO 对screenutil进行封装
class ScreenAdapter{
  static width(num value){
    return value.w;
  }
  static height(num value){
    return value.h;
  }
  static fontSize(num value){
    return value.sp;
  }
  static radius(num value){
    return value.r;
  }
  static getScreenWidht(){
    return 1.sw;
  }
  static getScreenHeight(){
    return 1.sh;
  }
}