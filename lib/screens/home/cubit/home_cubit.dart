import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import '../../../extensions/common.dart';
import '../../../main.dart';
import '../../../models/auth/user_response_model.dart';
import '../../../models/dashBoard_response.dart';
import '../../../network/dio_maneger.dart';
import '../../../utils/app_common.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);
  DioManager dioManager = DioManager();
  String? errorMessage;
  UserResponseModel userDetail = UserResponseModel();
  Future<void> getUserDetail() async {
    emit(GetUserDetailLoadingState());
    Either<String, UserResponseModel> response =
        await dioManager.getUserDetailAsync();
    response.fold(
      (left) {
        errorMessage = left;
        toast(left.toString());
        emit(GetUserDetailErrorState());
      },
      (right) async {
        userDetail = right;
       // getUSerDetail(userDetail);
        emit(GetUserDetailSuccessState());
      },
    );
  }
  Future<void> updateUserStatus({
    String? latitude,
    String? longitude
}) async {
    emit(UpdateUserStatusLoadingState());
    Either<String, String> response = await dioManager.updateUserStatus(
      latitude: latitude,
      longitude: longitude,
    );
    response.fold(
          (left) {
        errorMessage = left;
        toast(left.toString());
        emit(UpdateUserStatusErrorState());
      },
          (right) {
        emit(UpdateUserStatusSuccessState());
      },
    );
  }
  bool permission=false;
  Future<void> getLocation() async {
    if (await checkPermission()) {
      initLocationStream();
    }
  }
  void initLocationStream() async {
    emit(InitLocationStreamLoading());
    await Geolocator.getCurrentPosition().then((value) async {
     if(isLogin){
       updateUserStatus(latitude: value.latitude.toString(),longitude: value.longitude.toString(),);
     }
     permission=true;
  /*       await setLocaleIdentifier(
          SharedPreferencesManager.getStringAsync(AppConstants.local) == "ar" ? 'ar_EG' : 'en_US');
     List<Placemark> placeMarks = await placemarkFromCoordinates(
        value.latitude,
        value.longitude,
      );
      print(placeMarks.first.locality.toString());
      if (placeMarks.isNotEmpty) {
        emit(InitLocationStreamSuccess());
      }*/
    },  onError: (error) {
      toast(error.toString());
      emit(InitLocationStreamError());
    });
  }

  List<MSlider> slider=[];
  List<Category> category=[];
  List<AgentList> agentList=[];
  List<PropertyCity> cityList=[];
 // List<PropertyCity> propertyCity=[];
  //List<Property> property=[];
  Future<void> getDashboardList() async {
    emit(GetCategoryLoadingState());
    Either<String, DashboardResponse> response =
        await dioManager.dashboardListAsync();
    response.fold(
      (left) {
        errorMessage = left;
        toast(left.toString());
        emit(GetCategoryErrorState());
      },
      (right) async {
        slider=right.slider??[];
        category=right.category??[];
        agentList=right.agent??[];
        cityList=right.propertyCity??[];
        appSettingMain=right.appSetting??AppSetting();
        filterConfigurationMain=right.filterConfiguration??FilterConfiguration();
        //getSettingData();
        emit(GetCategorySuccessState());
      },
    );
  }
}
