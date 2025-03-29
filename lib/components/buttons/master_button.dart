import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/colors.dart';
import '../../utils/styles.dart';

enum TypeButton { textOnly, iconOnly, svgOnly, iconText, svgText }

class MasterButton extends StatelessWidget {
  final String? text;
  final bool? isActive;
  final bool? isLoading;
  final IconData? icon;
  final void Function()? onPressed;
  final double? width;
  final double? height;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? iconColor;
  final double? borderWidth;
  final Color? borderColor;
  final double? iconSize;
  final TextStyle? styleColorText;
  final String? svgPath;
  final Color? svgColor;
  final double? svgSize;
  final TypeButton? typeButton;
  final MainAxisAlignment? mainAxisAlignment;

  const MasterButton({
    super.key,
    this.text,
    this.icon,
    required this.onPressed,
    this.width,
    this.height ,
    this.borderRadius ,
    this.backgroundColor ,
    this.textColor ,
    this.borderWidth ,
    this.borderColor,
    this.typeButton = TypeButton.textOnly,
    this.iconSize,
    this.styleColorText,
    this.iconColor,
    this.svgPath,
    this.svgColor,
    this.svgSize,
    this.mainAxisAlignment, this.isActive=true,
    this.isLoading=false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.colorTransparent,
      child: InkWell(
        onTap:isActive! && !isLoading!?onPressed:(){
        },
        borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
        child: Container(
          width: width ?? double.infinity,
          height: height ?? 50.h,
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          decoration: BoxDecoration(
              color: isActive!?backgroundColor ?? AppColors.colorMaster:AppColors.colorMasterNotActive,
              borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
              border: Border.all(
                color: borderColor ?? Colors.transparent,
                width: borderWidth ?? 1.w,
              )),
          child: Center(
            child: isLoading!?Center(child: CircularProgressIndicator()):musterWidget(),
          ),
        ),
      ),
    );
  }
  Widget musterWidget() {
    switch (typeButton) {
      case TypeButton.textOnly:
        return textWidget();
      case TypeButton.iconOnly:
        return iconWidget();

      case TypeButton.svgOnly:
        return svgWidget();
      case TypeButton.iconText:
        return Row(
          mainAxisAlignment: mainAxisAlignment??MainAxisAlignment.center,
          spacing: 8.w,
          children: [
            iconWidget(),
            textWidget(),
          ],
        );
      case TypeButton.svgText:
        return Padding(
          padding:  EdgeInsets.symmetric(horizontal: 8.w),
          child: Row(
            mainAxisAlignment: mainAxisAlignment??MainAxisAlignment.center,
            spacing: 8.w,
            children: [
              svgWidget(),
              textWidget(),
            ],
          ),
        );
      case null:
      // TODO: Handle this case.
        throw UnimplementedError();
    }
  }
  Widget textWidget() {
    return Text(
      text.toString(),
      style: styleColorText ??
          TextStyles.font15WhiteBold.copyWith(color:textColor ?? AppColors.colorWhite)
    );
  }
  Widget iconWidget() {
    return Icon(
      icon ?? Icons.account_circle,
      color: iconColor ?? AppColors.colorMediumGray,
      size: iconSize ?? 25.h,
    );
  }
  Widget svgWidget() {
    return SvgPicture.asset(
      svgPath.toString(),
      width: svgSize ?? 25.h,
      height: svgSize ?? 25.h,
      colorFilter: svgColor != null
          ? ColorFilter.mode(svgColor!, BlendMode.srcIn)
          : null,
    );
  }
}

