import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



BorderRadius radius([double? radius]) {
  return BorderRadius.all(radiusCircular(radius ?? 16.r));
}

Radius radiusCircular([double? radius]) {
  return Radius.circular(radius ??  16.r);
}

Decoration boxDecorationWithRoundedCorners({
  Color? backgroundColor,
  BorderRadius? borderRadius,
  LinearGradient? gradient,
  BoxBorder? border,
  List<BoxShadow>? boxShadow,
  DecorationImage? decorationImage,
  BoxShape boxShape = BoxShape.rectangle,
}) {
  return BoxDecoration(
    color: backgroundColor,
    borderRadius: boxShape == BoxShape.circle ? null : (borderRadius ?? radius()),
    gradient: gradient,
    border: border,
    boxShadow: boxShadow,
    image: decorationImage,
    shape: boxShape,
  );
}

List<BoxShadow> defaultBoxShadow({
  Color? shadowColor,
  double? blurRadius,
  double? spreadRadius,
  Offset offset = const Offset(0.0, 0.0),
}) {
  return [
    BoxShadow(
      color: shadowColor ?? Colors.grey.withOpacity(0.065),
      blurRadius: blurRadius ?? 4.0,
      spreadRadius: spreadRadius ?? 0.5,
      offset: offset,
    )
  ];
}
