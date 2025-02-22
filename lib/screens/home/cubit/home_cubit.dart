import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../../../components/waves_animaiton.dart';
import '../../../extensions/common.dart';
import '../../../local_storage/shared_preferences_manager.dart';
import '../../../main.dart';
import '../../../models/article_model.dart';
import '../../../models/dashBoard_response.dart';
import '../../../models/user_response.dart';
import '../../../network/dio_maneger.dart';
import '../../../utils/app_common.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);
  DioManager dioManager = DioManager();
  String? errorMessage;
  UserResponse userDetail = UserResponse();

  Future<void> getUserDetail() async {
    emit(GetUserDetailLoadingState());
    Either<String, UserResponse> response =
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

  late Timer _timer;
  final GlobalKey<WaveAnimationState> waveAnimationKey =
      GlobalKey<WaveAnimationState>();

  void startTime() {
    _timer = Timer.periodic(Duration(seconds: 20), (timer) {
      waveAnimationKey.currentState?.refresh();
    });
  }

/*  CategoryListModel categoryListModel = CategoryListModel();

  Future<void> getCategory() async {
    emit(GetCategoryLoadingState());
    Either<String, CategoryListModel> response =
        await dioManager.getCategoryAsync();
    response.fold(
      (left) {
        errorMessage = left;
        toast(left.toString());
        emit(GetCategoryErrorState());
      },
      (right) async {
        categoryListModel = right;
        emit(GetCategorySuccessState());
      },
    );
  }*/

  Future<void> getLocation() async {
    if (await checkPermission()) {
      initLocationStream();
    }
  }
bool isLocationLocation=false;
  void initLocationStream() async {
    isLocationLocation=true;
    emit(InitLocationStreamLoading());
    await Geolocator.getCurrentPosition().then((value) async {
      await setLocaleIdentifier(
          SharedPreferencesManager.getStringAsync("local") == "ar" ? 'ar_EG' : 'en_US');
      List<Placemark> placeMarks = await placemarkFromCoordinates(
        value.latitude,
        value.longitude,
      );
      print('cityzayan');
      print(placeMarks.first.locality.toString());
      if (placeMarks.isNotEmpty) {
        await SharedPreferencesManager.saveData(
            'latitude', value.latitude.toString());
        await SharedPreferencesManager.saveData(
            'longitude',  value.longitude.toString());
        await SharedPreferencesManager.saveData(
            'city',  placeMarks.first.locality.toString());
        isLocationLocation=false;
        emit(InitLocationStreamSuccess());
        await getDashboardList();
      }
    },  onError: (error) {
      toast(error.toString());
      isLocationLocation=false;
      emit(InitLocationStreamError());
    });
  }

  List<MSlider> slider=[];
  List<Category> category=[];
  List<AgentList> agentList=[];
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
        appSettingMain=right.appSetting??AppSetting();
        filterConfigurationMain=right.filterConfiguration??FilterConfiguration();
        //getSettingData();
        emit(GetCategorySuccessState());
      },
    );
  }
}
