

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../extensions/common.dart';
import '../../../models/get_setting_response.dart';
import '../../../network/dio_maneger.dart';
import '../../favourite/favourite_screen.dart';


import '../../home/home_screen.dart';
import '../../my_account/profile_screen.dart';
import '../../property/property_screen.dart';
part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  static LayoutCubit get(context) => BlocProvider.of(context);
  int current = 0;
  int currentFrom = 0;
 List<Widget> screen = [
    HomeScreen(), PropertyScreen(fromLayout: true,),/*CategoryScreen(),*/ FavouriteScreen(), AccountScreen(),/*ProfileScreen()*/
  ];
  void changeIndex(int index) {
    currentFrom=current;
    current = index;
    print(currentFrom);
    print(current);
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

        toast(left.toString());
        emit(GetSettingErrorState());
      }, (right) async {
      getSettingResponse = right;
      emit(GetSettingSuccessState());
    },
    );
  }
}
