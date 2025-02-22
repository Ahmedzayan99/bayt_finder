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
  static TextStyle font15BlackBold = TextStyle(
      color: AppColors.colorBlack,
      fontSize: 15.sp,
      fontWeight: FontManger.bold);
  static TextStyle font16BlackBold = TextStyle(
      color: AppColors.colorBlack,
      fontSize: 16.sp,
      fontWeight: FontManger.bold);
  static TextStyle font20BlackBold = TextStyle(
      color: AppColors.colorBlack,
      fontSize: 24.sp,
      fontWeight: FontManger.bold);
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
  static TextStyle font14ExtraGrayMedium = TextStyle(
      color: AppColors.colorExtraGray,
      fontSize: 14.sp,
      fontWeight: FontManger.medium);
  static TextStyle font28WhiteMedium = TextStyle(
      color: AppColors.colorWhite,
      fontSize: 28.sp,
      fontWeight: FontManger.medium);

  static TextStyle font26WhiteMedium = TextStyle(
      color: AppColors.colorWhite,
      fontSize: 26.sp,
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

  static TextStyle font20MasterBold = TextStyle(
    color: AppColors.colorMaster,
    fontSize: 20.sp,
    fontWeight: FontManger.bold,
  );
  static TextStyle font20GrayRegular = TextStyle(
    color: AppColors.colorGray,
    fontSize: 20.sp,
    fontWeight: FontManger.regular,
  );
  static TextStyle font26BlackGrayRegular = TextStyle(
    color: AppColors.colorBlackGray,
    fontSize: 16.sp,
    fontWeight: FontManger.regular,
  );
  static TextStyle font21WhiteBold = TextStyle(
    color: AppColors.colorWhite,
    fontSize: 21.sp,
    fontWeight: FontManger.bold,
  );
  static TextStyle font21MediumGrayRegular = TextStyle(
    color: AppColors.colorMediumGray,
    fontSize: 21.sp,
    fontWeight: FontManger.regular,
  );
  static TextStyle font14MediumGrayMedium = TextStyle(
    color: AppColors.colorMediumGray,
    fontSize: 14.sp,
    fontWeight: FontManger.medium,
  );
  static TextStyle font21BlackRegular = TextStyle(
    color: AppColors.colorBlack,
    fontSize: 21.sp,
    fontWeight: FontManger.regular,
  );
  static TextStyle font18LightGreyRegular = TextStyle(
    color: AppColors.colorLightGray,
    fontSize: 18.sp,
    fontWeight: FontManger.regular,
  );
  static TextStyle font25LightGreyRegular = TextStyle(
    color: AppColors.colorLightGray,
    fontSize: 25.sp,
    fontWeight: FontManger.regular,
  );
  static TextStyle font25MasterRegular = TextStyle(
    color: AppColors.colorMaster,
    fontSize: 25.sp,
    fontWeight: FontManger.regular,
  );
  static TextStyle font15LightGreyRegular = TextStyle(
    color: AppColors.colorLightGray,
    fontSize: 15.sp,
    fontWeight: FontManger.regular,
  );
  static TextStyle font14GreyTextRegular = TextStyle(
    color: AppColors.colorGreyText,
    fontSize: 14.sp,
    fontWeight: FontManger.regular,
  );
  static TextStyle font12LightGreyRegular = TextStyle(
    color: AppColors.colorLightGray,
    fontSize: 12.sp,
    fontWeight: FontManger.regular,
  );
  static TextStyle font15BlackMedium = TextStyle(
    color: AppColors.colorBlack,
    fontSize: 15.sp,
    fontWeight: FontManger.medium,
  );
  static TextStyle font19DarkGreyBold = TextStyle(
    color: AppColors.colorDarkGrey,
    fontSize: 19.sp,
    fontWeight: FontManger.bold,
  );
  static TextStyle font19WhiteBold = TextStyle(
    color: AppColors.colorWhite,
    fontSize: 19.sp,
    fontWeight: FontManger.bold,
  );
  static TextStyle font19GreenMedium = TextStyle(
    color: AppColors.colorGreen,
    fontSize: 19.sp,
    fontWeight: FontManger.medium,
  );
  static TextStyle font17MasterBold = TextStyle(
    color: AppColors.colorMaster,
    fontSize: 17.sp,
    fontWeight: FontManger.bold,
  );
  static TextStyle font15MasterBold = TextStyle(
    color: AppColors.colorMaster,
    fontSize: 15.sp,
    fontWeight: FontManger.bold,
  );
  static TextStyle font15MastersemiBold = TextStyle(
    color: AppColors.colorMaster,
    fontSize: 15.sp,
    fontWeight: FontManger.semiBold,
  );
  static TextStyle font17MastersemiBold = TextStyle(
    color: AppColors.colorMaster,
    fontSize: 17.sp,
    fontWeight: FontManger.semiBold,
  );
  static TextStyle font14MasterBold = TextStyle(
    color: AppColors.colorMaster,
    fontSize: 14.sp,
    fontWeight: FontManger.bold,
  );
  static TextStyle font14BlackMedium = TextStyle(
    color: AppColors.colorBlack,
    fontSize: 14.sp,
    fontWeight: FontManger.medium,
  );
  static TextStyle font14BlackRegular = TextStyle(
    color: AppColors.colorBlack,
    fontSize: 14.sp,
    fontWeight: FontManger.regular,
  );
  static TextStyle font14RedAstrcRegular = TextStyle(
    color: AppColors.colorRedAstric,
    fontSize: 14.sp,
    fontWeight: FontManger.regular,
  );
  static TextStyle font14MediumWhiteRegular = TextStyle(
    color: AppColors.colorMediumWhite,
    fontSize: 14.sp,
    fontWeight: FontManger.regular,
  );
  static TextStyle font14WhiteMedium = TextStyle(
    color: AppColors.colorMediumWhite,
    fontSize: 14.sp,
    fontWeight: FontManger.medium,
  );
  static TextStyle font14MastersemiBold = TextStyle(
    color: AppColors.colorMaster,
    fontSize: 14.sp,
    fontWeight: FontManger.semiBold,
  );
  static TextStyle font14GreenMedium = TextStyle(
    color: AppColors.colorGreenCompleted,
    fontSize: 14.sp,
    fontWeight: FontManger.medium,
  );
  static TextStyle font14RedMedium = TextStyle(
    color: AppColors.colorRed,
    fontSize: 14.sp,
    fontWeight: FontManger.medium,
  );
  static TextStyle font14GreyTextFeildRegular = TextStyle(
    color: AppColors.colorTextFeildGray,
    fontSize: 14.sp,
    fontWeight: FontManger.regular,
  );
  static TextStyle font16BlackRegular = TextStyle(
    color: AppColors.colorBlack,
    fontSize: 16.sp,
    fontWeight: FontManger.regular,
  );
  static TextStyle font16BlackSemiBold = TextStyle(
    color: AppColors.colorBlack,
    fontSize: 16.sp,
    fontWeight: FontManger.semiBold,
  );
  static TextStyle font22MediumGrayRegular = TextStyle(
      color: AppColors.colorMediumGray,
      // color: AppColors.colorOrange,
      fontSize: 22.sp,
      fontWeight: FontManger.regular);




  static TextStyle font16MasterBoldUnderline = TextStyle(
      color: AppColors.colorMaster,
      fontSize: 16.sp,
      decoration: TextDecoration.underline,
      fontWeight: FontManger.bold);
  static TextStyle font21BlackBold = TextStyle(
    color: AppColors.colorBlack,
    fontSize: 21.sp,
    fontWeight: FontManger.bold,
  );
  static TextStyle font18LightBlackRegular = TextStyle(
    color: AppColors.colorLightBlack,
    fontSize: 18.sp,
    fontWeight: FontManger.regular,
  );
  static TextStyle font18WhiteRegular = TextStyle(
      color: AppColors.colorWhite,
      fontSize: 18.sp,
      fontWeight: FontManger.regular);

  static TextStyle font21MasterRegular = TextStyle(
    color: AppColors.colorMaster,
    fontSize: 21.sp,
    fontWeight: FontManger.regular,
  );
  static TextStyle font11MasterSemiBold = TextStyle(
    color: AppColors.colorMaster,
    fontSize: 11.sp,
    fontWeight: FontManger.semiBold,
  );
  static TextStyle font10ColorError = TextStyle(
    color: AppColors.colorError,
    fontSize: 10.sp,
    fontWeight: FontManger.regular,
  );
}
