import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../nav.dart';
import '../../utils/colors.dart';
import '../../utils/styles.dart';

AppBar CustomAppBar({
  required final String title,
  final VoidCallback? onBackButtonPressed,
  final bool startTitle = false,
  final Color? backgroundColor,
  final Color? titleColor,
  final BorderRadiusGeometry? borderRadius,
  final double? height,
  final double? titleSize,
  final TextStyle? styleText,
 // final TypeAppBar? typeAppBar==,
  final bool backIsCircle = false,
  final bool showBack= false,
  final bool showBottom= true,
  final double? widthBackButton,
  final double? heightBackButton,
  final Color? colorBackgroundBack,
  final double? paddingTop,
  final double? elevation,
  final List<Widget>? actions,
}) {
  return AppBar(
    //titleSpacing: titleSpace,
    centerTitle: !startTitle,
    title: Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Text(
        title,
        style: styleText ??TextStyle(
          color:titleColor?? AppColors.colorBlack,
          fontSize: titleSize??19.sp,
          fontWeight: FontManger.medium,
        ),
      ),
    ),
    actions: actions != null
        ? [
            Padding(
              padding: EdgeInsetsDirectional.only(
                top: 10.h,
                end: 15.w,
              ),
              child: Row(
                spacing: 3.w,
                children: List.from(actions),
              ),
            ),
          ]
        : null,
    //automaticallyImplyLeading: showBack,
    backgroundColor: AppColors.colorWhite,
    leading:showBack?Padding(
      padding: EdgeInsets.only(bottom: 3.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomBackButton(
            backIsCircle: backIsCircle,
            onBackButtonPressed: onBackButtonPressed,
            colorBackgroundBack: colorBackgroundBack,
            heightBackButton: heightBackButton,
            widthBackButton: heightBackButton,
          ),
        ],
      ),
    ):null,
    /* InkWell(
      onTap:(){
        //    navigateBack(context1);
      } ,
      child: Icon(
          Icons.arrow_back_ios,
          color: AppColors.colorBlack,
          size: 28.sp),
    ),*/
    shadowColor: AppColors.colorMediumGrayTextForm,
    elevation: elevation??1,
    //systemOverlayStyle: systemUiOverlayStyle,
    bottom:showBottom?Bottom():null,
    // flexibleSpace: flexibleSpace
  );
}

class Bottom extends StatelessWidget implements PreferredSizeWidget {
  const Bottom({
    super.key,

  });
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 20.h,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(20.h);
}

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, this.onBackButtonPressed, required this.backIsCircle, this.widthBackButton, this.heightBackButton, this.colorBackgroundBack});
  final VoidCallback? onBackButtonPressed;
  final bool backIsCircle;
  final double? widthBackButton;
  final double? heightBackButton;
  final Color? colorBackgroundBack;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onBackButtonPressed??(){
        navigateBack(context);
      },
      child: Padding(
        padding:  EdgeInsetsDirectional.only(start: 20.w),
        child: Container(
          width: widthBackButton??40.h,
          height: heightBackButton??40.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: backIsCircle
                ? colorBackgroundBack ?? AppColors.colorWhite
                : AppColors.colorTransparent,
          ),
          child: Icon(
            Icons.arrow_back_rounded,
            color: AppColors.colorMaster,
          ),
        ),
      ),
    );
  }
}
