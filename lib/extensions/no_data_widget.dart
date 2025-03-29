import 'package:bayt_finder/components/buttons/master_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../extensions/text_styles.dart';


class NoDataWidget extends StatelessWidget {
  final String? image;
  final Size? imageSize;
  final BoxFit fit;
  final Widget? imageWidget;

  final String? title;
  final String? subTitle;

  final TextStyle? titleTextStyle;
  final TextStyle? subTitleTextStyle;

  final VoidCallback? onRetry;
  final String? retryText;

  const NoDataWidget({
    this.image,
    this.imageSize,
    this.imageWidget,
    this.fit = BoxFit.contain,
    this.title,
    this.subTitle,
    this.onRetry,
    this.retryText,
    this.titleTextStyle,
    this.subTitleTextStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _imageWidget(),
        SizedBox(height: 16.h,),
        if (title!.isNotEmpty)
          Text(title!,
              style: titleTextStyle ?? primaryTextStyle(),
              textAlign: TextAlign.center),
        SizedBox(height: 4.w,),
        if (subTitle!.isNotEmpty)
          Text(subTitle!,
              style: subTitleTextStyle ?? secondaryTextStyle(),
              textAlign: TextAlign.center),
        SizedBox(height: 16.h,),
        if (onRetry != null)
          MasterButton(onPressed: () {
              onRetry?.call();
          },
          text: 'Try again'.tr(),
          ),
      ],
    );
  }

  Widget _imageWidget() {
    if (imageWidget != null) return imageWidget!;
    if (image == null) return Offstage();

    if (image!.startsWith('http')) {
      return Image.network(
        image!,
        height: imageSize != null ? (imageSize!.height) : 200,
        width: imageSize != null ? (imageSize!.width) : 200,
        fit: fit,
      );
    } else {
      return Image.asset(
        image!,
        height: imageSize != null ? (imageSize!.height) : 200,
        width: imageSize != null ? (imageSize!.width) : 200,
        fit: fit,
      );
    }
  }
}
