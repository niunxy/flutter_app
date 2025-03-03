import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:niun/model/index_vm.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

import '../route/routes.dart';
// import './route/fluro.dart';

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (context, child) => MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => MyDataProvider()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            // onGenerateRoute: Application.router.generator,
            onGenerateRoute: Routes.onGenerateRoute,
            initialRoute: RoutePath.home,
          ),
        ),
      ),
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
