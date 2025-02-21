import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../niunIcon.dart';
import '../model/home_vm.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeViewModel viewModel = new HomeViewModel();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
        create: (context) {
          return viewModel;
        },
        child: Scaffold(
          appBar: AppBar(title: Text('5456465')),
          body: Column(
            children: [
              Icon(NiunIcon.zhifudingjin),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/detail',
                      arguments: {'name': 'niuuyun'});
                },
                child: Text('TextButton'),
              ),
              Consumer<HomeViewModel>(builder: (context, vm, child) {
                return Text(vm.str);
              }),
              ProApp(),
              TextButton(
                onPressed: () {
                  viewModel.setStrValue('状态值已经被修改了');
                },
                child: Text('修改状态值'),
              ),
            ],
          ),
        ));
  }
}

class ProApp extends StatelessWidget {
  const ProApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('${Provider.of<HomeViewModel>(context).age}');
  }
}
