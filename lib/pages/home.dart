import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';
import '../niunIcon.dart';
import '../model/home_vm.dart';
import '../../config/application.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _TabController;
  HomeViewModel viewModel = new HomeViewModel();
  @override
  void initState() {
    super.initState();
    _TabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
        create: (context) {
          return viewModel;
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text('5456465'),
            bottom: TabBar(controller: _TabController, tabs: [
              Tab(
                icon: Icon(NiunIcon.zhifudingjin),
              ),
              Tab(
                icon: Icon(NiunIcon.zhifudingjin),
              ),
            ]),
          ),
          body: TabBarView(
            controller: _TabController,
            children: [
              ListView(
                children: [
                  ListTile(
                    title: Text('11114563825'),
                  ),
                  TextButton(
                    onPressed: () {
                      Application.router.navigateTo(
                        context,
                        '/detail?id=jkjk',
                        routeSettings: RouteSettings(arguments: {'name': '19'}),
                        transition: TransitionType.inFromBottom,
                      );
                      // Navigator.pushNamed(context, '/detail?id=jkjk',
                      //     arguments: {'name': 'llllllll'}, );
                    },
                    child: Text('TextButton'),
                  ),
                  /* InAppWebView(
                    initialUrlRequest:
                        URLRequest(url: WebUri("https://www.google.com")),
                  ), */
                ],
              ),
              ListView(
                children: [
                  ListTile(
                    title: Text('222'),
                  ),
                ],
              ),
            ],
          ),
          /* body: Column(
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
          ), */
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
