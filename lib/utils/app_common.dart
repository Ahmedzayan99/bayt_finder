import 'dart:async';
import 'dart:convert';
import 'package:bayt_finder/network/RestApis.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:geolocator/geolocator.dart';
import '../extensions/extension_util/context_extensions.dart';
import '../extensions/extension_util/string_extensions.dart';
import '../extensions/extension_util/widget_extensions.dart';
import '../extensions/system_utils.dart';
import '../local_storage/shared_preferences_manager.dart';
import '../screens/notification_screen.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../components/permission.dart';
import '../extensions/common.dart';
import '../extensions/decorations.dart';
import '../extensions/extension_util/device_extensions.dart';
import '../extensions/text_styles.dart';
import '../main.dart';
import '../models/user_response.dart';
import '../screens/login/login_screen.dart';
import 'app_config.dart';
import 'colors.dart';
import 'constants.dart';
import 'images.dart';



Widget mSuffixTextFieldIconWidget(String? img) {
  return Image.asset(img.toString(), height: 20, width: 20, color: grayColor)
      .paddingAll(14);
}

/*Future<void> getSettingData() async {
  SharedPreferencesManager.saveData(
      SITE_NAME, appSettingMain.siteName.toString());
  SharedPreferencesManager.saveData(
      SITE_EMAIL, appSettingMain.siteEmail.toString());
  SharedPreferencesManager.saveData(
      SITE_LOGO, appSettingMain.siteLogo.toString());
  SharedPreferencesManager.saveData(
      SITE_FAVICON, appSettingMain.siteFavicon.toString());
  SharedPreferencesManager.saveData(
      SITE_DESCRIPTION, appSettingMain.siteDescription.toString());
  SharedPreferencesManager.saveData(
      SITE_COPYRIGHT, appSettingMain.siteCopyright.toString());
  SharedPreferencesManager.saveData(
      FACEBOOK_URL, appSettingMain.facebookUrl.toString());
  SharedPreferencesManager.saveData(
      INSTAGRAM_URL, appSettingMain.instagramUrl.toString());
  SharedPreferencesManager.saveData(
      TWITTER_URL, appSettingMain.twitterUrl.toString());
  SharedPreferencesManager.saveData(
      LINKED_URL, appSettingMain.linkedinUrl.toString());
  SharedPreferencesManager.saveData(
      CONTACT_EMAIL, appSettingMain.contactEmail.toString());
  SharedPreferencesManager.saveData(
      CONTACT_NUMBER, appSettingMain.contactNumber.toString());
  SharedPreferencesManager.saveData(
      HELP_SUPPORT_URL, appSettingMain.helpSupportUrl.toString());
  SharedPreferencesManager.saveData(
      PRIVACY_POLICY, appSettingMain.helpSupportUrl.toString());
  SharedPreferencesManager.saveData(
      TERMS_CONDITIONS, appSettingMain.helpSupportUrl.toString());
  SharedPreferencesManager.saveData(
      SUBSCRIPTION, appSettingMain.subscription.toString());
}*/

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

