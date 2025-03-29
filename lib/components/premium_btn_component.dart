import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../extensions/decorations.dart';
import '../extensions/text_styles.dart';
import '../utils/colors.dart';
import '../utils/images.dart';

class PremiumBtn extends StatefulWidget {
  final bool? pDetail;
  final bool? isFromSearch;

  const PremiumBtn({super.key, this.pDetail, this.isFromSearch});

  @override
  State<PremiumBtn> createState() => _PremiumBtnState();
}

class _PremiumBtnState extends State<PremiumBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: boxDecorationWithRoundedCorners(
          backgroundColor: widget.isFromSearch == true ? AppColors.colorMediumGrayTextForm : AppColors.colorAmber,
          borderRadius:
              widget.pDetail == true ? BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(4), bottomLeft: Radius.circular(4), bottomRight: Radius.circular(4)) : radius(4)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AppImage.icPreminum, height: 12, width: 12, color: widget.isFromSearch == true ? AppColors.colorAmber : Colors.white),
          SizedBox(width: 4.w,),
          Text("premium".tr(), style: secondaryTextStyle(size: widget.isFromSearch == true ? 12 : 14, color: widget.isFromSearch == true ? AppColors.colorAmber : Colors.white)),
        ],
      ),
    );
  }
}
