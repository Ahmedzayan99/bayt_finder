import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../extensions/common.dart';
import '../../../models/auth/user_response_model.dart';
import '../../../network/dio_maneger.dart';

part 'top_agencies_state.dart';

class TopAgenciesCubit extends Cubit<TopAgenciesState> {
  TopAgenciesCubit() : super(TopAgenciesInitial());
  static TopAgenciesCubit get(context) => BlocProvider.of(context);
  DioManager dioManager = DioManager();
  String? errorMessage;
  UserResponseModel agenciesDetail = UserResponseModel();
  Future<void> getAgenciesDetail({
    required int id,

  }) async {
    emit(GetAgenciesLoadingState());
    Either<String, UserResponseModel> response =
    await dioManager.getAgencies(id: id);
    response.fold(
          (left) {
        errorMessage = left;
        toast(left.toString());
        emit(GetAgenciesErrorState());
      },
          (right) async {
        agenciesDetail = right;
        // getUSerDetail(userDetail);
        emit(GetAgenciesSuccessState());
      },
    );
  }
}
