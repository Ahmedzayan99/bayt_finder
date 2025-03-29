import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle
              ),
              child: ClipOval(
                  child: cachedImage(widget.agentList!.profileImage!, fit: BoxFit.fill)),
            ),
          ),
          Text(
              widget.agentList!.username.toString(),
              textAlign:TextAlign.center ,
              style: TextStyle(
              color: AppColors.colorBlack,
              fontSize: 12.sp,
              fontWeight: FontManger.regular
          )),
        ],
      ),
    );
  }
}
