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

  static BoxDecoration decorationCircleBorderShadowNext = BoxDecoration(
    color: AppColors.colorMediumMaster,
    shape: BoxShape.circle,
    border: Border.all(color: AppColors.colorBorderMaster, width: 1.5),
    boxShadow: [
      BoxShadow(
        color: AppColors.colorMediumMaster,
        spreadRadius: 1.r,
        blurRadius: 10.r,
      ),
    ],
  );

  static BoxDecoration decorationWhiteRadius30Bottom = BoxDecoration(
    color: AppColors.colorMaster,
    borderRadius: BorderRadius.vertical(bottom: Radius.circular(34.r)),
  );

  static ShapeDecoration decorationLightGreyBorder9 = ShapeDecoration(
    color: AppColors.colorLightBlue,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
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

  static Decoration decorationRegistrationCard = ShapeDecoration(
    color: AppColors.colorWhite,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.r),
    ),
  );
  static ShapeDecoration orangeButtonDecoration = ShapeDecoration(
    color: Color(0xFFE8562A),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
  );
  static BoxDecoration decorationWhiteRadius16Border = BoxDecoration(
      color: AppColors.colorWhite,
      borderRadius: BorderRadius.circular(16.r),
      border: Border.all(
        color: AppColors.colorMaster,
        width: 1.w,
      ));
  static BoxDecoration decorationVeryLightGray16Border = BoxDecoration(
      color: AppColors.colorVeryLightGrayishPink,
      borderRadius: BorderRadius.circular(16.r),
      border: Border.all(
        color: AppColors.colorBorderMediumGray,
        width: 1.w,
      ));
  static BoxDecoration decorationGreyRadius11Border = BoxDecoration(
    color: AppColors.colorLightBlue,
    borderRadius: BorderRadius.circular(11.r),
  );
  static BoxDecoration decorationlightGreyRadius11 = BoxDecoration(
    color: AppColors.colorDarkGrey,
    borderRadius: BorderRadius.circular(11.r),
  );
  static ShapeDecoration decorationButtonwithPlus = ShapeDecoration(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
  );
  static BoxDecoration decorationWhiteRadius20 = BoxDecoration(
    color: AppColors.colorWhite,
    borderRadius: BorderRadius.circular(20.r),
  );
  static BoxDecoration decorationBGSheetRadius20 = BoxDecoration(
    color: AppColors.colorBGSheet,
    borderRadius: BorderRadius.circular(20.r),
  );
  static BoxDecoration decorationMasterRadius14 = BoxDecoration(
    color: AppColors.colorMaster,
    borderRadius: BorderRadius.circular(14.r),
  );
  static BoxDecoration decorationMediumGrayRadius5 = BoxDecoration(
    color: AppColors.colorMediumGray,
    borderRadius: BorderRadius.circular(5.r),
  );

  static BoxDecoration decorationWhiteRadius13BorderLightGray = BoxDecoration(
      color: AppColors.colorWhite,
      borderRadius: BorderRadius.circular(13.r),
      border: Border.all(color: AppColors.colorLightGray));

  static OutlineInputBorder greyTextFeildBorderRadius = OutlineInputBorder(
    gapPadding: 0,
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(
      width: 1,
      color: Colors.white,
    ),
  );
  static OutlineInputBorder whiteTextFeildBordermaster = OutlineInputBorder(
    gapPadding: 0,
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(
      width: 2,
      color: AppColors.colorMaster,
    ),
  );
  static BoxDecoration decorationMasterBorder = BoxDecoration(
    color: AppColors.colorWhite,
    borderRadius: BorderRadius.circular(10.r),
    border: Border.all(color: AppColors.colorMaster, width: 2),
  );
  static ShapeDecoration decorationLighterGrayWithDarkBorder = ShapeDecoration(
    color: AppColors.colorLighterGray,
    shape: RoundedRectangleBorder(
      side: BorderSide(width: 1, color: AppColors.colorveruDarkGreyBorder),
      borderRadius: BorderRadius.circular(19),
    ),
  );
  static BoxDecoration cardDecoration = BoxDecoration(
    color: AppColors.colorWhite,
    borderRadius: BorderRadius.circular(14.r),
    border: Border.all(color: AppColors.colorBorder),
  );

  static BoxDecoration locationIconDecoration = BoxDecoration(
    color: Colors.blue[100],
    shape: BoxShape.circle,
  );

  static BoxDecoration dropIconDecoration = BoxDecoration(
    color: Colors.green[100],
    shape: BoxShape.circle,
  );
}
