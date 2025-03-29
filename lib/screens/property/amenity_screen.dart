import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../models/category_list_model.dart';
import '../../utils/app_common.dart';
import '../../utils/colors.dart';
import '../../utils/styles.dart';

class AmenityScreen extends StatefulWidget {
  final List<AmenityNameCategory> amenityValue;

  const AmenityScreen({super.key, required this.amenityValue});

  @override
  State<AmenityScreen> createState() => _AmenityScreenState();
}

class _AmenityScreenState extends State<AmenityScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Facilities".tr(),
          style: TextStyles.font20BlackMedium,
        ),
        SizedBox(
          height: 60.h,
          child: ListView.separated(
            physics: ScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: widget.amenityValue.length,
            shrinkWrap: true,
            itemBuilder: (context, i) {
              return Container(
                height: 47.h,
                width: 47.h,
                decoration: BoxDecoration(
                    color: AppColors.colorMediumGrayBg,
                    shape: BoxShape.circle),
                child: Padding(
                  padding:  EdgeInsets.all(8.sp),
                  child: ClipOval(
                      child: cachedImage(
                    widget.amenityValue[i].amenityImage.toString(),
                    height: 26.h,
                    width: 26.w,
                  )),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: 10.w,);
            },
          ),
        ),
      ],
    );
  }
}
