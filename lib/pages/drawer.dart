import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex:1,
                  child: DrawerHeader(
                    decoration: BoxDecoration(
                      // color: Colors.blue,
                      image: DecorationImage(
                        image: NetworkImage("https://img1.baidu.com/it/u=1075485717,1628862014&fm=253&fmt=auto?w=500&h=500"),
                        fit: BoxFit.cover,
                        ),
                    ),
                    child: Text('tou'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
