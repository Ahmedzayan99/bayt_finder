
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../local_storage/shared_preferences_manager.dart';
import '../models/auth/city_model.dart';
import '../models/auth/filter_configuration_price_model.dart';
import '../models/auth/otp_login_response.dart';
import '../models/auth/signUp_resonse.dart';
import '../models/category_list_model.dart';
import '../models/dashBoard_response.dart';
import '../models/get_setting_response.dart';
import '../models/user_response.dart';
import '../utils/constants.dart';
import 'dio_client.dart';
import 'dio_exceptions.dart';
import 'endpoints.dart';

class DioManager {
  DioClient dioClient = DioClient(Dio());
  Future<Either<String, SocialLoginResponse>> login({
    required String phone,
  }) async {
    try {
      Response response = await dioClient.post(
        Endpoints.login,
        isJson: false,
        data: {
          "username": phone,
          "login_type": "mobile",
          "user_type": "user",
          "accessToken": phone,
          "contact_number": phone,
          'player_id': SharedPreferencesManager.getStringAsync(PLAYER_ID).toString(),
        },
      );
      if (response.data['status'] == true) {
        return Right(SocialLoginResponse.fromJson(response.data));
      } else {
        return Left(SocialLoginResponse.fromJson(response.data).message.toString());
      }
    } on DioException catch (e) {
      return Left(DioExceptions.fromDioError(e).message);
    }
  }

  Future<Either<String, SignUpResponse>> registerUserAsync({
    required String phone,
    required String firstName,
    required String lastName,
    required String email,
  }) async {
    try {
      Response response = await dioClient.post(
        Endpoints.registerUser,
        isJson: false,
        data: {
          "first_name": firstName,
          "last_name": lastName,
          "username": phone,
          "email":email,
          "login_type": "mobile",
          "user_type": "user",
          "accessToken": phone,
          "contact_number": phone,
          'player_id': SharedPreferencesManager.getStringAsync(PLAYER_ID).toString(),
          "password": phone,
          "status":'active' ,
        },
      );
      return Right(SignUpResponse.fromJson(response.data));
    } on DioException catch (e) {
      return Left(handleDioError(e, ));
      //return Left(DioExceptions.fromDioError(e).message);
    }
  }
  Future<Either<String, GetSettingResponse>> getSettingAsync() async {
    try {
      Response response = await dioClient.get(
        Endpoints.getSetting,
      );
      return Right(GetSettingResponse.fromJson(response.data));
    } on DioException catch (e) {
      return Left(handleDioError(e, ));
      //return Left(DioExceptions.fromDioError(e).message);
    }
  }
  Future<Either<String, UserResponse>> getUserDetailAsync() async {
    try {
      Response response = await dioClient.get(
        Endpoints.getUserDetail,
        queryParameters: {
          "id":SharedPreferencesManager.getStringAsync('userId'),
        }
      );
      return Right(UserResponse.fromJson(response.data));
    } on DioException catch (e) {
      return Left(handleDioError(e, ));
      //return Left(DioExceptions.fromDioError(e).message);
    }
  }
  Future<Either<String, CategoryListModel>> getCategoryAsync() async {
    try {
      Response response = await dioClient.get(
        Endpoints.getCategory,
      );
      return Right(CategoryListModel.fromJson(response.data));
    } on DioException catch (e) {
      return Left(handleDioError(e, ));
      //return Left(DioExceptions.fromDioError(e).message);
    }
  }
  Future<Either<String, DashboardResponse>> dashboardListAsync() async {
    try {
      Response response = await dioClient.post(
        Endpoints.dashboardList,
        //isJson: false,
   /*     data: {
          "latitude": latitude,
          "longitude": latitude,
          "city": city,
       *//*   "player_id":email,*//*
        },*/
      );
      return Right(DashboardResponse.fromJson(response.data));
    } on DioException catch (e) {
      return Left(handleDioError(e, ));
      //return Left(DioExceptions.fromDioError(e).message);
    }
  }
  Future<Either<String, CityModel>> getCity() async {
    try {
      Response response = await dioClient.get(
        Endpoints.getCity,
      );
      return Right(CityModel.fromJson(response.data));
    } on DioException catch (e) {
      return Left(handleDioError(e, ));
      //return Left(DioExceptions.fromDioError(e).message);
    }
  }
  Future<Either<String, FilterConfigurationPriceModel>> filterConfigurationPrice() async {
    try {
      Response response = await dioClient.get(
        Endpoints.filterConfigurationPrice,
      );
      return Right(FilterConfigurationPriceModel.fromJson(response.data));
    } on DioException catch (e) {
      return Left(handleDioError(e, ));
      //return Left(DioExceptions.fromDioError(e).message);
    }
  }
  Future<Either<String, String>> updateUserStatus({
    String? latitude,
    String? longitude,
    String? isAgent,
    String? isBuilder,
    String? interestType,
    String? city,
    String? minBudget,
    String? maxBudget,
  }) async {
    try {
      Response response = await dioClient.post(
        Endpoints.updateUserStatus,
          isJson: false,
          data: {
          "latitude":latitude,
          "longitude":longitude,
          "is_agent":isAgent,
          "is_builder":isBuilder,
          "interest_type":interestType,
          "city":city,
          "min_budget":minBudget,
          "max_budget":maxBudget
        }
      );
      return Right("");
    } on DioException catch (e) {
      return Left(handleDioError(e, ));
      //return Left(DioExceptions.fromDioError(e).message);
    }
  }
}
