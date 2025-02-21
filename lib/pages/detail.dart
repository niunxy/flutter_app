import 'package:flutter/material.dart';
class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String? name;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var obj = ModalRoute.of(context)!.settings.arguments;
      if(obj is Map) {
        setState(() {
          name = obj['name']; 
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(name ?? '没有传值'),
    );
  }
}