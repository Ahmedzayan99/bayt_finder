
import 'package:bayt_finder/extensions/extension_util/widget_extensions.dart';
import 'package:bayt_finder/utils/colors.dart';
import 'package:bayt_finder/utils/images.dart';
import 'package:bayt_finder/utils/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../components/add_property_dialouge.dart';
import '../../components/limit_exceed_dialog.dart';
import '../../extensions/double_press_back_widget.dart';
import '../../extensions/system_utils.dart';
import '../../main.dart';
import '../limit_screen.dart';
import '../subscribe_screen.dart';
import 'cubit/layout_cubit.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import '../../../extensions/LiveStream.dart';
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
    init();
  }

  void init() async {
    LayoutCubit.get(context).getSetting();
    /*PlatformDispatcher.instance.onPlatformBrightnessChanged = () {
      if (SharedPreferencesManager.getIntAsync(THEME_MODE_INDEX) == ThemeModeSystem) {
        appStore.setDarkMode(MediaQuery.of(context).platformBrightness == Brightness.light);
      }
    };*/

    //getSettingList();
    LiveStream().on("LANGUAGE", (s) {
      setState(() {});
    });
  }

/*  Future<void> getSettingList() async {
    await getSettingApi().then((value) {
      appStore.setCurrencyCodeID(value.currencySetting!.symbol.validate());
      appStore.setCurrencyPositionID(value.currencySetting!.position.validate());
      appStore.setCurrencyCode(value.currencySetting!.code.validate());
      for (int i = 0; i < value.data!.length; i++) {
        switch (value.data![i].key) {
          case "terms_condition":
            {
              appStore.setTermsCondition(value.data![i].value.validate());
            }
          case "privacy_policy":
            {
              appStore.setPrivacyPolicy(value.data![i].value.validate());
            }
          case "ONESIGNAL_APP_ID":
            {
              appStore.setOneSignalAppID(value.data![i].value.validate());
            }
          case "ONESIGNAL_REST_API_KEY":
            {
              appStore.setOnesignalRestApiKey(value.data![i].value.validate());
            }
          case "ADMOB_BannerId":
            {
              appStore.setAdmobBannerId(value.data![i].value.validate());
            }
          case "ADMOB_InterstitialId":
            {
              appStore.setAdmobInterstitialId(value.data![i].value.validate());
            }
          case "ADMOB_BannerIdIos":
            {
              appStore.setAdmobBannerIdIos(value.data![i].value.validate());
            }
          case "ADMOB_InterstitialIdIos":
            {
              appStore.setAdmobInterstitialIdIos(value.data![i].value.validate());
            }
          case "subscription_system":
            {
              appStore.setSubscription(value.data![i].value.validate());
            }
          case "CHATGPT_API_KEY":
            {
              appStore.setChatGptApiKey(value.data![i].value.validate());
            }
        }
      }
      getSettingData();
    });
  }*/
/*  @override
  void didChangeDependencies() {
    if (SharedPreferencesManager.getIntAsync(THEME_MODE_INDEX) == ThemeModeSystem) appStore.setDarkMode(MediaQuery.of(context).platformBrightness == Brightness.dark);
    setState(() {});
    super.didChangeDependencies();
  }*/

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
                      cubit.changeIndex(0);
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
                      cubit.changeIndex(1);
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
                      cubit.changeIndex(2);
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
          floatingActionButton: FloatingActionButton(
            heroTag: "addProperties",
            child: Icon(Icons.add, size: 44, color: Colors.white),
            onPressed: () {
              appStore.subscription == "1"
                  ? appStore.isSubscribe != 0
                  ? appStore.subscriptionDetail!.subscriptionPlan!.packageData!.addProperty == 0
                  ? showDialog(
                context: context,
                builder: (context) {
                  return appStore.addLimitCount == 0
                      ? LimitExceedDialog(
                    onTap: () {
                      finish(context);
                      LimitScreen(limit: "add_property").launch(context);
                    },
                  )
                      : AddPropertyDialog();
                },
              )
                  : showDialog(
                context: context,
                builder: (context) {
                  return AddPropertyDialog();
                },
              )
                  : SubscribeScreen().launch(context)
                  : showDialog(
                context: context,
                builder: (context) {
                  return AddPropertyDialog();
                },
              );
            },
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
