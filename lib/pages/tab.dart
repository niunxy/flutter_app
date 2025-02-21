import 'package:flutter/material.dart';
import './home.dart';
import './discover.dart';
import './my.dart';
import './login.dart';
class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int currentIdx = 0;
  List pageList = [HomePage(),DiscoverPage(), Login()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[currentIdx],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          currentIdx = index;
          setState(() {
            currentIdx = index;
          });
        },
        selectedItemColor: Colors.blue,
        currentIndex: currentIdx,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.discord), label: 'Find'),
          BottomNavigationBarItem(icon: Icon(Icons.send), label: 'My'),
        ]
      )
    );
  }
}