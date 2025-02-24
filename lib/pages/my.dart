import 'package:flutter/material.dart';
import '../widget/myDialog.dart';

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

    return SafeArea(
      child: Container(
        height: 400,
        width: double.infinity,
        padding: EdgeInsets.all(20),
        color: Colors.lightGreen,
        child: Stack(children: [
          Positioned(
            child: Container(
              color: Colors.blue,
              height: 100,
              width: 100,
              // decoration: BoxDecoration(
              //   border: Border(
              //     bottom: BorderSide(color: Colors.red, width: 1),
              //   ),
              // ),
            ),
            left: 80,
          ),
          Container(
            color: Colors.yellow,
            height: 80,
            width: 80,
            child: ElevatedButton(
              child: Text("Button"),
              onPressed: _myDialog,
            ),
          ),
        ]),
        // child: MySwiper(),
      ),
    );
  }
}
