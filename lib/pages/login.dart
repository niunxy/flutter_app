import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? input;
  TextEditingController? inputController;

  @override
  void initState() {
    inputController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Expanded(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              commonInput(labelText: '输入账号'),
              SizedBox(height:20),
              commonInput(labelText: '输入密码'),
              SizedBox(height:60),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 40, right: 40),
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Text(
                  "登陆",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              /* TextField(
                style: const TextStyle(color: Colors.white, fontSize: 14),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 1.5),
                  ),
                  labelText: '输入账号',
                  labelStyle: const TextStyle(color: Colors.white),
                ),
              ), */
            ],
          ),
        ),
      ),
    );
  }

  Widget commonInput(
      {String? labelText,
      TextEditingController? controller,
      ValueChanged<String>? onChanged}) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      style: const TextStyle(color: Colors.white, fontSize: 14),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 1.5),
        ),
        labelText: labelText ?? '输入',
        labelStyle: const TextStyle(color: Colors.white),
      ),
    );
  }
}
