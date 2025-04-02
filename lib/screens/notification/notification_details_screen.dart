import 'package:bayt_finder/components/appbar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../extensions/decorations.dart';
import '../../extensions/text_styles.dart';
import '../../models/notification_model.dart';
import '../../utils/app_common.dart';
import '../../utils/colors.dart';

class NotificationDetailsScreen extends StatefulWidget {
  final NotificationModel mNotificationResponse;

  const NotificationDetailsScreen({super.key, required this.mNotificationResponse});

  @override
  State<NotificationDetailsScreen> createState() => _NotificationDetailsScreenState();
}

class _NotificationDetailsScreenState extends State<NotificationDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        appBar: CustomAppBar(title: "",),
        body: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            widget.mNotificationResponse.image ==null
                ? Container(
                    height:  0.3,
                    width: double.infinity,
                    decoration: boxDecorationWithRoundedCorners(borderRadius: radius(10), backgroundColor: AppColors.colorMaster),
                    child: Text(widget.mNotificationResponse.subject!.isNotEmpty ? widget.mNotificationResponse.subject![0].toUpperCase() : '', style: boldTextStyle(color: AppColors.colorMaster, size: 30))
                        ,
                  )
                : cachedImage(widget.mNotificationResponse.image!, height:  0.3, width: double.infinity, fit: BoxFit.fill),
            SizedBox(height: 20.h,),
     
            Text(widget.mNotificationResponse.subject!, style: boldTextStyle(size: 20)),
          /*  HtmlWidget(postContent: widget.mNotificationResponse.message!).paddingSymmetric(horizontal: 10)
        */  ]),
        ),
      ),
    );
  }
}
