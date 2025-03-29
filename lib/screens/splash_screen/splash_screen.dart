import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';


import '../../local_storage/shared_preferences_manager.dart';
import '../../nav.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../language/language_screen.dart';

import '../layout/layout_screen.dart';

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
      const Duration(seconds: 3),
          () {
            if(SharedPreferencesManager.getStringAsync( AppConstants.local) != null){
              navigateFinish( LayoutScreen());
            }else{
              navigateFinish( LanguageScreen());
            }
      },
    );

  }


  @override
    Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.colorWhite,
        body:Center(
          child: Lottie.asset(
            "assets/lottie/splash_animation.json",
            fit: BoxFit.cover,
          ),
        ),
      )
    );
  }
}




