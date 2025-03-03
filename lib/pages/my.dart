import 'package:flutter/material.dart';
import 'package:niun/model/index_vm.dart';
import 'package:provider/provider.dart';
import '../widget/myDialog.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class MyPage extends StatefulWidget {
  MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    void _myDialog() {
      showDialog(
          context: context,
          builder: (context) {
            return MyDialog(
              title: '5445',
              content: '465465465',
            );
          });
    }

    return Consumer<MyDataProvider>(
      builder: (context, dataProvider, child) {
        print(dataProvider.myData.userName);
        return SafeArea(
          child: Container(
            height: 400,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.lightGreen,
            child: Stack(children: [
              Positioned(
                left: 80,
                child: Container(
                  color: Colors.blue,
                  height: 100,
                  width: 100,
                  child: Text(dataProvider.myData.userName),
                  // decoration: BoxDecoration(
                  //   border: Border(
                  //     bottom: BorderSide(color: Colors.red, width: 1),
                  //   ),
                  // ),
                ),
              ),
              Container(
                color: Colors.yellow,
                height: 80,
                width: 80,
                child: GestureDetector(
                  child: Icon(Icons.ac_unit),
                  onTap: _myDialog,
                ),
                // ElevatedButton(
                //   child: Text("777"),
                //   onPressed: _myDialog,
                // ),
              ),
            ]),
            // child: MySwiper(),
          ),
        );
      },
    );
  }
}
