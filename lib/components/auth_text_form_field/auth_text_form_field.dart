
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/colors.dart';
import '../../utils/styles.dart';


class AuthTextFormField extends StatelessWidget {
  final String hintText;
  final int? maxLength;
  final Widget suffixIcon;
  final bool obscureText;
  final bool? readOnly;
  final FocusNode? focusNode;
  final Widget? prefixIcon;
  final Function()? onTap;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final Function(String value)? onChanged;
  final String? Function(String?)? validator;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final Color? fillColor;
  final TextStyle? hintStyle;
  final List<TextInputFormatter>? inputFormatters;

  const AuthTextFormField(
      {super.key,
        required this.hintText,
        required this.suffixIcon,
        required this.obscureText,
        this.focusNode,
        this.prefixIcon,
        this.onTap,
        this.controller,
        this.textInputType,
        this.onChanged,
        this.validator,
        this.maxLength,
        this.border,
        this.focusedBorder,
        this.inputFormatters,
        this.fillColor, this.hintStyle , this.readOnly });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      autovalidateMode: AutovalidateMode.onUnfocus,
      readOnly:readOnly??false ,
      validator: validator,
      maxLength: maxLength,
      onChanged: onChanged,
      autofocus: false,
      keyboardType: textInputType,
      controller: controller,
      focusNode: focusNode,
      onTap: onTap,
      cursorColor: AppColors.colorBorderMediumGray,
      obscureText: obscureText,
      // style: TextStyles.font12BlackRegular.copyWith(
      //     // color: Color(0xff575757),
      //     ),
      style: TextStyles.font14BlackMedium,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: 10.h,
          horizontal: 12.w,
        ),
        counterText: "",
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: fillColor ?? AppColors.colorMediumGrayTextForm,
        hintText: hintText,
        // hintStyle: TextStyles.font12BlackRegular.copyWith(
        //   color: const Color(0xff575757),
        // ),
        hintStyle:hintStyle ?? TextStyles.font14ExtraGrayMedium,

        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13.r),
            borderSide:  BorderSide(width: 1.w, color: AppColors.colorMediumGrayBorderTextForm)),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(13.r),
              borderSide: BorderSide(
                width: 1.w,
                color: AppColors.colorMediumGrayBorderTextForm,
              ),
            ),
        enabledBorder: border ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(13.r),
              borderSide:  BorderSide(
                width: 1.w,
                color: AppColors.colorMediumGrayBorderTextForm,
              ),
            ),
      ),
    );
  }
}
