import 'package:bayt_finder/local_storage/shared_preferences_manager.dart';
import 'package:bayt_finder/nav.dart';
import 'package:bayt_finder/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../appcontext.dart';
import '../main.dart';
import '../screens/login/login_screen.dart';
import '../utils/colors.dart';
final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
GlobalKey<ScaffoldMessengerState>();
class DioExceptions implements Exception {
  late String message;

  DioExceptions.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = "request Cancelled".tr();
        break;
      case DioExceptionType.connectionTimeout:
        message = "connection timeout".tr();
        break;
      case DioExceptionType.receiveTimeout:
        message = "receive_timeout".tr();
        break;
      case DioExceptionType.badResponse:
        message = _handleError(
          dioError.response?.statusCode,
          dioError.response?.data,
        );
        break;
      case DioExceptionType.sendTimeout:
        message = "send_timeout".tr();
        break;
      case DioExceptionType.unknown:
        if (dioError.message!.contains("SocketException")) {
          message = 'no Internet'.tr();
          break;
        }
        message = "unexpected_error".tr();
        break;
      default:
        message = "something_went_wrong".tr();
        break;
    }
  }

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return 'bad_request'.tr();
      case 401:
        SharedPreferencesManager.removeData(AppConstants.token);
        SharedPreferencesManager.removeData(AppConstants.isLogin);
        SharedPreferencesManager.removeData(AppConstants.userId);
        isLogin=false;
        scaffoldMessengerKey.currentState?.showSnackBar(SnackBar(
          content: Text(
            "You need to login".tr(),
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: AppColors.colorMaster,
          duration: const Duration(seconds: 2),
        ));
        navigateTo(  LoginScreen());
        return 'unauthorized'.tr();
      case 403:
        return 'forbidden'.tr();
      case 404:
        return 'not_found'.tr();
      case 500:
        return 'internal_server_error'.tr();
      case 502:
        return 'bad_gateway'.tr();
      default:
        return 'Oops something went wrong'.tr();
    }
  }

  @override
  String toString() => message;
}
String handleDioError(DioException e,) {
  if(e.response != null){
    try {
      return e.response!.data['message'].toString();
    } catch (_) {
      return "${e.response!.statusMessage}";
    }
  }else if (e.type == DioExceptionType.connectionError ||
      e.type == DioExceptionType.sendTimeout ||
      e.type == DioExceptionType.connectionTimeout
  ) {
    return "No internet connection. Please check your internet connection and try again later.".tr();
  } else if (e.type == DioExceptionType.cancel) {
    return "Request cancelled".tr();
  } else {
    return 'Unknown error'.tr();
  }
}
