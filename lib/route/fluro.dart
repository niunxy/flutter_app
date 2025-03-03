import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:niun/model/index_vm.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import '../pages/tab.dart';
import '../pages/detail.dart';
import '../../config/application.dart';

/* void main(){
  FluroRouter router = FluroRouter();
  Routes.configureRoutes(router);
  Application.router = router;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      title: 'Fluro Demo',
      onGenerateRoute: Application.router.generator,
    );
  } 
} */
class AppComponent extends StatefulWidget {
  @override
  State createState() {
    return AppComponentState();
  }
}

class AppComponentState extends State<AppComponent> {
  AppComponentState() {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
  }

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
            onGenerateRoute: Application.router.generator,
            initialRoute:'/app',
          ),
        ),
      ),
    );
  }
}
/* class Application {
  static late final FluroRouter router;
} */
class Routes {
  static String page_a = '/app';
  static String page_b = '/detail';

  static configureRoutes(FluroRouter router){
    router.define(page_a, 
    handler: Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return TabPage();
    }),);
    router.define(page_b, handler: Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      String id = params["id"]!.first;
      final args = context!.settings?.arguments as Map<String, dynamic>;

      return DetailPage(id: id + args["name"]);
    }),);
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
      return;
    });
  }
}