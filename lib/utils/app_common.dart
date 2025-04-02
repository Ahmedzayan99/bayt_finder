import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import '../local_storage/shared_preferences_manager.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../components/permission.dart';
import '../extensions/common.dart';
import '../extensions/text_styles.dart';
import '../nav.dart';
import '../screens/notification/notification_screen.dart';
import 'colors.dart';
import 'constants.dart';
import 'images.dart';




Future<bool> checkPermission() async {
  LocationPermission locationPermission = await Geolocator.requestPermission();
  if (locationPermission == LocationPermission.whileInUse ||
      locationPermission == LocationPermission.always) {
    if (!await Geolocator.isLocationServiceEnabled()) {
      return await Geolocator.openLocationSettings()
          .then((value) => false)
          .catchError((e) => false);
    } else {
      return true;
    }
  } else {
    toast("allow Location Permission".tr());
    await Geolocator.openAppSettings();

    return false;
  }
}
Widget cachedImage(String? url,
    {double? height,
    Color? color,
    double? width,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    bool usePlaceholderIfUrlEmpty = true,
    double? radius}) {
  if (url.toString().isEmpty) {
    return placeHolderWidget(
        height: height,
        width: width,
        fit: fit,
        alignment: alignment,
        radius: radius);
  } else if (url.toString().startsWith('http')) {
    return CachedNetworkImage(
      imageUrl: url!,
      height: height,
      width: width,
      fit: fit,
      color: color,
      alignment: alignment as Alignment? ?? Alignment.center,
      progressIndicatorBuilder: (context, url, progress) {
        return placeHolderWidget(
            height: height,
            width: width,
            fit: fit,
            alignment: alignment,
            radius: radius);
      },
      errorWidget: (_, s, d) {
        return placeHolderWidget(
            height: height,
            width: width,
            fit: fit,
            alignment: alignment,
            radius: radius);
      },
    );
  } else {
    return Image.asset(AppImage.icPlaceholder,
            height: height,
            width: width,
            fit: BoxFit.cover,
            alignment: alignment ?? Alignment.center);
  }
}

Widget commonCacheImageWidget(String? url,
    {double? width, BoxFit? fit, double? height}) {
  if (url.toString().startsWith('http')) {
      return CachedNetworkImage(
        placeholder:
            placeholderWidgetFn() as Widget Function(BuildContext, String)?,
        imageUrl: '$url',
        height: height,
        width: width,
        fit: fit,
      );
  } else {
    return Image.asset(AppImage.icPlaceholder, height: height, width: width, fit: fit);
  }
}

Function(BuildContext, String) placeholderWidgetFn() =>
    (_, s) => placeHolderWidget();

Widget placeHolderWidget(
    {double? height,
    double? width,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    double? radius}) {
  return Image.asset(AppImage.icPlaceholder,
          height: height,
          width: width,
          fit: BoxFit.cover,
          alignment: alignment ?? Alignment.center);
}

void oneSignalData() async {
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  OneSignal.Debug.setAlertLevel(OSLogLevel.none);
  OneSignal.consentRequired(false);
  final permission = await OneSignal.Notifications.permissionNative();
  Permissions.notificationPermissions();
  OneSignal.Notifications.requestPermission(true).then((value) {
  });
  OneSignal.initialize(AppConstants.mOneSignalID);
     OneSignal.User.pushSubscription.addObserver((state) async {
    // OneSignal.User.pushSubscription.optIn();
     await SharedPreferencesManager.saveData(
        AppConstants.playerId, OneSignal.User.pushSubscription.id);
  });
  OneSignal.Notifications.addClickListener((notification) async {
    navigateTo(NotificationScreen());
  });

}

String parseDocumentDate(DateTime dateTime, {bool includeTime = false}) {
  if (includeTime) {
    return DateFormat('dd MMM, yyyy hh:mm a').format(dateTime);
  } else {
    return DateFormat('dd MMM, yyyy').format(dateTime);
  }
}

Future<void> commonLaunchUrl(String url, {bool forceWebView = false}) async {
  await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)
      .then((value) {})
      .catchError((e) {
    toast('${"individual".tr()} $url');
  });
}


class DateDifferenceWidget extends StatelessWidget {
  final DateTime startDate;
  final DateTime endDate;

  const DateDifferenceWidget(
      {super.key, required this.startDate, required this.endDate});

  @override
  Widget build(BuildContext context) {
    Duration difference = endDate.difference(startDate);

    if (difference.inSeconds.abs() < 60) {
      return Text("${difference.inSeconds.abs()} ${"seconds ago".tr()}",
          style: secondaryTextStyle(size: 12));
    } else if (difference.inMinutes.abs() < 60) {
      return Text("${difference.inMinutes.abs()}  ${"minutes ago".tr()}",
          style: secondaryTextStyle(size: 12));
    } else if (difference.inHours.abs() < 24) {
      return Text("${difference.inHours.abs()}  ${"hours ago".tr()}",
          style: secondaryTextStyle(size: 12));
    } else if (difference.inDays.abs() < 30) {
      return Text("${difference.inDays.abs()}  ${"days ago".tr()} ",
          style: secondaryTextStyle(size: 12));
    } else if ((difference.inDays.abs() ~/ 30) < 12) {
      return Text("${difference.inDays.abs() ~/ 30}  ${"months ago".tr()}",
          style: secondaryTextStyle(size: 12));
    } else {
      return Text("${difference.inDays.abs() ~/ 365}  ${"years ago".tr()} ",
          style: secondaryTextStyle(size: 12));
    }
  }
}


Widget fevIconWidget(int? isFavourite, BuildContext context,
    {Color? color,Color? colorIcon, double? padding}) {
  return Container(
    padding: EdgeInsets.all(padding ?? 4.sp),
    decoration:BoxDecoration(
      color:  color ?? AppColors.colorMediumMaster,
      shape: BoxShape.circle
    ),
    child: SvgPicture.asset(isFavourite == 1 ? AppImage.favouriteFill : AppImage.favouriteAct,
        color: colorIcon??AppColors.colorWhite, height: 20.h, width: 20.w),
  );
}
