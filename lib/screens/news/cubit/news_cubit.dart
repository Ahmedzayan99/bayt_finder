import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../extensions/common.dart';
import '../../../models/article_response.dart';
import '../../../network/dio_maneger.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());
  static NewsCubit get(context) => BlocProvider.of(context);
  DioManager dioManager = DioManager();

  ArticleResponse articleResponse =ArticleResponse();
  Future<void> getAllNew() async {
    emit(GetNewsAllLoadingState());
    Either<String, ArticleResponse> response =
    await dioManager.getAllNew();
    response.fold(
          (left) {
        toast(left.toString());
        emit(GetNewsAllErrorState());
      },
          (right) async {
            articleResponse = right;
        emit(GetNewsAllSuccessState());
      },
    );
  }

}
