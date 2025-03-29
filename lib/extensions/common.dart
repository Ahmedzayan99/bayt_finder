import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:html/parser.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';

enum PageRouteAnimation { Fade, Scale, Rotate, Slide, SlideBottomTop }

void hideKeyboard(context) => FocusScope.of(context).requestFocus(FocusNode());

enum LinkProvider { PLAY_STORE, APPSTORE, FACEBOOK, INSTAGRAM, LINKEDIN, TWITTER, YOUTUBE, REDDIT, TELEGRAM, WHATSAPP, FB_MESSENGER, GOOGLE_DRIVE }

String getSocialMediaLink(LinkProvider linkProvider, {String url = ''}) {
  switch (linkProvider) {
    case LinkProvider.PLAY_STORE:
      return "$playStoreBaseURL$url";
    case LinkProvider.APPSTORE:
      return "$appStoreBaseURL$url";
    case LinkProvider.FACEBOOK:
      return "$facebookBaseURL$url";
    case LinkProvider.INSTAGRAM:
      return "$instagramBaseURL$url";
    case LinkProvider.LINKEDIN:
      return "$linkedinBaseURL$url";
    case LinkProvider.TWITTER:
      return "$twitterBaseURL$url";
    case LinkProvider.YOUTUBE:
      return "$youtubeBaseURL$url";
    case LinkProvider.REDDIT:
      return "$redditBaseURL$url";
    case LinkProvider.TELEGRAM:
      return "$telegramBaseURL$url";
    case LinkProvider.FB_MESSENGER:
      return "$facebookMessengerURL$url";
    case LinkProvider.WHATSAPP:
      return "$whatsappURL$url";
    case LinkProvider.GOOGLE_DRIVE:
      return "$googleDriveURL$url";
  }
}



void toast(
  String? value, {
  ToastGravity? gravity,
  length = Toast.LENGTH_SHORT,
  Color? bgColor,
  Color? textColor,
}) {
  if (value!.isEmpty ) {
  } else {
    Fluttertoast.showToast(
      msg: value,
      gravity: gravity,
      toastLength: length,
      backgroundColor: bgColor??AppColors.colorMaster,
      textColor: textColor??AppColors.colorWhite,
    );
  }
}




