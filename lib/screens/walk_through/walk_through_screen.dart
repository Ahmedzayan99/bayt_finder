/*
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../local_storage/shared_preferences_manager.dart';
import '../../main.dart';
import '../../models/walk_through_model.dart';

import '../../nav.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/decorations.dart';
import '../../utils/images.dart';
import '../../utils/styles.dart';
import '../login/login_screen.dart';

class WalkThroughScreen extends StatefulWidget {
  const WalkThroughScreen({super.key});
  @override
  _WalkThroughScreenState createState() => _WalkThroughScreenState();
}
class _WalkThroughScreenState extends State<WalkThroughScreen> {
  PageController mPageController = PageController();
  List<WalkThroughModel> mWalkList = [];
  int mCurrentIndex = 0;
  @override
  void initState() {
    super.initState();
    init();
  }
  init() async {
    mWalkList.add(WalkThroughModel(
      image: AppImage.intro1,
      title: "Effortless Property Search",
      title1:
          "Explore Property near your for rent or sell. Haus pro can show you any",
    ));
    mWalkList.add(WalkThroughModel(
      image: AppImage.intro2,
      title: "Save and Compare",
      title1:
          "Save your favorite listings and compare them side-by-side to make an informed decision.",
    ));
    mWalkList.add(WalkThroughModel(
      image: AppImage.intro3,
      title: "SEARCH MAP",
      title1: "Gives you the local scoop about homes for rent and sale .",
    ));
  }
  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }
  @override
  void dispose() {
    mPageController.dispose();
    super.dispose();
  }
  void backPage() {
    if (mCurrentIndex == 0) {
    } else if (mCurrentIndex <= mWalkList.length - 1) {
      mPageController.animateToPage(
        mCurrentIndex - 1,
        duration: Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }
  void goToNextPage(context) {
    if (mCurrentIndex < mWalkList.length - 1) {
      mPageController.animateToPage(
        mCurrentIndex + 1,
        duration: Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    } else {
      SharedPreferencesManager.saveData("skipBoarding",true);
      navigateFinish( LoginScreen());
    }
  }
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            Brightness.dark,
        systemNavigationBarIconBrightness:
            Brightness.dark,
      ),
      child: Scaffold(
          body: Stack(
        children: [
          PageView.builder(
            controller: mPageController,
            itemCount: mWalkList.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
               transform:GradientRotation(10) ,
                      begin: AlignmentDirectional.topCenter,
                      end: AlignmentDirectional.topCenter,
                      colors: [
                    AppColors.colorLinearGradient2,
                    AppColors.colorLinearGradient,
                  ]),
                ),
                child: Opacity(
                  opacity: 0.6,
                  child: Image.asset(mWalkList[mCurrentIndex].image!,
                      fit: BoxFit.fill),
                ),
              );
            },
            onPageChanged: (i) {
              mCurrentIndex = i;
              setState(() {});
            },
          ),
          PositionedDirectional(
            top: 80.h,
            child: Row(
              spacing: 48.w,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 100.w,
                ),
                Row(
                  spacing: 10.w,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 50.w,
                      height: 5.h,
                      decoration: BoxDecoration(
                          color: mCurrentIndex == 0
                              ? AppColors.colorMaster
                              : AppColors.colorLightBlue,
                          borderRadius: BorderRadius.circular(5.r)),
                    ),
                    Container(
                      width: 50.w,
                      height: 5.h,
                      decoration: BoxDecoration(
                          color: mCurrentIndex == 1
                              ? AppColors.colorMaster
                              : AppColors.colorLightBlue,
                          borderRadius: BorderRadius.circular(5.r)),
                    ),
                    Container(
                      width: 50.w,
                      height: 5.h,
                      decoration: BoxDecoration(
                          color: mCurrentIndex == 2
                              ? AppColors.colorMaster
                              : AppColors.colorLightBlue,
                          borderRadius: BorderRadius.circular(5.r)),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    SharedPreferencesManager.saveData("skipBoarding",true);
                    navigateFinish( LoginScreen());
                  },
                  child: Text('Skip'.tr(), style: TextStyles.font14MasterBold),
                ),
              ],
            ),
          ),
          PositionedDirectional(
            bottom: 150.h,
            start: 50.w,
            end: 50.w,
            child: Column(
              spacing: 10.h,
              children: [
                Text(mWalkList[mCurrentIndex].title.toString().tr(),
                    textAlign: TextAlign.center,
                    style: TextStyles.font26WhiteMedium),
                Container(
                  width: 128.w,
                  height: 2.h,
                  color: AppColors.colorMediumGray,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    end: 16.h,
                    start: 16.w,
                  ),
                  child: Text(mWalkList[mCurrentIndex].title1.toString().tr(),
                      textAlign: TextAlign.center,
                      style: TextStyles.font16WhiteRegular),
                ),
                */
/* AppButton(
                  text:
                      mCurrentIndex == 2 ? language.getStarted : language.next,
                  width: double.infinity,
                  color: AppColors.colorMaster,
                  onTap: () {
                    if (mCurrentIndex.toInt() >= 2) {
                      SharedPreferencesManager.saveData(IS_FIRST_TIME, true);
                      LoginScreen().launch(context, isNewTask: false);
                    } else {
                      mPageController.nextPage(
                          duration: Duration(seconds: 1),
                          curve: Curves.linearToEaseOut);
                    }
                  },
                ),*//*

              ],
            ),
          ),
          PositionedDirectional(
            bottom: 0,
            start: 0,
            end: 0,
            child: Opacity(
              opacity: 0.8,
              child: Container(
                color: AppColors.colorLinearGradient,
                child: Padding(
                  padding:  EdgeInsets.only(bottom: 30.h,right: 26.w,left: 26.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            backPage();
                          },
                          child: Row(
                            spacing: 16.w,
                            children: [
                              Container(
                                width: 62.w,
                                height: 62.h,
                                decoration:
                                    AppBoxDecoration.decorationCircleBorderShadowNext,
                                child: Icon(
                                  Icons.arrow_back,
                                  color: AppColors.colorWhite,
                                ),
                              ),
                              Text('Back'.tr(),
                                  style: TextStyles.font16WhiteRegular),
                            ],
                          )),
                      InkWell(
                          onTap: () {
                            goToNextPage(context);
                          },
                          child: Row(
                            spacing: 16.w,
                            children: [
                              Text('Next'.tr(),
                                  style: TextStyles.font16WhiteRegular),
                              Container(
                                width: 62.w,
                                height: 62.h,
                                decoration:
                                    AppBoxDecoration.decorationCircleBorderShadowNext,
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: AppColors.colorWhite,
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
*/
