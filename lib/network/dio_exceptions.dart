import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

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
          message = 'no_internet'.tr();
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
    return " No internet connection. Please check your internet connection and try again later.";
  } else if (e.type == DioExceptionType.cancel) {
    return "Request cancelled";
  } else {
    return 'Unknown error';
  }
}
