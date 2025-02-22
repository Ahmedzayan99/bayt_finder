import 'package:bayt_finder/nav.dart';
import 'package:bayt_finder/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../extensions/colors.dart';
import '../main.dart';
import '../utils/colors.dart';

AppBar appBarWidget(
  String title, {
  Widget? titleWidget,
  List<Widget>? actions,
  Color? color,
  bool center = true,
  Color? textColor,
  double titleSpace = 16,
  int textSize = 18,
  bool showBack = true,
  bool showFilter = true,
  bool showCart = true,
  bool centerTitle = true,
  Color? shadowColor,
  Color? bgColor,
  double? elevation,
  Widget? backWidget,
  @Deprecated('Use systemOverlayStyle instead') Brightness? brightness,
  SystemUiOverlayStyle? systemUiOverlayStyle,
  TextStyle? titleTextStyle,
  PreferredSizeWidget? bottom,
  Widget? flexibleSpace,
      void Function()? onTapBack,
  required BuildContext context1,
}) {
  return AppBar(
      titleSpacing: titleSpace,
      centerTitle: centerTitle,
      title: titleWidget ?? Text(title, style: titleTextStyle ?? TextStyle(
        fontSize:19.sp ,
        color: AppColors.colorBlack,
        fontWeight:FontManger.medium,
      )),
      actions: actions,
      automaticallyImplyLeading: showBack,
      backgroundColor: appStore.isDarkModeOn ? bgColor ?? scaffoldColorDark : bgColor ?? whiteColor,
      leading: showBack
          ? backWidget?? InkWell(
            onTap:onTapBack??(){
              navigateBack(context1);
            } ,
            child: Icon(
                Icons.arrow_back_ios,
                color: AppColors.colorBlack,
                size: 28.sp),
          ): null,

      shadowColor: viewLineColor,
      elevation: elevation ?? 0,
      systemOverlayStyle: systemUiOverlayStyle,
      bottom: bottom,
      flexibleSpace: flexibleSpace);
}
