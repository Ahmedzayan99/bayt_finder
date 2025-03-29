import 'dart:io';

import 'package:bayt_finder/models/map_property_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../local_storage/shared_preferences_manager.dart';
import '../models/article_response.dart';
import '../models/auth/city_model.dart';
import '../models/auth/filter_configuration_price_model.dart';
import '../models/auth/otp_login_response.dart';
import '../models/auth/signUp_resonse.dart';
import '../models/auth/user_response_model.dart';
import '../models/base_response.dart';
import '../models/category_list_model.dart';
import '../models/dashBoard_response.dart';
import '../models/dynamic_model.dart';
import '../models/favourite_property_model.dart';
import '../models/filter_model.dart';
import '../models/get_setting_response.dart';
import '../models/my_properties_model.dart';
import '../models/notification_model.dart';
import '../models/photos_google_map.dart';
import '../models/property_details_model.dart';
import '../models/search_response_model.dart';
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
          "phone_number": phone,
          //"username": phone,
          "login_type": "mobile",
          "user_type": "user",
          // "accessToken": phone,
          // "contact_number": phone,
          'player_id': SharedPreferencesManager.getStringAsync(
              AppConstants.playerId).toString(),
        },
      );
      return Right(SocialLoginResponse.fromJson(response.data));
    } on DioException catch (e) {
      if (e.response != null) {
        return Right(SocialLoginResponse.fromJson(e.response!.data));
      } else {
        return Left(DioExceptions
            .fromDioError(e)
            .message);
      }
    }
  }
  Future<Either<String, String>>  deleteUserAccount() async {
    try {
      Response response = await dioClient.post(
        Endpoints.deleteUserAccount
      );
      return Right("Done");
    } on DioException catch (e) {
      return Left(handleDioError(e));
  }}

  Future<Either<String, SignUpResponse>> registerUserAsync({

    required String firstName,
    required String lastName,
    required String usernameOrCompany,
    required String email,
    required String contactNumber,
    required String countryCode,
    String? phone,
    String? whatsapp,
    String? description,
     File? profileImage,
    required bool isAgent,
  }) async {
    dynamic dataCompany = {
      "is_agent": 1,
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "username": usernameOrCompany,
      "contact_number": contactNumber,
      "accessToken": '$countryCode$contactNumber',
      "country_code": countryCode,
      "whatsapp": whatsapp,
      "description": description,
    if(profileImage !=null)"profile_image":await MultipartFile.fromFile(profileImage.path),
      "login_type": "mobile",
      "user_type": "user",
      'player_id': SharedPreferencesManager.getStringAsync(
          AppConstants.playerId).toString(),
      "status": 'active',
    };
    if (phone != null) {
      dataCompany.addAll({"phone": phone,});
    }
    if (phone != null) {
      dataCompany.addAll({"phone": phone,});
    }
    dynamic dataUser = {
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "username": usernameOrCompany,
      "contact_number": contactNumber,
      "accessToken": '$countryCode$contactNumber',
      "country_code": countryCode,
      if(profileImage !=null)"profile_image":await MultipartFile.fromFile(profileImage.path),
      "login_type": "mobile",
      "user_type": "user",
      'player_id': SharedPreferencesManager.getStringAsync(
          AppConstants.playerId).toString(),
    };
    try {
      Response response = await dioClient.post(
          Endpoints.registerUser,
          isJson: false,
          data: isAgent ? dataCompany : dataUser /*{
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
          "is_agent":'active' ,
          "phone":'active' ,
          "whatsapp":'active' ,
          "description":'active' ,
          "status":'active' ,
        },*/
      );
      return Right(SignUpResponse.fromJson(response.data));
    } on DioException catch (e) {
      return Left(handleDioError(e));
      //return Left(DioExceptions.fromDioError(e).message);
    }
  }
  Future<Either<String, UserResponseModel>> updateProfileCompany({
    required String id,
    required String firstName,
    required String lastName,
    required String displayName,
    required String usernameOrCompany,
    required String email,
    required String contactNumber,
    String? whatsapp,
    String? description,
     File? profileImage,
  }) async {
    dynamic dataCompany = {
      "id": id,
      "first_name": firstName,
      "last_name": lastName,
      "display_name": displayName,
      "email": email,
      "username": usernameOrCompany,
      "contact_number": contactNumber,
      "whatsapp": whatsapp,
      "description": description,
    if(profileImage !=null)"profile_image":await MultipartFile.fromFile(profileImage.path),
    };
    try {
      Response response = await dioClient.post(
          Endpoints.updateProfile,
          isJson: false,
          data:dataCompany
      );
      return Right(UserResponseModel.fromJson(response.data));
    } on DioException catch (e) {
      return Left(handleDioError(e));
    }
  }
  Future<Either<String, UserResponseModel>> updateProfileUser({
    required String id,
    required String firstName,
    required String lastName,
    required String displayName,
    required String username,
    required String email,
    required String contactNumber,
     File? profileImage,
  }) async {
    dynamic dataCompany = {
      "id": id,
      "first_name": firstName,
      "last_name": lastName,
      "display_name": displayName,
      "email": email,
      "username": username,
      "contact_number": contactNumber,
    if(profileImage !=null)"profile_image":await MultipartFile.fromFile(profileImage.path),
    };
    try {
      Response response = await dioClient.post(
          Endpoints.updateProfile,
          isJson: false,
          data:dataCompany
      );
      return Right(UserResponseModel.fromJson(response.data));
    } on DioException catch (e) {
      return Left(handleDioError(e));
    }
  }

  Future<Either<String, GetSettingResponse>> getSettingAsync() async {
    try {
      Response response = await dioClient.get(
        Endpoints.getSetting,
      );
      return Right(GetSettingResponse.fromJson(response.data));
    } on DioException catch (e) {
      return Left(handleDioError(e,));
      //return Left(DioExceptions.fromDioError(e).message);
    }
  }

  Future<Either<String, UserResponseModel>> getUserDetailAsync() async {
    try {
      Response response = await dioClient.get(
          Endpoints.getUserDetail,
      );
      return Right(UserResponseModel.fromJson(response.data));
    } on DioException catch (e) {
      return Left(handleDioError(e,));
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
      return Left(handleDioError(e,));
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
       */ /*   "player_id":email,*/ /*
        },*/
      );
      return Right(DashboardResponse.fromJson(response.data));
    } on DioException catch (e) {
      return Left(handleDioError(e,));
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
      return Left(handleDioError(e,));
      //return Left(DioExceptions.fromDioError(e).message);
    }
  }

  Future<Either<String,
      FilterConfigurationPriceModel>> filterConfigurationPrice() async {
    try {
      Response response = await dioClient.get(
        Endpoints.filterConfigurationPrice,
      );
      return Right(FilterConfigurationPriceModel.fromJson(response.data));
    } on DioException catch (e) {
      return Left(handleDioError(e,));
      //return Left(DioExceptions.fromDioError(e).message);
    }
  }

  Future<Either<String, String>> updateUserStatus({
    String? latitude,
    String? longitude,
    String? interestType,
    String? city,
    String? minBudget,
    String? maxBudget,
  }) async {
    Map<String, dynamic> data = {};
    if (latitude != null) {data.addAll({"latitude": latitude,});}
    if (longitude != null) {data.addAll({"longitude": longitude,});}
    if (interestType != null) {data.addAll({"interest_type": interestType,});}
    if (city != null) {data.addAll({"city": city,});}
      if (minBudget != null) {data.addAll({"min_budget": minBudget,});}
      if (maxBudget != null) {data.addAll({"max_budget": maxBudget});
      }
      try {
        Response response = await dioClient.post(
            Endpoints.updateUserStatus,
            isJson: false,
            data: data,
        );
        return Right("");
      } on DioException catch (e) {
        return Left(handleDioError(e,));
        //return Left(DioExceptions.fromDioError(e).message);
      }
    }
    Future<Either<String, FilterResponse>> filterProperty({
      int? propertyFor,
      String? city,
      int? categoryId,
      String? startPrice,
      String? endPrice,
      String? startAgeOfProperty,
      String? endAgeOfProperty,
      String? bhk,
      int? furnishedType,
    }) async {
      try {
        Response response = await dioClient.post(
            Endpoints.filterProperty,
            isJson: false,
            data: {
             if(propertyFor !=null) "property_for": propertyFor,
              if(city !=null)   "city": city,
              if(categoryId !=null)  "category_id": categoryId,
              if(startPrice !=null)  "start_price": startPrice,
              if(endPrice !=null)  "end_price": endPrice,
              if(startAgeOfProperty !=null)  "start_age_of_property": startAgeOfProperty,
              if(endAgeOfProperty !=null)"end_age_of_property": endAgeOfProperty,
              if(bhk !=null) "bhk":bhk,
              if(furnishedType !=null) "furnished_type": furnishedType,
            }
        );
        return Right(FilterResponse.fromJson(response.data));
      } on DioException catch (e) {
        return Left(handleDioError(e,));
        //return Left(DioExceptions.fromDioError(e).message);
      }
    }
  Future<Either<String, MapPropertyModel>> propertyMap({
   required double latitude,
   required double longitude,
  }) async {
    try {
      Response response = await dioClient.post(
          Endpoints.propertyMap,
          isJson: false,
          data: {
        "latitude": latitude,
          "longitude": longitude,
          }
      );
      return Right(MapPropertyModel.fromJson(response.data));
    } on DioException catch (e) {
      return Left(handleDioError(e,));
      //return Left(DioExceptions.fromDioError(e).message);
    }
  }
    Future<
        Either<String, FavouritePropertyModel>> getFavouriteProperty() async {
      try {
        Response response = await dioClient.get(
          Endpoints.favourite,
        );
        return Right(FavouritePropertyModel.fromJson(response.data));
      } on DioException catch (e) {
        return Left(handleDioError(e,));
        //return Left(DioExceptions.fromDioError(e).message);
      }
    }

    Future<Either<String, EPropertyBaseResponse>> setFavouriteProperty({
      required String propertyId,

    }) async {
      try {
        Response response = await dioClient.post(
            Endpoints.addFavourite,
            isJson: false,
            data: {
              "property_id": propertyId,

            }
        );
        return Right(EPropertyBaseResponse.fromJson(response.data));
      } on DioException catch (e) {
        return Left(handleDioError(e,));
        //return Left(DioExceptions.fromDioError(e).message);
      }
    }
    Future<Either<String, MyPropertiesResponseModel>> getMyProperty() async {
      try {
        Response response = await dioClient.get(
          Endpoints.myProperty,
        );
        return Right(MyPropertiesResponseModel.fromJson(response.data));
      } on DioException catch (e) {
        return Left(handleDioError(e,));
        //return Left(DioExceptions.fromDioError(e).message);
      }
    }
  Future<Either<String, SearchResponse>> searchLocation({
   required String search,
  }) async {
    try {
      Response response = await dioClient.post(
          Endpoints.searchLocation,
          isJson: false,
          data: {
            "search": search,
          }
      );
      return Right(SearchResponse.fromJson(response.data));
    } on DioException catch (e) {
      return Left(handleDioError(e,));
      //return Left(DioExceptions.fromDioError(e).message);
    }
  }
  Future<Either<String, PropertyDetailsModel>> propertyDetail({
    required int id,
  }) async {
    try {
      Response response = await dioClient.post(
        Endpoints.propertyDetail,
        data: {
          "id":id
        }
      );
      return Right(PropertyDetailsModel.fromJson(response.data));
    } on DioException catch (e) {
      return Left(handleDioError(e,));
      //return Left(DioExceptions.fromDioError(e).message);
    }
  }
  Future<Either<String, String>> saveProperty({
     bool updateProperty=false,
     int? propertyId,
    required String name,
    required String categoryId,
    required int propertyFor,
    required String priceDuration,
    required String price,
    required String furnishedType,
    required String sellerType,
    required String ageOfProperty,
    required String maintenance,
    required String securityDeposit,
    required String brokerage,
    required String bhk,
    required String sqft,
    required String description,
    required String country,
    required String state,
    required String city,
    required String cityAR,
    String? cityImage,
    required String latitude,
    required String longitude,
    required String address,
     String? videoUrl,
    required String status,
    required  String premiumProperty,
    required  dynamic propertyImage,
    required  List<dynamic>  propertyGallery,
    required List<AmenityDynamicModel>  amenity ,
  }) async {
  Map<String,dynamic>  dataSent={
    "name":name,
    "category_id":categoryId,
    "property_for":propertyFor,
    if(propertyFor==0||propertyFor==2)"price_duration":priceDuration,
    "price":price,
    "furnished_type":furnishedType,
    "saller_type":sellerType,
    "age_of_property":ageOfProperty,
    "maintenance":maintenance,
    "security_deposit":securityDeposit,
    "brokerage":brokerage,
    "bhk":bhk,
    "sqft":sqft,
    "description":description,
    "country":country,
    "state":state,
    "city":city,
    "city_ar":cityAR,
    "city_image":cityImage !=null?"https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=$cityImage&key=${Endpoints.googleKay}":!propertyImage.toString().contains('https')?await MultipartFile.fromFile(propertyImage.path,filename: "${city}image.jpg"):propertyImage,
    "latitude":latitude,
    "longitude":longitude,
    "address":address,
    "video_url":videoUrl,
    "status":status,
    "premium_property":premiumProperty,
    "property_image":!propertyImage.toString().contains('https')?await MultipartFile.fromFile(propertyImage.path,filename: "propertyImage.jpg"):propertyImage,
  };
  for (var element in amenity) {
    if (element.dynamicAmenityValue!=null) {
      if (element.dynamicAmenityValue is String) {
        dataSent.addAll({"amenity_${element.dynamicAmenityId}" : element.dynamicAmenityValue});
      } else if (element.dynamicAmenityValue is List) {
        List data = [];
        data.add(element.dynamicAmenityValue);
        dataSent.addAll({"amenity_${element.dynamicAmenityId}" : data.toString().replaceAll('[[', '[').replaceAll(']]', ']')});
      }
    }
  }
  for (int i=0;i<=propertyGallery.length-1;i++) {
    dataSent.addAll({"property_gallary[$i]":!propertyGallery[i].toString().contains('https')?await MultipartFile.fromFile(propertyGallery[i].path,filename: "image$i.jpg"):propertyGallery[i]});
  }
    try {
      Response response = await dioClient.post(
          updateProperty? "${Endpoints.propertyUpdate}$propertyId" :Endpoints.addProperty,
        data: dataSent,
        isJson: false,
      );
      print("zayan");
      print(response);
      return Right(response.data['message']);
    }  catch (e) {
      print("zayan2");
      print(e.toString());
      return Left(e.toString());
      //return Left(handleDioError(e,));
      //return Left(DioExceptions.fromDioError(e).message);
    }
  }
  Future<Either<String, String>> propertyDelete({
    required int id,
  }) async {
    try {
      Response response = await dioClient.post(
        "${Endpoints.propertyDelete}$id",
      );
      return Right(response.data['message'].toString());
    } on DioException catch (e) {
      return Left(handleDioError(e,));
      //return Left(DioExceptions.fromDioError(e).message);
    }
  }
  Future<Either<String, UserResponseModel>> getAgencies({
    required int id,
  }) async {
    try {
      Response response = await dioClient.get(
        Endpoints.getAgencies,
        queryParameters: {
          'id':id,
        }
      );
      return Right(UserResponseModel.fromJson(response.data));
    } on DioException catch (e) {
      return Left(handleDioError(e,));
      //return Left(DioExceptions.fromDioError(e).message);
    }
  }
  Future<Either<String, ArticleResponse>> getAllNew() async {
    try {
      Response response = await dioClient.get(
        Endpoints.articleList,
      );
      return Right(ArticleResponse.fromJson(response.data));
    } on DioException catch (e) {
      return Left(handleDioError(e,));
      //return Left(DioExceptions.fromDioError(e).message);
    }
  }
  Future<Either<String, NotificationResponse>> getNotificationList() async {
    try {
      Response response = await dioClient.post(
        Endpoints.notificationList,
      );
      return Right(NotificationResponse.fromJson(response.data));
    } on DioException catch (e) {
      return Left(handleDioError(e,));
      //return Left(DioExceptions.fromDioError(e).message);
    }
  }
  Future<Either<String, NotificationResponse>> notificationDetail({
    required int id,
}) async {
    try {
      Response response = await dioClient.get(
        Endpoints.notificationDetail,
        queryParameters: {
          'id':id
        }
      );
      return Right(NotificationResponse.fromJson(response.data));
    } on DioException catch (e) {
      return Left(handleDioError(e,));
      //return Left(DioExceptions.fromDioError(e).message);
    }
  }
  Future<Either<String, PhotosGoogleMap>> getPhotoGoogle({
    required String placeId,
}) async {
    try {
      Response response = await Dio().get(
        Endpoints.googlePlacePhoto,
        queryParameters: {
          "placeid":placeId,
          "key":Endpoints.googleKay
        },
      );

      return Right(PhotosGoogleMap.fromJson(response.data));
    } on DioException catch (e) {
      return Left(e.toString());
      //return Left(DioExceptions.fromDioError(e).message);
    }
  }
  Future<Either<String, String>> googlePlaceId({
    required String input,
    //required String lng,
}) async {
    try {
      print(input);
      Response response = await Dio().get(
        Endpoints.googlePlaceId,
        queryParameters: {
          "input":input,
          "inputtype":"textquery",
          "fields":"name,place_id,geometry,formatted_address",
          "locationbias":"point:50,10",
          "key":Endpoints.googleKay
        },
      );
      print(response.data);
     // return Right(response.data);
      if(response.data['candidates'].isNotEmpty){
        return Right(response.data['candidates'][0]['place_id'].toString());
      }
      return Left(response.data['status'].toString());
    } on DioException catch (e) {
      return Left(e.toString());
      //return Left(DioExceptions.fromDioError(e).message);
    }
  }
}
