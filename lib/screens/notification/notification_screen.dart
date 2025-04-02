import 'package:bayt_finder/nav.dart';
import 'package:bayt_finder/screens/notification/cubit/notification_cubit.dart';
import 'package:bayt_finder/screens/notification/notification_details_screen.dart';
import 'package:bayt_finder/utils/decorations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/appbar/custom_appbar.dart';
import '../../extensions/decorations.dart';
import '../../extensions/loader_widget.dart';
import '../../extensions/text_styles.dart';
import '../../models/notification_model.dart';
import '../../utils/app_common.dart';
import '../../utils/colors.dart';
import '../../utils/images.dart';
import '../no_data_screen.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationCubit notificationCubit = NotificationCubit.get(context);
    notificationCubit.getNotification();
    return BlocConsumer<NotificationCubit, NotificationState>(
        builder: (context, state) {
          return Scaffold(
              appBar: CustomAppBar(
                  title: "Notification".tr(),
                  showBack: true,
              ),
              body: Stack(
                children: [
                  if (notificationCubit.notification.notificationData != null) ListView.separated(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          padding: EdgeInsets.all(16.sp),
                          itemCount: notificationCubit
                              .notification.notificationData!.length,
                          itemBuilder: (BuildContext context, int index) {
                            NotificationData mNotification = notificationCubit
                                .notification.notificationData![index];
                            return InkWell(
                           /*   onTap: () {
                                getNotificationDetails(notificationCubit
                                    .notification.notificationData![index].id);
                                navigateTo(NotificationDetailsScreen(mNotificationResponse: notificationCubit
                                    .notification!.notificationData![index].data!));
                              },*/
                              child: Container(
                                padding: EdgeInsets.all(8.sp),
                                decoration:
                                    AppBoxDecoration.decorationWhiteRadius20,
                                child: Column(
                                  spacing: 3.h,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        mNotification.data!.image == null
                                            ? Stack(
                                                alignment:
                                                    AlignmentDirectional.center,
                                                children: [
                                                  SvgPicture.asset(
                                                    AppImage.notificationCur,
                                                  ),
                                                  SvgPicture.asset(
                                                      AppImage.notification2),
                                                ],
                                              )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                                child: cachedImage(
                                                    mNotification.data!.image
                                                        .toString(),
                                                    height: 50.h,
                                                    width: 50.w,
                                                    fit: BoxFit.cover)),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(mNotification.data!.subject!,
                                                  style: boldTextStyle(
                                                      color: AppColors
                                                          .colorMaster)),
                                              SizedBox(
                                                height: 4.w,
                                              ),
                                              Text(mNotification.data!.message!,
                                                  style: secondaryTextStyle(
                                                      size: 12),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(mNotification.createdAt!,
                                            style: secondaryTextStyle(size: 12)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ); /*.onTap(() {
                        getNotificationDetails(mNotification.id.toString());
                        NotificationDetailsScreen(mNotificationResponse: mNotification.data!).launch(context);
                      });*/
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 20.h,
                            );
                          },
                        ),
                  if (notificationCubit.notification.notificationData != null&&notificationCubit.notification.notificationData!.isEmpty)NoDataScreen(mTitle: "Result Not Found".tr()),
                  if (state is GetNotificationLoadingState &&
                      notificationCubit.notification.notificationData == null)
                    Center(child: Loader())
                ],
              ));
        },
        listener: (context, state) {});
  }
}
