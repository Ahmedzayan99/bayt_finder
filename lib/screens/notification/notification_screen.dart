import 'package:bayt_finder/screens/notification/cubit/notification_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/appbar/custom_appbar.dart';
import '../../extensions/decorations.dart';
import '../../extensions/loader_widget.dart';
import '../../extensions/text_styles.dart';
import '../../models/notification_model.dart';
import '../../utils/app_common.dart';
import '../../utils/colors.dart';
import '../../utils/images.dart';
import '../no_data_screen.dart';


class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String? realAll = "";

  NotificationResponse? data;

  init() async {
    getMarksRead("");
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> getNotificationDetails(String? id) async {
  //  appStore.setLoading(true);
   /* await notificationDetailsApi(id!).then((value) {
      getMarksRead(realAll);
    //  appStore.setLoading(false);
      setState(() {});
    }).catchError((e) {
    //  appStore.setLoading(false);
      setState(() {});
    });*/
  }

  getMarksRead(String? realAll) async {
    Map? req;
    req = {"type": realAll};
   // appStore.setLoading(true);
  /*  await notificationListApi(req).then((value) {
      data = value;
      //appStore.setLoading(false);
      setState(() {});
    }).catchError((e) {
    //  appStore.setLoading(false);
      log(e.toString());
    });*/
  }

  @override
  Widget build(BuildContext context) {
    NotificationCubit notificationCubit =NotificationCubit.get(context);
    notificationCubit.getNotification();
   return BlocConsumer<NotificationCubit,NotificationState>(builder: (context,state){
     return Scaffold(
         appBar: CustomAppBar(title:"Notification".tr(),  actions: [
           InkWell(
               onTap: () {
                 getMarksRead("markas_read");
                 setState(() {});
               },
               child: Image.asset(AppImage.marksAll, height: 20, width: 20))
         ]),
         body: Stack(
           children: [
             notificationCubit.notification.notificationData != null &&   notificationCubit.notification.notificationData!.isNotEmpty
                 ? ListView.builder(
               physics: BouncingScrollPhysics(),
               shrinkWrap: true,
               padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
               itemCount:   notificationCubit.notification.notificationData!.length,
               itemBuilder: (BuildContext context, int index) {
                 NotificationData mNotification =   notificationCubit.notification.notificationData![index];
                 return InkWell(
                   onTap: (){
                     getNotificationDetails( notificationCubit.notification.notificationData![index].id);
                   },
                   child: Container(
                     padding: EdgeInsets.only(top: 4, bottom: 4),
                     margin: EdgeInsets.only(bottom: 16, top: 0),
                     decoration: boxDecorationWithRoundedCorners(
                         borderRadius: radius(),
                         backgroundColor: AppColors.colorMediumGrayTextForm),
                     child: Column(
                       children: [
                         Row(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             mNotification.data!.image !=null
                                 ? Container(
                               width: 50,
                               height: 50,
                               decoration: boxDecorationWithRoundedCorners(borderRadius: radius(10), backgroundColor:  AppColors.colorMaster),
                               child: Text(mNotification.data!.subject!.isNotEmpty ? mNotification.data!.subject![0].toUpperCase() : '', style: boldTextStyle(color: AppColors.colorMaster, size: 24))
                               ,
                             )
                                 : cachedImage(mNotification.data!.image.toString(), height: 50, width: 50, fit: BoxFit.cover),
                             SizedBox(width: 10.w,),
                             Expanded(
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text(mNotification.data!.subject!, style: boldTextStyle(color: AppColors.colorMaster)),
                                   SizedBox(height: 4.w,),
                                   Text(mNotification.data!.message!, style: secondaryTextStyle(size: 12), maxLines: 2, overflow: TextOverflow.ellipsis),
                                 ],
                               ),
                             ),
                           ],
                         ),
                         Row(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           mainAxisAlignment: MainAxisAlignment.end,
                           children: [
                             Text(mNotification.createdAt!, style: secondaryTextStyle(size: 12)),
                             SizedBox(width: 6.h,),

                             mNotification.readAt !=null ? Icon(Icons.circle, color: Colors.green, size: 6) : SizedBox()
                           ],
                         ),
                       ],
                     ),
                   ),
                 );/*.onTap(() {
                        getNotificationDetails(mNotification.id.toString());
                        NotificationDetailsScreen(mNotificationResponse: mNotification.data!).launch(context);
                      });*/
               },
             )
                 : NoDataScreen(mTitle: "resultNotFound"),
             Center(child: Loader())
           ],
         ));
   }, listener:(context,state){

   });

  }
}
