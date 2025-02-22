import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/colors.dart';
import '../../utils/styles.dart';
import '../buttons/back_button.dart';

enum TypeAppBar {
  textOnly,
  backText,
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackButtonPressed;
  final bool startTitle;
  final Color? backgroundColor;
  final Color? titleColor;
  final BorderRadiusGeometry? borderRadius;
  final double? height;
  final double? titleSize;
  final TextStyle? styleText;
  final TypeAppBar? typeAppBar;

  final bool backIsCircle;
  final double? widthBackButton;
  final double? heightBackButton;
  final Color? colorBackgroundBack;
  final double? paddingTop;

  const CustomAppBar({
    super.key,
    required this.title,
    this.backgroundColor,
    this.onBackButtonPressed,
    this.startTitle = false,
    this.borderRadius,
    this.height,
    this.styleText,
    this.titleColor,
    this.typeAppBar = TypeAppBar.backText,
    this.backIsCircle=true,
    this.widthBackButton,
    this.heightBackButton,
    this.colorBackgroundBack,
    this.paddingTop, this.titleSize,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.colorTransparent,
      child: Container(
        width: double.infinity,
        height: height ?? 90.h,
        decoration: BoxDecoration(
        color: AppColors.colorWhite,
          borderRadius: borderRadius,
          boxShadow: [
            BoxShadow(
              color: AppColors.colorMediumGray,
              spreadRadius: 0.0,
              blurRadius: 6,
            ),
          ],
        ),
        child: SafeArea(child: Padding(
          padding:  EdgeInsetsDirectional.only(start:typeAppBar==TypeAppBar.backText?3.w:15.w,top: paddingTop??20.h),
          child: musterWidget(context),
        )),
      ),
    );
  }

  Widget musterWidget(context) {
    switch (typeAppBar) {
      case null:
      // TODO: Handle this case.
        throw UnimplementedError();
      case TypeAppBar.textOnly:
        return _textWidget();
      case TypeAppBar.backText:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment:startTitle?MainAxisAlignment.start:MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _backButtonWidget(context),
                Transform.translate(
                    offset: Offset(startTitle?0.w:-40.w, 6.h),
                    child: _textWidget()),
                Container()
              ],
            ),
          ],
        );
    }
  }

  Widget _textWidget() {
    return Row(
      mainAxisAlignment:
      startTitle ? MainAxisAlignment.start:MainAxisAlignment.center ,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toString(),
          style: styleText ??TextStyles.font24BlackMedium.copyWith(color:titleColor,fontSize: titleSize),
        ),
      ],
    );
  }
  Widget _backButtonWidget(context) {
    return CustomBackButton(
      backIsCircle: backIsCircle,
      onBackButtonPressed: onBackButtonPressed,
       colorBackgroundBack: colorBackgroundBack,
      heightBackButton: heightBackButton,
      widthBackButton: heightBackButton,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height ?? 105.h);
}
