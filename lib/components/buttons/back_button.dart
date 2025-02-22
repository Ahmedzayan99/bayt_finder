import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../nav.dart';
import '../../utils/colors.dart';

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
            boxShadow: [
              BoxShadow(
                color: AppColors.colorMediumGray,
                spreadRadius: 0.0,
                blurRadius: 6,
              ),
            ],
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
