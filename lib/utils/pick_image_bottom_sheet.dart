import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/decorations.dart';
import '../components/buttons/master_button.dart';
import 'colors.dart';

class PickImageModalBottomSheet extends StatelessWidget {
 final void Function() onPressedCamera;
final void Function() onPressedPhotos;
   const PickImageModalBottomSheet({super.key,required this.onPressedCamera,required this.onPressedPhotos,});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 275.h,
      padding: EdgeInsets.all(45.h),
      decoration: AppBoxDecoration.decorationWhiteRadius20,
      child: Container(
        decoration: AppBoxDecoration.decorationWhiteRadius20,
        child: Column(
          spacing: 0.h,
          children: [
            SizedBox(
              height: 10.h,
            ),
          Divider(
            color: AppColors.colorMediumGrayText,
          ),
            MasterButton(
              onPressed: onPressedCamera,
              height: 44.h,
              backgroundColor: AppColors.colorTransparent,
              text: 'Camera'.tr(),
              textColor: AppColors.colorBlack,
            ),
    Divider(
    color: AppColors.colorMediumGrayText,
    ),
            MasterButton(
              onPressed: onPressedPhotos,
              height: 44.h,
              backgroundColor: AppColors.colorTransparent,
              text: 'Photos'.tr(),
              textColor: AppColors.colorBlack,
            ),
          Divider(
            color: AppColors.colorMediumGrayText,
          ),
            MasterButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              height: 44.h,
              backgroundColor: AppColors.colorTransparent,
              text: 'Cancel'.tr(),
              textColor: AppColors.colorError,
            ),
          ],
        ),
      ),
    );
  }
}
