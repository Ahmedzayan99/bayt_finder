import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/colors.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    hoverColor: Colors.transparent,
    useMaterial3: false,
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.transparent),
    scaffoldBackgroundColor: AppColors.colorBGSheet,
    primaryColor: AppColors.colorMaster,
    iconTheme: IconThemeData(color: Colors.black),
    dividerColor: AppColors.colorMediumGrayTextForm,
    appBarTheme: AppBarTheme(
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark, statusBarColor: Colors.transparent),
    ),
   /* checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(borderRadius: radius(20), side: BorderSide(width: 1, color: AppColors.colorMaster)),
      checkColor: WidgetStateProperty.all(Colors.white),
      fillColor: WidgetStateProperty.all(AppColors.colorMaster),
      materialTapTargetSize: MaterialTapTargetSize.padded,
    ),*/
   // textTheme: GoogleFonts.latoTextTheme(),
    pageTransitionsTheme: PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    fontFamily: 'Rubik',
  );

}
