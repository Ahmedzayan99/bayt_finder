
import 'package:bayt_finder/nav.dart';
import 'package:bayt_finder/utils/colors.dart';
import 'package:bayt_finder/utils/images.dart';
import 'package:bayt_finder/utils/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../extensions/double_press_back_widget.dart';
import '../../main.dart';
import '../../utils/alert_two_buttons.dart';
import '../map/show_property_in_map_screen.dart';
import '../property/cubit/property_cubit.dart';
import 'cubit/layout_cubit.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {

  @override
  void initState() {
    super.initState();
    OneSignal.User.pushSubscription.optIn();
    LayoutCubit.get(context).getSetting();
  }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final cubit = LayoutCubit.get(context);
        return Scaffold(
          backgroundColor: AppColors.colorMaster,
          bottomSheet: Container(
            height: 80.h,
            decoration: BoxDecoration(
                color: AppColors.colorWhite,
                borderRadius: BorderRadiusDirectional.only(
                    topEnd: Radius.circular(40.r),
                    topStart: Radius.circular(20.r))),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      cubit.changeIndex(0,);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
                      decoration: BoxDecoration(
                        color:  cubit.current == 0?AppColors.colorMaster:AppColors.colorTransparent,
                          borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        spacing: 5.w,
                        children: [
                          cubit.current == 0
                              ? SvgPicture.asset(
                                  AppImage.homeAct,
                                  fit: BoxFit.fill,
                                )
                              : SvgPicture.asset(
                                  AppImage.home,
                                  fit: BoxFit.fill,
                                ),
                          if(cubit.current==0) Text(
                            'home'.tr(),
                            style: TextStyles.font18WhiteBold,
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      cubit.changeIndex(1,);
                      PropertyCubit.get(context).filterProperty(
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
                      decoration: BoxDecoration(
                        color:  cubit.current == 1?AppColors.colorMaster:AppColors.colorTransparent,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        spacing: 5.w,
                        children: [
                          cubit.current == 1
                              ? SvgPicture.asset(
                            AppImage.searchAct,
                            fit: BoxFit.fill,
                          )
                              : SvgPicture.asset(
                            AppImage.search,
                            fit: BoxFit.fill,
                          ),
                          if(cubit.current==1) Text(
                            'Search'.tr(),
                            style: TextStyles.font18WhiteBold,
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if(isLogin){
                        cubit.changeIndex(2);
                      }else{
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return TwoButtonAlert();
                          },
                        );
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
                      decoration: BoxDecoration(
                        color:  cubit.current == 2?AppColors.colorMaster:AppColors.colorTransparent,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        spacing: 5.w,
                        children: [
                          cubit.current == 2
                              ? SvgPicture.asset(
                            AppImage.favouriteAct,
                            fit: BoxFit.fill,
                          )
                              : SvgPicture.asset(
                            AppImage.favourite,
                            fit: BoxFit.fill,
                          ),
                          if(cubit.current==2) Text(
                            'Favourite'.tr(),
                            style: TextStyles.font18WhiteBold,
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                        cubit.changeIndex(3);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
                      decoration: BoxDecoration(
                        color:  cubit.current == 3?AppColors.colorMaster:AppColors.colorTransparent,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        spacing: 5.w,
                        children: [
                          cubit.current == 3
                              ? SvgPicture.asset(
                            AppImage.profileAct,
                            fit: BoxFit.fill,
                          )
                              : SvgPicture.asset(
                            AppImage.profile,
                            fit: BoxFit.fill,
                          ),
                          if(cubit.current==3) Text(
                            'My account'.tr(),
                            style: TextStyles.font18WhiteBold,
                          ),
                        ],
                      ),
                    ),

                  ),
                ],
              ),
            ),
          ),
          floatingActionButton:cubit.current==0||cubit.current==1?Padding(
            padding:  EdgeInsets.only(bottom: 70.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                   navigateTo(ShowPropertyInMapScreen());
                  },
                  child: Container(
                    padding: EdgeInsets.all(10.sp),
                    decoration: BoxDecoration(
                      color: AppColors.colorMaster,
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 10.w,
                      children: [
                        Icon(Icons.map_outlined,color: AppColors.colorWhite,),
                      Text('Map'.tr(),
                      style: TextStyles.font15WhiteBold,
                      )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ):SizedBox.shrink() ,
/*
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
*/
          body:DoublePressBackWidget(
            child: AnimatedContainer(color: AppColors.colorBGSheet, duration: const Duration(seconds: 1), child: cubit.screen[cubit.current]
              // IndexedStack(index: currentIndex, children: tabs
            ),
          ) ,
        );
      },
    );
  }
}
