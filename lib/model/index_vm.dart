import 'package:flutter/material.dart';
import './home_vm.dart';
import './my_vm.dart';

class MyDataProvider with ChangeNotifier{
  final MyViewModel _myData = MyViewModel();
  final HomeViewModel _homeData = HomeViewModel();
  MyViewModel get myData => _myData;
  HomeViewModel get homeData => _homeData;
}