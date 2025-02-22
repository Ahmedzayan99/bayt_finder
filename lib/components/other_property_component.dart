import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../components/premium_btn_component.dart';
import '../extensions/extension_util/string_extensions.dart';
import '../main.dart';
import '../utils/app_common.dart';
import '../models/dashBoard_response.dart';
import '../utils/colors.dart';
import '../utils/styles.dart';

class TopAgenciesComponents extends StatefulWidget {

  final AgentList? agentList;

  const TopAgenciesComponents({super.key,  this.agentList});

  @override
  State<TopAgenciesComponents> createState() => _TopAgenciesComponentsState();
}

class _TopAgenciesComponentsState extends State<TopAgenciesComponents> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      child: Column(
        spacing: 5.h,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 85.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle
            ),
            child: ClipOval(
                child: cachedImage(widget.agentList!.profileImage.validate(), fit: BoxFit.fill)),
          ),
          Text(
              widget.agentList!.firstName.toString(),
              textAlign:TextAlign.center ,
              style: TextStyle(
              color: AppColors.colorBlack,
              fontSize: 12.sp,
              fontWeight: FontManger.regular
          )),
          Text(
              widget.agentList!.lastName.toString(),
              textAlign:TextAlign.center ,
              style: TextStyle(
              color: AppColors.colorBlack,
              fontSize: 12.sp,
              fontWeight: FontManger.regular
          )),
/*
          if (appStore.subscription == "1" &&widget.agentList!.premiumProperty == 1) PremiumBtn(pDetail: false),
*/
          /*   Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.ownerProperty!.name.validate().capitalizeFirstLetter(), style: primaryTextStyle(color: appStore.isDarkModeOn ? selectIconColor : scaffoldColorDark, size: 16)),
           *//*   2.height,
              Text(widget.ownerProperty!.category.validate(), style: primaryTextStyle(color: primaryColor, size: 14))
           *//* ],
          ).paddingAll(10),*/
        ],
      ),
    );
  }
}
