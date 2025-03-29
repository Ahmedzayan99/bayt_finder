import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../local_storage/shared_preferences_manager.dart';

class RequestInterceptor extends Interceptor {
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');
    final accessToken =SharedPreferencesManager.getStringAsync("token");
    options.headers["Authorization"] = 'Bearer $accessToken';
    options.headers["lang"] =SharedPreferencesManager.getStringAsync("local")??'en';
    log('accessToken: => $accessToken');
    super.onRequest(options, handler);
  }
}
