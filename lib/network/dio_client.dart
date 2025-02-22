import 'dart:developer';

import 'package:bayt_finder/network/reques_iInterceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'endpoints.dart';
import 'exceptions_interceptor.dart';

class DioClient {
  final Dio _dio;
  final bool isSystem;

  DioClient(this._dio, {this.isSystem = false}) {
    _dio
      ..options.baseUrl = Endpoints.baseUrl
      ..options.responseType = ResponseType.json
      ..options.connectTimeout = Duration(seconds: 7)
      ..options.receiveTimeout = Duration(seconds: 7)
      ..options.sendTimeout = Duration(seconds: 7)
      ..interceptors.add(ExceptionInterceptor())
      ..interceptors.add(RequestInterceptor())
      ..interceptors.add(LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        logPrint: (o) => log(o.toString()),
      ))..interceptors.add(RetryInterceptor(
      dio: _dio,
      logPrint: (message)=> log(message.toString()),
      retries: 3, // retry count (optional)
      retryDelays: const [
        Duration(seconds: 1), // wait 1 sec before the first retry
        Duration(seconds: 2), // wait 2 sec before the second retry
        Duration(seconds: 3), // wait 3 sec before the third retry
        Duration(seconds: 4), // wait 4 sec before the fourth retry
      ],
    ),);
  }
  // Get:------------
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      log('Error in GET request: $e');
      rethrow;
    }
  }
  // Post:----------
  Future<Response> post(
    String uri, {
    data,
    bool isJson = true,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    print('data send');
    print(data);

    try {
      final Response response = await _dio.post(
        uri,
        data: isJson ? data : FormData.fromMap(data),
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      log('Error in post request: $e');

      rethrow;
    }
  }
  // Patch:----------
  Future<Response> patch(
    String uri, {
    data,
    bool isJson = true,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.patch(
        uri,
        data: isJson ? data : FormData.fromMap(data),
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      log('Error in patch request: $e');

      rethrow;
    }
  }

  Future<Response> delete(
    String uri, {
    data,
    bool isJson = true,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final Response response = await _dio.delete(
        uri,
        data: isJson ? data : FormData.fromMap(data),
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } catch (e) {
      log('Error in delete request: $e');

      rethrow;
    }
  }
}
