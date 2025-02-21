import 'dart:io';

import 'package:dio/dio.dart';
class CookieInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if(response.requestOptions.path == ''){
      dynamic list = response.headers[HttpHeaders.setCookieHeader];
      List<String?> cookieList = [];
      if(list is List) {
        for (String? cookie in list) {
          print(cookie);
        }
      }

    }
    super.onResponse(response, handler);
  }
}