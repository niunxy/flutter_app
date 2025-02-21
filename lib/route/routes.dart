import 'package:flutter/material.dart';
import '../pages/tab.dart';
import '../pages/detail.dart';

class Routes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.home:
        return pageRoute(TabPage(), settings: settings);
      case RoutePath.detail:
        return pageRoute(DetailPage(), settings: settings);
    }
    return pageRoute(Scaffold(
        body: SafeArea(
            child: Center(
      child: Text('404'),
    ))));
  }

  static MaterialPageRoute pageRoute(Widget page,
      {RouteSettings? settings,
      bool? maintainState,
      bool? fullscreenDialog = false,
      bool? allowSnapshotting}) {
    return MaterialPageRoute(
        builder: (context) => page,
        settings: settings,
        maintainState: maintainState ?? true,
        fullscreenDialog: fullscreenDialog ?? false,
        allowSnapshotting: allowSnapshotting ?? true);
  }
}

// 路由地址
class RoutePath {
  static const String home = '/app'; // 首页
  static const String detail = '/detail'; // 详情
}
