import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../extensions/common.dart';
import '../../../local_storage/shared_preferences_manager.dart';
import '../../../main.dart';
import '../../../models/auth/user_response_model.dart';
import '../../../network/dio_maneger.dart';
import '../../../utils/constants.dart';

part 'my_account_state.dart';

class MyAccountCubit extends Cubit<MyAccountState> {
  MyAccountCubit() : super(MyAccountInitial());
  static MyAccountCubit get(context) => BlocProvider.of(context);
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
  Future<void> logout() async {
    await SharedPreferencesManager.removeData(AppConstants.token);
    await SharedPreferencesManager.removeData(AppConstants.skipBoarding);
    await SharedPreferencesManager.removeData(AppConstants.isLogin);
    await SharedPreferencesManager.removeData(AppConstants.userId);
    await SharedPreferencesManager.removeData(AppConstants.recentSearchList);
    await SharedPreferencesManager.removeData(AppConstants.userId);
    isLogin=false;
    emit(LogoutState());
  }
  Future<void>  deleteUserAccount() async {
    emit(DeleteUserAccountLoadingState());
    Either<String, String> response =
    await dioManager.deleteUserAccount();
    response.fold(
          (left) {
        toast(left.toString());
        emit(DeleteUserAccountErrorState());
      },
          (right) async {
        emit(DeleteUserAccountSuccessState());
        logout();
      },
    );
  }
}
