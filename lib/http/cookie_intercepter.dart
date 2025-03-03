import 'dart:io';

import 'package:dio/dio.dart';
import 'package:niun/utils/sp_utils.dart';

class CookieInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    SpUtils.getStringList('cookie').then((cookieList) {
      options.headers[HttpHeaders.cookieHeader] = cookieList;
      handler.next(options);
    });
    // super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.requestOptions.path == '') {
      dynamic list = response.headers[HttpHeaders.setCookieHeader];
      List<String> cookieList = [];
      if (list is List) {
        for (String? cookie in list) {
          cookieList.add(cookie ?? '');
          print(cookie);
        }
      }
      SpUtils.setStringList('cookie', cookieList);
    }
    super.onResponse(response, handler);
  }
}