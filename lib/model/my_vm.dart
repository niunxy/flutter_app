import 'package:flutter/material.dart';

//异步请求方法
class MyViewModel with ChangeNotifier {
  String userName = 'admin';
  // 数据改变后，通知监听者
  notifyListeners();
  setUserName(String value){
    userName = value;
    notifyListeners();
  }
}