/*Future<void> getUSerDetail(value) async {
  appStore.setUserDetail(value);
  appStore.setFirstName(value.data!.firstName.toString());
  appStore.setUserEmail(value.data!.email.toString());
  appStore.setLastName(value.data!.lastName.toString());
  appStore.setUserID(value.data!.id ?? 0);
  appStore.setPhoneNo(value.data!.contactNumber.toString());
  appStore.setUsername(value.data!.username.toString());
  appStore.setDisplayName(value.data!.displayName.toString());
  appStore.setUserImage(value.data!.profileImage.toString());
  appStore.setSubscribe(value.subscriptionDetail!.isSubscribe);
  appStore.setSubscriptionDetail(value.subscriptionDetail!);
  appStore.setAddLimitCount(value.data!.addLimitCount ?? 0);
  appStore.setContactInfo(value.data!.viewLimitCount ?? 0);
  appStore.setAdvertisement(value.data!.advertisementLimit ?? 0);
  SharedPreferencesManager.saveData(
      CONTACT_INFO, value.data!.viewLimitCount.toString());
  SharedPreferencesManager.saveData(
      ADVERTISEMENT, value.data!.advertisementLimit.toString());
  SharedPreferencesManager.saveData(
      ADD_PROPERTY, value.data!.addLimitCount.toString());
  if (value.subscriptionDetail != null &&
      value.subscriptionDetail!.subscriptionPlan != null) {
    appStore.setTotalAdvertisement(value.subscriptionDetail!.subscriptionPlan!
            .packageData!.advertisementLimit ??
        0);
    appStore.setTotalContactInfo(value
            .subscriptionDetail!.subscriptionPlan!.packageData!.propertyLimit ??
        0);
    appStore.setTotalAddLimitCount(value.subscriptionDetail!.subscriptionPlan!
            .packageData!.addPropertyLimit ??
        0);
    SharedPreferencesManager.saveData(
        TOTAL_ADD_PROPERTY,
        value
            .subscriptionDetail!.subscriptionPlan!.packageData!.addPropertyLimit
            .toString());
    SharedPreferencesManager.saveData(
        TOTAL_ADVERTISEMENT,
        value.subscriptionDetail!.subscriptionPlan!.packageData!
            .advertisementLimit
            .toString());
    SharedPreferencesManager.saveData(
        TOTAL_CONTACT_INFO,
        value.subscriptionDetail!.subscriptionPlan!.packageData!.propertyLimit
            .toString());
  }
}*/

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
    return Image.asset(ic_placeholder,
            height: height,
            width: width,
            fit: BoxFit.cover,
            alignment: alignment ?? Alignment.center)
        .cornerRadiusWithClipRRect(radius ?? defaultRadius);
  }
}

Widget commonCacheImageWidget(String? url,
    {double? width, BoxFit? fit, double? height}) {
  if (url.toString().startsWith('http')) {
    if (isMobile) {
      return CachedNetworkImage(
        placeholder:
            placeholderWidgetFn() as Widget Function(BuildContext, String)?,
        imageUrl: '$url',
        height: height,
        width: width,
        fit: fit,
      );
    } else {
      return Image.network(url!, height: height, width: width, fit: fit);
    }
  } else {
    return Image.asset(ic_placeholder, height: height, width: width, fit: fit);
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
  return Image.asset(ic_placeholder,
          height: height,
          width: width,
          fit: BoxFit.cover,
          alignment: alignment ?? Alignment.center)
      .cornerRadiusWithClipRRect(radius ?? defaultRadius);
}

void showInterstitialAds() {
  if (appStore.isSubscribe == 0) {
    // adShow();
  }
}

void loadInterstitialAds() {
  if (appStore.isSubscribe == 0) {
    //createInterstitialAd();
  }
}

void oneSignalData() async {
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  OneSignal.Debug.setAlertLevel(OSLogLevel.none);
  OneSignal.consentRequired(false);
  final permission = await OneSignal.Notifications.permissionNative();
  print("Permission $permission");
  Permissions.notificationPermissions();
  OneSignal.Notifications.requestPermission(true).then((value) {
    print("Accepted permission: $value");
  });
  OneSignal.initialize(mOneSignalID);
     OneSignal.User.pushSubscription.addObserver((state) async {
    // OneSignal.User.pushSubscription.optIn();
    print(
        "AFTER saveOneSignalPlayerId Function ===========${OneSignal.User.pushSubscription.optedIn}");
    await SharedPreferencesManager.saveData(
        "PLAYER_ID", OneSignal.User.pushSubscription.id);
    print(
        "PLAYER ID IS ++>${await SharedPreferencesManager.getStringAsync("PLAYER_ID").toString()}");
    // updatePlayerId();
  });
  OneSignal.Notifications.addClickListener((notification) async {
    var notId = notification.notification.additionalData!["id"];
    if (notId != null) {
   /*
        LoginScreen().launch(getContext1)
       else {
        NotificationScreen().launch(getContext1);
      }*/
    }
  });
    Map req = {
      "player_id":
          SharedPreferencesManager.getStringAsync("PLAYER_ID").toString(),
    };
   // updatePlayerIdApi(req);

}

String parseDocumentDate(DateTime dateTime, {bool includeTime = false}) {
  if (includeTime) {
    return DateFormat('dd MMM, yyyy hh:mm a').format(dateTime);
  } else {
    return DateFormat('dd MMM, yyyy').format(dateTime);
  }
}

String formatDateString(String dateString) {
  DateTime dateTime = DateTime.parse(dateString);

  return dateTime.minute.toString();
}

String formatNumberString(num priceValue) {
  String formattedPrice = NumberFormat('#,##,##0').format(priceValue);

  return formattedPrice;
}

String formatFilterNumberString(double priceValue) {
  String formattedPrice = NumberFormat('#,##,##0').format(priceValue);

  return formattedPrice;
}

Future<void> commonLaunchUrl(String url, {bool forceWebView = false}) async {
  log(url);
  await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)
      .then((value) {})
      .catchError((e) {
    toast('${"individual"} $url');
  });
}

