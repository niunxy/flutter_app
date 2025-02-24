import 'package:flutter/material.dart';

class MyDialog extends Dialog {
  String title;
  String content;
  MyDialog({Key? key, required this.title, required this.content})
      : super(key: key);
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(//不然会全屏
        child: Container(
          height: 400,
          width: 400,
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(title),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                          child: const Icon(Icons.close),
                          onTap: () {
                            print('close');
                            // Navigator.of(context).pop();
                          }),
                    ),
                  ],
                ),
              ),
              Divider(),
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                child: Text(content),
              )
            ],
          ),
        ),
      ),
    );
  }
}
