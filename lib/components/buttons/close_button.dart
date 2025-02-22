import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../nav.dart';
import '../../utils/colors.dart';

class CloseButtonWidget extends StatelessWidget {
  const CloseButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return       InkWell(
      onTap: () {
        navigateBack(context);
      },
      child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.colorMediumGray
          ),
          child: Padding(
            padding:  EdgeInsets.all(3.sp),
            child: Icon(Icons.close,color: AppColors.colorWhite,size: 15.sp,),
          )),
    )
    ;
  }
}