Future<void> launchUrls(String url, {bool forceWebView = false}) async {
  log(url);
  if (!await launchUrl(
    Uri.parse(url),
    // mode: LaunchMode.inAppWebView,
    // webViewConfiguration: const WebViewConfiguration(enableDomStorage: false),
  )) {
    throw 'Could not launch $url';
  }
  // await launchUrl(Uri.parse(url),mode: LaunchMode.inAppWebView,webViewConfiguration: WebViewConfiguration()).catchError((e) {
  //   log(e);
  //   toast('Invalid URL: $url');
  // });
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
      return Text("${difference.inSeconds.abs()} seconds ago",
          style: secondaryTextStyle(size: 12));
    } else if (difference.inMinutes.abs() < 60) {
      return Text("${difference.inMinutes.abs()} minutes ago ",
          style: secondaryTextStyle(size: 12));
    } else if (difference.inHours.abs() < 24) {
      return Text("${difference.inHours.abs()} hours ago",
          style: secondaryTextStyle(size: 12));
    } else if (difference.inDays.abs() < 30) {
      return Text("${difference.inDays.abs()} days ago ",
          style: secondaryTextStyle(size: 12));
    } else if ((difference.inDays.abs() ~/ 30) < 12) {
      return Text("${difference.inDays.abs() ~/ 30} months ago ",
          style: secondaryTextStyle(size: 12));
    } else {
      return Text("${difference.inDays.abs() ~/ 365} years ago ",
          style: secondaryTextStyle(size: 12));
    }
  }
}

String getYoutubeThumbnail(String url) {
  String thumbnail = '';
  String? videoId = YoutubePlayer.convertUrlToId(url);
  thumbnail = "https://img.youtube.com/vi/$videoId/maxresdefault.jpg";
  return thumbnail;
}

Widget fevIconWidget(int? isFavourite, BuildContext context,
    {Color? color, double? padding}) {
  return Container(
    padding: EdgeInsets.all(padding ?? 4),
    decoration: boxDecorationWithRoundedCorners(
        borderRadius: BorderRadius.circular(50),
        backgroundColor: color ?? context.cardColor),
    child: Image.asset(isFavourite == 1 ? ic_favorite_fill : ic_favorite,
        color: primaryColor, height: 20, width: 20),
  );
}

Widget backButtonWidget(BuildContext context, {Function()? onTap}) {
  return InkWell(
    onTap: onTap ??
        () {
          finish(context);
        },
    child: Container(
        alignment: Alignment.center,
        decoration: boxDecorationDefault(
            shape: BoxShape.circle, color: context.cardColor),
        child: Icon(
            appStore.selectedLanguage != 'ar'
                ? MaterialIcons.keyboard_arrow_left
                : MaterialIcons.keyboard_arrow_right,
            size: 30,
            color: primaryColor)),
  );
}

String durationWidget(String? duration) {
  String icon = 'assets/icons/ic_product.png';
  switch (duration.toString().toLowerCase()) {
    case "monthly":
      return 'month';
    case "daily":
      return 'day';
    case "quarterly":
      return '6 month';
    case "yearly":
      return 'year';
  }
  return icon;
}
