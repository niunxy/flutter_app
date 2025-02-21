import 'package:flutter/material.dart';

//异步请求方法
class HomeViewModel with ChangeNotifier {
  String str = '状态管理';
  int age = 18;
  // 数据改变后，通知监听者
  notifyListeners();
  setStrValue(String value){
    str = value;
    notifyListeners();
  }
}
