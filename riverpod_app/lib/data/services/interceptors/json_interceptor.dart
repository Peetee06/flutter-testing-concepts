import 'dart:convert';

import 'package:dio/dio.dart';

class JsonInterceptor extends Interceptor {
  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    try {
      response.data = jsonDecode(response.data as String);
    } catch (e) {
      // ignore parsing errors and return original response
    } finally {
      handler.next(response);
    }
  }
}
