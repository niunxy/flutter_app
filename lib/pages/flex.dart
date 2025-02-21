import 'package:flutter/material.dart';
import './mySwiper.dart';

class DiscoverPage extends StatefulWidget {
  DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 400,
        padding: EdgeInsets.all(20),
        color: Colors.lightGreen,
        child: Flex(
            direction: Axis.horizontal, //设置主轴为水平
            mainAxisAlignment: MainAxisAlignment.spaceBetween, //子项水平
            crossAxisAlignment: CrossAxisAlignment.start, //子项竖直,
            children: [
              Container(
                height: 200,
                width: 100,
                color: Colors.red,
              ),
              // Expanded(
              //   flex: 1,
              Container(
                height: 200,
                width: 100,
                color: Colors.yellow,
              ),
              // ),
              Container(
                height: 200,
                width: 100,
                color: Colors.blue,
              ),
            ]),
        // child: MySwiper(),
      ),
    );
  }
}
