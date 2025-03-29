import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../extensions/common.dart';
import '../../../models/base_response.dart';
import '../../../models/favourite_property_model.dart';
import '../../../models/property_details_model.dart';
import '../../../network/dio_maneger.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavouriteInitial());
  static FavouriteCubit get(context) => BlocProvider.of(context);
  DioManager dioManager = DioManager();
  String? errorMessage;
  List<PropertyDetail>favouriteProperty=[];
  Future<void> getFavouriteProperty() async {
    favouriteProperty=[];
    emit(GetFavouriteLoadingState());
    Either<String, FavouritePropertyModel> response =
    await dioManager.getFavouriteProperty();
    response.fold(
          (left) {
        errorMessage = left;
        toast(left.toString());
        emit(GetFavouriteErrorState());
      },
          (right) async {
            favouriteProperty=right.data!;

        emit(GetFavouriteSuccessState());
      },
    );
  }
  Future<bool> setFavouriteProperty({
    required String propertyId,
  }) async {

    emit(SetFavouriteLoadingState());
    bool isDone=false;
    Either<String, EPropertyBaseResponse> response =
    await dioManager.setFavouriteProperty(
      propertyId: propertyId);
    response.fold(
          (left) {
        errorMessage = left;
        toast(left.toString());
        isDone=false;
        emit(SetFavouriteErrorState());
      }, (right)  {
      toast(right.message.toString());
      isDone=true;
      emit(SetFavouriteSuccessState());
      },
    );
    return isDone;
  }
}
