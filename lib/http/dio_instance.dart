import 'dart:io';

import 'package:dio/dio.dart';
import 'package:niun/http/interceptor.dart';

class DioInstance {
  static DioInstance? _instance;
  DioInstance._();
  static DioInstance instance() {
    return _instance ??= DioInstance._();
  }

  final Dio _dio = Dio();
  final _defaultTime = const Duration(seconds: 30);
  void initDio(
      {required String baseUrl,
      String? httpMethod = "GET",
      connectTimeout,
      receiveTimeout,
      sendTimeout,
      ResponseType? responseType = ResponseType.json,
      contentType}) {
    _dio.options = BaseOptions(
        method: httpMethod,
        baseUrl: baseUrl,
        connectTimeout: connectTimeout ?? _defaultTime,
        receiveTimeout: receiveTimeout ?? _defaultTime,
        sendTimeout: sendTimeout ?? _defaultTime,
        responseType: responseType,
        contentType: contentType);
    _dio.interceptors.add(ResponseInterceptor());
  }

  Future<Response> get({
    required String path,
    Map<String, dynamic>? param,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return await _dio.get(
      path,
      queryParameters: param,
      options: options ??
          Options(
            method: "GET",
            receiveTimeout: _defaultTime,
            sendTimeout: _defaultTime,
          ),
      cancelToken: cancelToken,
    );
  }

  Future<Response> post({
    required String path,
    Object? data,
    Map<String, dynamic>? param,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return await _dio.post(
      path,
      queryParameters: param,
      data: data,
      options: options ??
          Options(
            method: "GET",
            receiveTimeout: _defaultTime,
            sendTimeout: _defaultTime,
          ),
      cancelToken: cancelToken,
    );
  }
}
// DioInstance.instance.get('/login');


// 入口主函数调用
// DioInstance.instance.initDio(baseUrl: 'http://localhost:8080/api');