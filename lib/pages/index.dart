import 'package:flutter/material.dart';
import '../niunIcon.dart';
import './home.dart';
import './discover.dart';
import './my.dart';

class IndexPage extends StatefulWidget {
  IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    int currentIdx = 0;
    List pagesList = [
      HomePage(),
      DiscoverPage(),
      MyPage(),
    ];
    return Scaffold(
      // appBar: AppBar(title: const Text('Flutter layout demo')),
      /* body: SafeArea(
        child: IndexedStack(
        index: currentIdx,
        children: [
          HomePage(),
          DiscoverPage(),
          MyPage(),
        ],
      )), */
      body: SafeArea(
        child:pagesList[currentIdx]
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIdx,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.blueGrey,
        onTap: (int index) {
          currentIdx = index;
          setState(() {
            currentIdx = index;
            print(pagesList[currentIdx]);
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(NiunIcon.zhifudingjin),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '探索',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.send),
            label: '我的',
          ),
        ],
      ),
    );
  }
}
