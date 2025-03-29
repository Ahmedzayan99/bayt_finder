import 'package:bayt_finder/nav.dart';
import 'package:bayt_finder/screens/login/login_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../components/buttons/master_button.dart';
import 'colors.dart';
class TwoButtonAlert extends StatelessWidget {
  const TwoButtonAlert({super.key,  this.title,   this.onTap, this.textButtonConfirm, this.textButtonCancel});
  final String? title;
  final String? textButtonConfirm;
  final String? textButtonCancel;
  final Function()? onTap;
  //Cancel
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      content: Text(title??"You must log in first.".tr()),
      actions: [
        MasterButton(
          width: 110.w,
          height: 40.h,
          text: textButtonConfirm??'Login'.tr(),

          onPressed: onTap??(){
            navigateTo( LoginScreen());
          },
        ),
        MasterButton(
          height: 40.h,
            width: 100.w,
            text:textButtonCancel?? 'Not now'.tr(),
            backgroundColor: AppColors.colorTransparent,
            textColor: AppColors.colorError,
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ],
    );
  }
}
