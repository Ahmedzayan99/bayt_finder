import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/colors.dart';
import '../../../utils/decorations.dart';
import '../../../utils/images.dart';
import '../../../utils/styles.dart';

class CustomFlushBar extends StatelessWidget {
  const CustomFlushBar({
    super.key,
    required this.text,
    required this.onTap,
    this.isPressed=false, required this.image,
  });

  final String text;
  final String image;
  final void Function()? onTap;
  final bool isPressed  ;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppBoxDecoration.decorationFlushBarLang.copyWith(border:isPressed?
      Border.all(color:AppColors.colorMaster) :null ),
      child: ListTile(
          contentPadding: EdgeInsets.only(right: 8.w, left: 12.w),
          leading: Image.asset(image),
          title: Text(text,style: TextStyles.font18BlackRegular),
          horizontalTitleGap: 9.w,
          trailing :isPressed ?SvgPicture.asset(AppImage.radioActive):SvgPicture.asset(AppImage.radioNotActive),
          onTap:onTap
      ),
    );
  }
}
