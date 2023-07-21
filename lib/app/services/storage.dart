import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
class Storage{
  static setData(String key,dynamic value) async{
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }
  static getData(String key) async{
    try{
      var prefs = await SharedPreferences.getInstance();
      return json.decode(prefs.getString(key)!);
    }catch(e){
      print(e);
    }
  }
  static removeData(String key) async{
    var prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
  static clear() async{
    var prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}