

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../extensions/common.dart';
import '../../../models/get_setting_response.dart';
import '../../../network/dio_maneger.dart';
import '../../../utils/constants.dart';
import '../../category_screen.dart';
import '../../favourite_screen.dart';


import '../../home/home_screen.dart';
import '../../profile_screen.dart';
part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  static LayoutCubit get(context) => BlocProvider.of(context);
  int current = 0;

 List<Widget> screen = [
    HomeScreen(), CategoryScreen(), FavouriteScreen(), ProfileScreen()
  ];
  void changeIndex(int index) {
    current = index;
    emit(AppChangeBottomNavBarState());
  }
  DioManager dioManager=DioManager();

  GetSettingResponse getSettingResponse = GetSettingResponse();
  Future<void> getSetting() async {
    emit(GetSettingLoadingState());
    Either<String, GetSettingResponse> response = await dioManager.getSettingAsync(
    );
    response.fold(
          (left) {
        errorMessage = left;
        toast(left.toString());
        emit(GetSettingErrorState());
      }, (right) async {
      getSettingResponse = right;
      emit(GetSettingSuccessState());
    },
    );
  }
}
