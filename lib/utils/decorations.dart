import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';


class AppBoxDecoration {
  static BoxDecoration decorationWhiteRadius20Top = BoxDecoration(
    color: AppColors.colorWhite,
    borderRadius: BorderRadius.vertical(top: Radius.circular(34.r)),
  );
  static BoxDecoration decorationFlushBarLang = BoxDecoration(
    color: AppColors.colorMediumGrayBg,
    borderRadius: BorderRadius.circular(10.r),
    border: Border.all(
      color: AppColors.colorMediumGrayBorder,
      width: 2.w,
    ),
  );
  static BoxDecoration decorationMasterRadius10 = BoxDecoration(
    color: AppColors.colorMaster,
    borderRadius: BorderRadius.circular(10.r),
  );
  static BoxDecoration get cardDecoration => BoxDecoration(
    color: AppColors.colorWhite,
    borderRadius: BorderRadius.circular(10.r),
    boxShadow: [
      BoxShadow(
        color: AppColors.colorBlack.withOpacity(0.05),
        blurRadius: 4.r,
        offset: const Offset(0, 2),
      ),
    ],
  );
  static BoxDecoration tabDecoration(bool isActive) => BoxDecoration(
    color: isActive ? AppColors.black : AppColors.lightGrey,
    borderRadius: BorderRadius.circular(8.sp),
  );
  static BoxDecoration decorationCircleBorder = BoxDecoration(
    color: AppColors.colorMediumMaster,
    shape: BoxShape.circle,
    border: Border.all(color: AppColors.colorBorderMaster, width: 1.5),
  );
  static BoxDecoration decorationWhiteRadius30Bottom = BoxDecoration(
    color: AppColors.colorMaster,
    borderRadius: BorderRadius.vertical(bottom: Radius.circular(34.r)),
  );
  static BoxDecoration decorationWhiteRadius20Shadow = BoxDecoration(
    color: AppColors.colorWhite,
    borderRadius: BorderRadius.circular(20.r),
    boxShadow: [
      BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.25),
        spreadRadius: 1.r,
        blurRadius: 0.r,
      ),
      BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.25),
        spreadRadius: 1.r,
        blurRadius: 4.r,
      ),
      BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.25),
        spreadRadius: 1.r,
        blurRadius: 4.r,
      ),
      BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.25),
        spreadRadius: 1.r,
        blurRadius: 0.r,
      ),
    ],
  );
  static BoxDecoration decorationWhiteRadius20 = BoxDecoration(
    color: AppColors.colorWhite,
    borderRadius: BorderRadius.circular(20.r),
  );

}
