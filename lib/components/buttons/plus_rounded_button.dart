import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/images.dart';
import '../../utils/styles.dart';

class PlusRoundedButton extends StatelessWidget {
  final String title;
  final Color color;
  const PlusRoundedButton({super.key, required this.title, required this.color,  });

  @override
  Widget build(BuildContext context) {
    return  Container(
     // width: width ,
      height: 33.h,

      decoration:
      ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      //AppBoxDecoration.decorationButtonwithPlus,
      child: Padding(
        padding:  EdgeInsets.all(6.0.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppImage.pathImage),
            Text(
              title.tr(),
              style: TextStyles.font14WhiteMedium,
            ),
          ],
        ),
      ),
    );
  }
}
