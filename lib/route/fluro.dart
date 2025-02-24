import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

void main{
  Router router = Router();
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
}
class Application {
  static Router router;
}
class Routes {
  static String page_a = '/';
  static String page_b = '/b';

  static configureRoutes(Router router){
    router.define(page_a, handler: null);
    router.define(page_b, handler: null);
    router.notFindHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
        return Scaffold(
        body: SafeArea(
            child: Center(
      child: Text('404'),
    ),),);
      }
    );
  }
}