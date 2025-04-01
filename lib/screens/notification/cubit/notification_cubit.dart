import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../extensions/common.dart';
import '../../../models/article_response.dart';
import '../../../models/notification_model.dart';
import '../../../network/dio_maneger.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());
  static NotificationCubit get(context) => BlocProvider.of(context);
  DioManager dioManager = DioManager();

  NotificationResponse notification =NotificationResponse();
  Future<void> getNotification() async {
    emit(GetNotificationLoadingState());
    Either<String, NotificationResponse> response =
    await dioManager.getNotificationList();
    response.fold(
          (left) {
        toast(left.toString());
        emit(GetNotificationErrorState());
      },
          (right) async {
            notification = right;
        emit(GetNotificationSuccessState());
      },
    );
  }

}
