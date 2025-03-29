import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../extensions/common.dart';
import '../../../models/filter_model.dart';
import '../../../models/property_details_model.dart';
import '../../../network/dio_maneger.dart';

part 'property_state.dart';

class PropertyCubit extends Cubit<PropertyState> {
  PropertyCubit() : super(PropertyInitial());
  static PropertyCubit get(context) => BlocProvider.of(context);
  DioManager dioManager = DioManager();
  String? errorMessage;
  List<PropertyDetail> property=[];
  String title='Property';
  Future<void> filterProperty({
    int? categoryId,
    String? city,
    String? titleScreen,
  }) async {
    property=[];
    if(titleScreen != null){
      title=titleScreen;
    }else{
      title="property";

    }
    emit(FilterPropertyLoadingState());
    Either<String, FilterResponse> response =
    await dioManager.filterProperty(
      categoryId: categoryId,
        city:city,
    );
    response.fold(
          (left) {
        errorMessage = left;
        toast(left.toString());
        emit(FilterPropertyErrorState());
      },
          (right) {
            property= right.property!;

        emit(FilterPropertySuccessState());
      },
    );
  }
  PropertyDetailsModel propertyDetailsModel=PropertyDetailsModel();

  Future<void> propertyDetail({
    required int id,

  }) async {
    propertyDetailsModel=PropertyDetailsModel();
    emit(PropertyDetailLoadingState());
    Either<String, PropertyDetailsModel> response =
    await dioManager.propertyDetail(
     id: id
    );
    response.fold(
          (left) {
        errorMessage = left;
        toast(left.toString());
        emit(PropertyDetailErrorState());
      },
          (right) {
            propertyDetailsModel= right;
        emit(PropertyDetailSuccessState());
      },
    );
  }
  String thumbnail = '';

  String getYoutubeThumbnail(String url) {
    String? videoId = YoutubePlayer.convertUrlToId(url);
    thumbnail = "https://img.youtube.com/vi/$videoId/maxresdefault.jpg";
    return thumbnail;
  }
  BitmapDescriptor? currentMarker;

  Future<bool> convertMarkerImage() async {
    currentMarker = await BitmapDescriptor.asset(
         ImageConfiguration(),"assets/image/icon_hoase_map.png");
    if (currentMarker != null) {
      return true;
    } else {
      return false;
    }
  }


}
