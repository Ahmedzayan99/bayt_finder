import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';


class FontManger {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;
}

class TextStyles {
  static TextStyle fontPrivacyPolicy = TextStyle(
    color: AppColors.colorMediumGrayText,
    fontSize: 16.sp,
    fontWeight: FontManger.medium,
    decorationStyle: TextDecorationStyle.solid,
    height: 1,
  );
  static TextStyle font18BlackRegular = TextStyle(
      color: AppColors.colorBlack,
      fontSize: 18.sp,
      fontWeight: FontManger.regular);
  static TextStyle font15BlackRegular = TextStyle(
      color: AppColors.colorBlack,
      fontSize: 15.sp,
      fontWeight: FontManger.regular);
  static TextStyle font15MediumBlackRegular = TextStyle(
      color: AppColors.colorMediumBlack,
      fontSize: 15.sp,
      fontWeight: FontManger.regular);
  static TextStyle font15BlackBold = TextStyle(
      color: AppColors.colorBlack,
      fontSize: 15.sp,
      fontWeight: FontManger.bold);
  static TextStyle font19DarkGreyRegular = TextStyle(
    color: AppColors.colorDarkGrey,
    fontSize: 19.sp,
    fontWeight: FontManger.regular,
  );
  static TextStyle font16BlackBold = TextStyle(
      color: AppColors.colorBlack,
      fontSize: 16.sp,
      fontWeight: FontManger.bold);
  static TextStyle font20BlackBold = TextStyle(
      color: AppColors.colorBlack,
      fontSize: 20.sp,
      fontWeight: FontManger.bold);
  static TextStyle font20WhiteRegular = TextStyle(
      color: AppColors.colorWhite,
      fontSize: 20.sp,
      fontWeight: FontManger.regular);
  static TextStyle font20BlackMedium= TextStyle(
      color: AppColors.colorBlack,
      fontSize: 20.sp,
      fontWeight: FontManger.medium);
  static TextStyle font24BlackMedium = TextStyle(
      color: AppColors.colorBlack,
      fontSize: 24.sp,
      fontWeight: FontManger.medium);
  static TextStyle font16BlackMedium = TextStyle(
      color: AppColors.colorBlack,
      fontSize: 16.sp,
      fontWeight: FontManger.medium);
  static TextStyle font16MediumGrayTextMedium = TextStyle(
      color: AppColors.colorMediumGrayText,
      fontSize: 16.sp,
      fontWeight: FontManger.medium);
  static TextStyle font15WhiteBold = TextStyle(
      color: AppColors.colorWhite,
      fontSize: 15.sp,
      fontWeight: FontManger.bold);
  static TextStyle font14ExtraGrayRegular = TextStyle(
      color: AppColors.colorExtraGray,
      fontSize: 16.sp,
      fontWeight: FontManger.regular);
  static TextStyle font28WhiteMedium = TextStyle(
      color: AppColors.colorWhite,
      fontSize: 28.sp,
      fontWeight: FontManger.medium);

  static TextStyle font16WhiteRegular = TextStyle(
      color: AppColors.colorWhite,
      fontSize: 16.sp,
      fontWeight: FontManger.regular);
  static TextStyle font18WhiteBold = TextStyle(
    color: AppColors.colorWhite,
    fontSize: 18.sp,
    fontWeight: FontManger.bold,
  );

  static TextStyle font21BlackRegular = TextStyle(
    color: AppColors.colorBlack,
    fontSize: 21.sp,
    fontWeight: FontManger.regular,
  );
  static TextStyle font15BlackMedium = TextStyle(
    color: AppColors.colorBlack,
    fontSize: 15.sp,
    fontWeight: FontManger.medium,
  );
  static TextStyle font17MasterBold = TextStyle(
    color: AppColors.colorMaster,
    fontSize: 17.sp,
    fontWeight: FontManger.bold,
  );
  static TextStyle font14BlackMedium = TextStyle(
    color: AppColors.colorBlack,
    fontSize: 14.sp,
    fontWeight: FontManger.medium,
  );
  static TextStyle font16BlackRegular = TextStyle(
    color: AppColors.colorBlack,
    fontSize: 16.sp,
    fontWeight: FontManger.regular,
  );

  static TextStyle font16MasterBoldUnderline = TextStyle(
      color: AppColors.colorMaster,
      fontSize: 16.sp,
      decoration: TextDecoration.underline,
      fontWeight: FontManger.bold);
  static TextStyle font18LightBlackRegular = TextStyle(
    color: AppColors.colorLightBlack,
    fontSize: 18.sp,
    fontWeight: FontManger.regular,
  );

}
