import 'package:flutter/material.dart';

import './route/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Routes.onGenerateRoute,
      initialRoute: RoutePath.home,
    );
  }
}

/* var routes = {
  '/app': (BuildContext context) {
    return TabPage();
  }
};
var onGenerateRoute = (RouteSettings setting) {
  final String? name = setting.name;
  print(setting.name);
  final Function? pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (setting.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (BuildContext context) =>
              pageContentBuilder(context, arguments: setting.arguments));
      return route;
    } else {
      final Route route = MaterialPageRoute(
          builder: (BuildContext context) => pageContentBuilder(context));
      return route;
    }
  }
}; */
