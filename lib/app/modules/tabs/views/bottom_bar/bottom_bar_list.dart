import 'package:xiaomi_shop/app/services/ld_icon.dart';
import 'package:flutter/material.dart';
import 'bottom_bar.dart';

List<BottomBar> bottomBarList = [
  BottomBar(title: "首页", icon: Icon(LdIcon.home,color: Colors.black,),iconActive:Icon(LdIcon.home,color: Colors.red,) ),
  BottomBar(title: "分类", icon: Icon(LdIcon.category,color: Colors.black,),iconActive:Icon(LdIcon.category,color: Colors.red,)),
  BottomBar(title: "服务", icon: Icon(LdIcon.give,color: Colors.black,),iconActive:Icon(LdIcon.give,color: Colors.red,)),
  BottomBar(title: "购物车", icon: Icon(LdIcon.cart,color: Colors.black,),iconActive:Icon(LdIcon.cart,color: Colors.red,)),
  BottomBar(title: "我的", icon: Icon(LdIcon.user,color: Colors.black,),iconActive:Icon(LdIcon.user,color: Colors.red,)),
];