import 'dart:async';

import 'package:bayt_finder/extensions/extension_util/widget_extensions.dart';
import 'package:bayt_finder/screens/login/login_screen.dart';
import 'package:bayt_finder/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import '../../local_storage/shared_preferences_manager.dart';
import '../../main.dart';
import '../../nav.dart';
import '../../utils/colors.dart';
import '../language/language_screen.dart';

import '../layout/layout_screen.dart';
import '../walk_through/walk_through_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

   startCircle();
    super.initState();
  }
  startCircle() async {
    Timer(
      const Duration(seconds: 4),
          () {
            if (SharedPreferencesManager.getStringAsync( "token") != null) {
                 navigateFinish(context, LayoutScreen());
            } else {
              if (SharedPreferencesManager.getStringAsync( "local") != null) {
                if (SharedPreferencesManager.getStringAsync( "skipBoarding") != null) {
                 navigateFinish(context, LoginScreen());
                } else {
                  navigateFinish(context, WalkThroughScreen());
                }
              }
              else {
                navigateFinish(context, LanguageScreen());
              }
            }
      },
    );

  }


  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: appStore.isDarkModeOn ? Brightness.light : Brightness.light,
        systemNavigationBarIconBrightness: appStore.isDarkModeOn ? Brightness.light : Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: primaryColor,
        body: Stack(
          children: [
            Image.asset(AppImage.splash, fit: BoxFit.fill).center(),
          ],
        ),
      ),
    );
  }
}




