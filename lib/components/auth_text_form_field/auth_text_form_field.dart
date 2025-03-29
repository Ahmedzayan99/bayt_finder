
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/colors.dart';
import '../../utils/styles.dart';


class AuthTextFormField extends StatelessWidget {
  final String hintText;
  final int? maxLength;
  final int? maxLines;
  final Widget? suffixIcon;
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
  final Function(String)? onFieldSubmitted;

  const AuthTextFormField(
      {super.key,
        required this.hintText,
         this.suffixIcon,
         this.obscureText=false,
        this.focusNode,
        this.prefixIcon,
        this.onTap,
        this.controller,
        this.textInputType,
        this.onChanged,
        this.validator,
        this.maxLength,
        this.maxLines,
        this.border,
        this.focusedBorder,
        this.inputFormatters,
        this.fillColor, this.hintStyle , this.readOnly, this.onFieldSubmitted });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      readOnly:readOnly??false ,
      validator: validator,
      maxLength: maxLength,
      maxLines: maxLines,
      onChanged: onChanged,
      autofocus: false,
      keyboardType: textInputType,
      controller: controller,
      focusNode: focusNode,
      onTap: onTap,
      cursorColor: AppColors.colorBorderMediumGray,
      obscureText: obscureText,
      style: TextStyles.font14BlackMedium,
      onFieldSubmitted:onFieldSubmitted ,
      decoration: InputDecoration(
        hintText: hintText,
        counterText: "",
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: fillColor ?? AppColors.colorWhite,
        hintStyle:hintStyle ?? TextStyles.font14ExtraGrayRegular,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
        border: border??OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.sp),
            borderSide:BorderSide(     color: AppColors.colorMediumGrayBorderTextForm, width: 1.w,)
        ),
        enabledBorder: border??OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.sp),
            borderSide:BorderSide(     color: AppColors.colorMediumGrayBorderTextForm, width: 1.w,)
        ),
        focusedBorder:focusedBorder??OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.sp),
            borderSide:BorderSide(     color: AppColors.colorMediumGrayBorderTextForm, width: 1.w,)
        ),
      ),
    );
  }
}
