import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/colors.dart';
import 'decorations.dart';

/// Circular Loader Widget
class Loader extends StatefulWidget {
  final Color? color;

  @Deprecated(
      'accentColor is now deprecated and not being used. use defaultLoaderAccentColorGlobal instead')
  final Color? accentColor;
  final Decoration? decoration;
  final int? size;
  final double? value;
  final Animation<Color?>? valueColor;

  const Loader({
    this.color,
    this.decoration,
    this.size,
    this.value,
    this.valueColor,
    this.accentColor,
    super.key,
  });

  @override
  LoaderState createState() => LoaderState();
}

class LoaderState extends State<Loader> {
  @override
  void initState() {
    super.initState();
  }


  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(10),
        height: 40.h,
        width:40.w,
        decoration: widget.decoration ??
            BoxDecoration(
              color: widget.color ?? AppColors.colorWhite,
              shape: BoxShape.circle,
              boxShadow: defaultBoxShadow(),
            ),
        //Progress color uses accentColor from ThemeData
        child: Center(
          child: CircularProgressIndicator.adaptive(
            strokeWidth: 2,
            value: widget.value,
            valueColor: widget.valueColor ??
                AlwaysStoppedAnimation(
                  AppColors.colorMaster
                ),
          ),
        ),
      ),
    );
  }
}
