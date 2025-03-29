import 'package:bayt_finder/components/buttons/master_button.dart';
import 'package:bayt_finder/extensions/loader_widget.dart';
import 'package:bayt_finder/nav.dart';
import 'package:bayt_finder/screens/layout/cubit/layout_cubit.dart';
import 'package:bayt_finder/screens/my_account/cubit/my_account_cubit.dart';
import 'package:bayt_finder/utils/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../components/appbar/custom_appbar.dart';
import '../../local_storage/shared_preferences_manager.dart';
import '../../utils/alert_two_buttons.dart';
import '../../utils/decorations.dart';
import '../language/cubit/language_cubit.dart';
import '../language/widgit/custom_flush_bar.dart';
import '../../utils/constants.dart';
import '../../extensions/common.dart';
import '../../main.dart';
import '../edit_profile/edit_profile_screen.dart';
import '../../utils/app_common.dart';
import '../../utils/colors.dart';
import '../../utils/images.dart';
import '../login/login_screen.dart';
import '../my_property/my_properties_screen.dart';
import '../news/news_all_screen.dart';

/*class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool select = true;
 late MyAccountCubit myAccountCubit;
  @override
  void initState() {
    myAccountCubit=MyAccountCubit.get(context);
    super.initState();
    init();
  }

  void init() async {
    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  Future deleteAccount(BuildContext context) async {
   // myAccountCubit.userDetail.data!.setLoading(true);
    await deleteUserAccountApi().then((value) async {
      await deleteUserFirebase().then((value) async {
        await logout(context).then((value) async {
          //myAccountCubit.userDetail.data!.setLoading(false);

          LoginScreen().launch(context, isNewTask: true);
        });
      }).catchError((error) {
     //   myAccountCubit.userDetail.data!.setLoading(false);
        toast(error.toString());
      });
    }).catchError((error) {
  //    myAccountCubit.userDetail.data!.setLoading(false);
      toast(error.toString());
    });
  }

  getPlanWidget(String total, String remainingTotal, int? isUnlimited,
      int mLimitCount, String title1, final Function()? onTap, String img) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
      decoration: boxDecorationRoundedWithShadow(8,
          backgroundColor :appStore.isDarkModeOn ? scaffoldColorDark : Colors.white),
      child: Column(children: [
        myAccountCubit.userDetail.data!.isSubscribe == 1 && myAccountCubit.userDetail.data!.isSubscribe != 0
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FittedBox(
                    clipBehavior: Clip.none,
                    child: Text(
                      isUnlimited == 1 ? "unlimited" : total.toString(),
                      style: boldTextStyle(
                          color: AppColors.colorMaster,
                          size: isUnlimited == 1 ? 16 : 20),
                      // style: boldTextStyle(color: AppColors.colorMaster, size: isUnlimited == 1 ? 16 : 22),
                      // maxLines: 1,
                      // overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(isUnlimited != 1 ? "/$remainingTotal" : "",
                      style: boldTextStyle(
                          color: grey, size: isUnlimited == 1 ? 16 : 20)),
                ],
              )
            : Image.asset(img, height: 20, width: 20, color: AppColors.colorMaster),
        8.height,
        myAccountCubit.userDetail.data!.isSubscribe == "1" && myAccountCubit.userDetail.data!.isSubscribe != 0
            ? myAccountCubit.userDetail.subscriptionDetail!.subscriptionPlan!.packageName!
                         ==
                    0
                ? mLimitCount == 0 && isUnlimited == 0
                    ? FittedBox(
                        child: Row(
                        children: [
                          Icon(Icons.add,
                              size: 14,
                              color: isUnlimited == 1
                                  ? Colors.transparent
                                  : AppColors.colorMaster),
                          Text(title1,
                              style: primaryTextStyle(
                                  size: 14, color: AppColors.colorMaster)),
                        ],
                      ))
                    : FittedBox(
                        child: Text(
                          title1,
                          style: primaryTextStyle(size: 13, color: grey),
                          textAlign: TextAlign.center,
                        ),
                      )
                : FittedBox(
                    child: Text(
                      title1,
                      style: primaryTextStyle(size: 13, color: grey),
                      textAlign: TextAlign.center,
                    ),
                  )
            : FittedBox(child: Text(title1, style: primaryTextStyle(size: 13)))
      ]),
    ).onTap(onTap).expand();
  }

  Widget mSettingOption(String mTitle, String mImg, Function onTapCall) {
    return SettingItemWidget(
      onTap: () {
        onTapCall.call();
      },
      title: mTitle,
      leading: Image.asset(mImg, height: 20, width: 20, color: AppColors.colorMaster),
      trailing: Icon(Icons.arrow_forward_ios_sharp, color: grayColor, size: 18),
    );
  }

  @override
  Widget build(BuildContext context) {
    MyAccountCubit myAccountCubit=MyAccountCubit.get(context);
    myAccountCubit.getUserDetail();
    return BlocConsumer<MyAccountCubit, MyAccountState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Scaffold(
      appBar: appBarWidget("myProfile",
          context1: context,
          showBack: false,),
      body: SingleChildScrollView(
        child: Padding(
          padding:EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    decoration: boxDecorationWithRoundedCorners(
                        boxShape: BoxShape.circle,
                        border: Border.all(color: primaryLight, width: 4)),
                    child: cachedImage(myAccountCubit.userDetail.data!.profileImage.toString(),
                            height: 90, width: 90, fit: BoxFit.cover)
                        .cornerRadiusWithClipRRect(50),
                  ),
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: boxDecorationWithRoundedCorners(
                        borderRadius: radius(50),
                        border: Border.all(color: Colors.white),
                        backgroundColor: primaryLight),
                    child: Image.asset(ic_edit_profile,
                        height: 16, width: 16, color: AppColors.colorMaster),
                  )
                ],
              ).onTap(() async {
                {
                  EditProfileScreen(userDetail: myAccountCubit.userDetail,).launch(context);
                }
              }).center(),
              10.height,
              */ /*Text("${SharedPreferencesManager.getStringAsync("FIRSTNAME").toString()} ${SharedPreferencesManager.getStringAsync("LASTNAME").toString()}",
                      style: boldTextStyle(size: 18))
                  .center(),*/ /*
              SizedBox(height: 4.w,),
            */ /*  Text(SharedPreferencesManager.getStringAsync("EMAIL").toString(),
                      style: secondaryTextStyle(size: 16))
                  .center()*/ /*
              20.height,
              // myAccountCubit.userDetail.data!.isSubscribe == "1" && myAccountCubit.userDetail.data!.isSubscribe != 0
              //     ? Container(
              //         padding: EdgeInsets.all(15),
              //         decoration: boxDecorationWithRoundedCorners(
              //             borderRadius: radiusOnly(
              //                 bottomRight: myAccountCubit.userDetail.data!.isSubscribe == "1" && select
              //                     ? 0
              //                     : defaultRadius,
              //                 bottomLeft: myAccountCubit.userDetail.data!.isSubscribe == "1" && select
              //                     ? 0
              //                     : defaultRadius,
              //                 topLeft: defaultRadius,
              //                 topRight: defaultRadius),
              //             backgroundColor: AppColors.colorMaster),
              //         child: Row(
              //           children: [
              //             Text("yourCurrentPlan",
              //                     style: primaryTextStyle(color: Colors.white))
              //                 .expand(),
              //             Icon(
              //                     select
              //                         ? Icons.keyboard_arrow_up
              //                         : Icons.keyboard_arrow_down_outlined,
              //                     color: Colors.white,
              //                     size: 24)
              //                 .paddingTop(2)
              //           ],
              //         ),
              //       ).onTap(() {
              //         select = !select;
              //         setState(() {});
              //       })
              //     : SizedBox(),
         */ /*     Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                decoration: boxDecorationWithRoundedCorners(
                  backgroundColor:
                      AppColors.colorMediumGrayTextForm,
                  borderRadius: radiusOnly(
                      topLeft: myAccountCubit.userDetail.data!.isSubscribe == "1" && select
                          ? 0
                          : defaultRadius,
                      topRight: myAccountCubit.userDetail.data!.isSubscribe == "1" && select
                          ? 0
                          : defaultRadius,
                      bottomLeft: defaultRadius,
                      bottomRight: defaultRadius),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    getPlanWidget(
                        myAccountCubit.userDetail.data!.userResponse!.planLimitCount!
                            .remainingAddPropertyLimit
                            !
                            .toString(),
                        myAccountCubit.userDetail.data!.userResponse!.planLimitCount!
                            .withExtraAddPropertyLimit
                            !
                            .toString(),
                        myAccountCubit.userDetail.data!.isSubscribeDetail!.isSubscribePlan != null
                            ? myAccountCubit.userDetail.data!.isSubscribeDetail!.isSubscribePlan!
                                .packageData!.addProperty
                                !
                            : 0,
                        myAccountCubit.userDetail.data!.addLimitCount,
                        "addProperty", () {
                      if (myAccountCubit.userDetail.data!.isSubscribe == "1") {
                        if (myAccountCubit.userDetail.data!.isSubscribe != 0) {
                          if (myAccountCubit.userDetail.data!.isSubscribeDetail!.isSubscribePlan!
                                  .packageData!.addProperty
                                  ! ==
                              0) {
                            myAccountCubit.userDetail.data!.addLimitCount == 0
                                ? LimitScreen(limit: "add_property")
                                    .launch(context)
                                : AddPropertyHistoryScreen(history: true)
                                    .launch(context);
                          } else {
                            AddPropertyHistoryScreen(history: true)
                                .launch(context);
                          }
                        } else {
                          SubscribeScreen().launch(context);
                        }
                      } else {
                        AddPropertyHistoryScreen(history: true).launch(context);
                      }
                    }, ic_profile_property),
                    1SizedBox(width: 4.w,),
                    getPlanWidget(
                        myAccountCubit.userDetail.data!.userResponse!.planLimitCount!
                            .remainingAdvertisementPropertyLimit
                            !
                            .toString(),
                        myAccountCubit.userDetail.data!.userResponse!.planLimitCount!
                            .withExtraAdvertisementLimit
                            !
                            .toString(),
                        myAccountCubit.userDetail.data!.isSubscribeDetail!.isSubscribePlan != null
                            ? myAccountCubit.userDetail.data!.isSubscribeDetail!.isSubscribePlan!
                                .packageData!.advertisement
                                !
                            : 0,
                        myAccountCubit.userDetail.data!.advertisement,
                        "advertisement", () {
                      if (myAccountCubit.userDetail.data!.isSubscribe == "1") {
                        if (myAccountCubit.userDetail.data!.isSubscribe != 0) {
                          if (myAccountCubit.userDetail.data!.isSubscribeDetail!.isSubscribePlan!
                                  .packageData!.advertisement
                                  ! ==
                              0) {
                            myAccountCubit.userDetail.data!.advertisement == 0
                                ? LimitScreen(limit: "advertisement_property")
                                    .launch(context)
                                : AddPropertyHistoryScreen(history: false)
                                    .launch(context);
                          } else {
                            AddPropertyHistoryScreen(history: false)
                                .launch(context);
                          }
                        } else {
                          SubscribeScreen().launch(context);
                        }
                      } else {
                        AddPropertyHistoryScreen(history: false).launch(context);
                        // AdvertisementHistoryScreen().launch(context);
                      }
                    }, ic_profile_advertisement),
                    1SizedBox(width: 4.w,),
                    // 16.width.visible(myAccountCubit.userDetail.data!.isSubscribe == "1"),
                    getPlanWidget(
                        myAccountCubit.userDetail.data!.userResponse!.planLimitCount!
                            .remainingViewPropertyLimit
                            !
                            .toString(),
                        myAccountCubit.userDetail
data.                            .userResponse!.planLimitCount!.withExtraPropertyLimit
                            !
                            .toString(),
                        myAccountCubit.userDetail.data!.isSubscribeDetail!.isSubscribePlan != null
                            ? myAccountCubit.userDetail.data!.isSubscribeDetail!.isSubscribePlan!
                                .packageData!.property
                                !
                            : 0,
                        myAccountCubit.userDetail.data!.contactInfo,
                        "contactInfo", () {
                      if (myAccountCubit.userDetail.data!.isSubscribe == "1") {
                        if (myAccountCubit.userDetail.data!.isSubscribe != 0) {
                          if (myAccountCubit.userDetail.data!.isSubscribeDetail!.isSubscribePlan!
                                  .packageData!.property
                                  ! ==
                              0) {
                            myAccountCubit.userDetail.data!.contactInfo == 0
                                ? LimitScreen(limit: "view_property")
                                    .launch(context)
                                : PropertyContactInfoScreen().launch(context);
                          } else {
                            PropertyContactInfoScreen().launch(context);
                          }
                        } else {
                          SubscribeScreen().launch(context);
                        }
                      } else {
                        PropertyContactInfoScreen().launch(context);
                      }
                    }, ic_call_outlined),
                  ],
                ),
              ).visible(select == true),*/ /*
              1SizedBox(height: 4.w,),
              mSettingOption("myProperty", ic_my_properties, () {
                MyPropertiesScreen().launch(context);
              }),
              14.height.visible(myAccountCubit.userDetail.data!.isSubscribe == "1"),
              mSettingOption("isSubscribe", ic_subscription, () {
                SubscriptionDetailScreen().launch(context);
              }).visible(myAccountCubit.userDetail.data!.isSubscribe == "1"),
              1SizedBox(height: 4.w,),
              mSettingOption("viewPropertyContactHistory", ic_view_property, () {
                if (myAccountCubit.userDetail.data!.isSubscribe == "1") {
                  if (myAccountCubit.userDetail.data!.isSubscribe != 0) {
                    ViewPropertyContactHistory().launch(context);
                  } else {
                    SubscribeScreen().launch(context);
                  }
                }
              }).visible(myAccountCubit.userDetail.data!.isSubscribe == "1"),
              14.height.visible(myAccountCubit.userDetail.data!.isSubscribe == "1"),
              mSettingOption("newsArticles", ic_articles, () {
                NewsAllScreen().launch(context);
              }),
              1SizedBox(height: 4.w,),
              mSettingOption("setting", ic_settings, () {
                SettingScreen().launch(context);
              }),
              1SizedBox(height: 4.w,),
              mSettingOption("aboutApp", ic_about, () {
                HelpCenterScreen().launch(context);
              }),
              1SizedBox(height: 4.w,),
              mSettingOption('deleteAccount', ic_delete_ac, () {
                showConfirmDialogCustom(
                  bgColor: limitColor.withOpacity(0.10),
                  iconColor: limitColor,
                  image: ic_delete_ac,
                  context,
                  AppColors.colorMaster: limitColor,
                  positiveTextColor: Colors.white,
                  negativeTextColor: AppColors.colorMaster,
                  title: "deleteAccountMessage",
                  positiveText: "delete",
                  height: 100,
                  onAccept: (c) async {
                    await deleteAccount(context);
                  },
                );
              }),
              1SizedBox(height: 4.w,),
              mSettingOption("logOut", ic_logout, () {
                showConfirmDialogCustom(
                  image: ic_logout,
                  bgColor: context.cardColor,
                  iconColor: AppColors.colorMaster,
                  context,
                  negativeBg: context.cardColor,
                  AppColors.colorMaster: AppColors.colorMaster,
                  title: "logoutMsg",
                  positiveText: "logOut",
                  height: 100,
                  onAccept: (c) {
                    logout(context);
                  },
                );
              }),
              1SizedBox(height: 4.w,),
            ],
          ),
        ),
      ),
    );
  },
);
  }

*/ /*
  getPlans(int title, String title1, final Function()? onTap, String img) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
      decoration: boxDecorationRoundedWithShadow(8,
          backgroundColor: appStore.isDarkModeOn ? Colors.colorBlack : Colors.white),
      child: Column(children: [
        myAccountCubit.userDetail.data!.isSubscribe == "1" && myAccountCubit.userDetail.data!.isSubscribe != 0
            ? Text(title.toString(),
                style: boldTextStyle(
                    color: myAccountCubit.userDetail.data!.addLimitCount == 0 &&
                            myAccountCubit.userDetail.data!.contactInfo == 0 &&
                            myAccountCubit.userDetail.data!.advertisement == 0
                        ? grey
                        : AppColors.colorMaster,
                    size: 22))
            : Image.asset(img, height: 20, width: 20, color: AppColors.colorMaster),
        8.height,
        myAccountCubit.userDetail.data!.addLimitCount == 0 &&
                myAccountCubit.userDetail.data!.contactInfo == 0 &&
                myAccountCubit.userDetail.data!.advertisement == 0 &&
                myAccountCubit.userDetail.data!.isSubscribe == "1"
            ? FittedBox(
                child: Text(
                  "+ $title1",
                  style: primaryTextStyle(size: 13, color: AppColors.colorMaster),
                  textAlign: TextAlign.center,
                ),
              )
            : FittedBox(child: Text(title1, style: primaryTextStyle(size: 13)))
      ]),
    ).onTap(onTap).expand();
  }
*/ /*
}*/

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyAccountCubit myAccountCubit = MyAccountCubit.get(context);
    if (isLogin) {
      myAccountCubit.getUserDetail();
    }
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: BlocConsumer<MyAccountCubit, MyAccountState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return Scaffold(
              appBar: CustomAppBar(
                title: 'Account'.tr(),
              ),
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 30.h),
                        isLogin
                            ? myAccountCubit.userDetail.data != null
                                ? _buildProfileSection(context, myAccountCubit)
                                : SizedBox.shrink()
                            : _buildProfileLogin(context),
                        SizedBox(height: 34.h),
                        _buildMenuItems(context),
                        Spacer(),
                        if (isLogin)
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 50.w),
                            child: Column(
                              spacing: 10.h,
                              children: [
                                MasterButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return TwoButtonAlert(
                                          title:
                                              "You are one step away from logging out. Do you really want to log out?"
                                                  .tr(),
                                          onTap: () {
                                            navigateBack(context);
                                            myAccountCubit.logout();
                                          },
                                          textButtonConfirm: "Log Out".tr(),
                                        );
                                      },
                                    );
                                  },
                                  typeButton: TypeButton.svgText,
                                  text: 'Log Out'.tr(),
                                  svgPath: "assets/svg_icon/Vector.svg",
                                ),
                                MasterButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return TwoButtonAlert(
                                          title:
                                              "You are one step away from deleting the account. Do you really want to delete it?"
                                                  .tr(),
                                          onTap: () {
                                            navigateBack(context);
                                            myAccountCubit.deleteUserAccount();
                                          },
                                          textButtonConfirm: "Delete".tr(),
                                        );
                                      },
                                    );
                                  },
                                  typeButton: TypeButton.iconText,
                                  iconColor: AppColors.colorError,
                                  textColor: AppColors.colorError,
                                  text: 'Delete Account'.tr(),
                                  icon: Icons.delete_rounded,
                                  backgroundColor: AppColors.colorTransparent,
                                ),
                              ],
                            ),
                          ),
                        SizedBox(height: 130.h),
                      ],
                    ),
                    if(state is DeleteUserAccountLoadingState)Loader(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildProfileSection(context, MyAccountCubit myAccountCubit) {
    return Container(
      padding: EdgeInsets.all(7.h),
      decoration: AppBoxDecoration.cardDecoration,
      child: Row(
        children: [
          Container(
            decoration: AppBoxDecoration.decorationCircleBorder,
            child: ClipOval(
              child: cachedImage(
                myAccountCubit.userDetail.data!.profileImage.toString(),
                height: 65.h,
                width: 65.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${myAccountCubit.userDetail.data!.firstName} ${myAccountCubit.userDetail.data!.lastName}",
                style: TextStyles.font20BlackMedium,
              ),
              SizedBox(height: 4.h),
              InkWell(
                onTap: () {
                  navigateTo(EditProfileScreen(
                    userDetail: myAccountCubit.userDetail,
                  ));
                },
                child: Text(
                  'Edit profile'.tr(),
                  style: TextStyles.font16MediumGrayTextMedium,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProfileLogin(context) {
    return Container(
      padding: EdgeInsets.all(7.h),
      decoration: AppBoxDecoration.cardDecoration,
      child: Row(
        children: [
          ClipOval(
            child: SvgPicture.asset(
              'assets/svg_icon/healthicons_ui-user-profile.svg',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16.w),
          MasterButton(
            width: 150.w,
            onPressed: () {
              navigateTo(LoginScreen());
            },
            text: 'Login'.tr(),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItems(context) {
    return Container(
      decoration: AppBoxDecoration.cardDecoration,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
        child: Column(
          children: [
            AccountMenuItem(
              icon: AppImage.solarHeart,
              title: 'Manage Favorites'.tr(),
              onTap: () {
                if (isLogin) {
                  LayoutCubit.get(context).changeIndex(2);
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return TwoButtonAlert();
                    },
                  );
                }
              },
            ),
            Divider(
              color: AppColors.colorMediumGrayText,
            ),
            AccountMenuItem(
              icon: AppImage.myUnits,
              title: 'My Units'.tr(),
              onTap: () {
                if (isLogin) {
                  navigateTo(MyPropertiesScreen());
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return TwoButtonAlert();
                    },
                  );
                }
              },
            ),
            Divider(
              color: AppColors.colorMediumGrayText,
            ),
            AccountMenuItem(
              icon: AppImage.help,
              title: 'Contact us'.tr(),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Material(
                            borderRadius: BorderRadius.circular(10.r),
                            child: Container(
                              padding: EdgeInsets.all(25.sp),
                              decoration: BoxDecoration(
                                color: AppColors.colorWhite,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Column(
                                spacing: 18.h,
                                children: [
                                  Row(
                                    spacing: 10.w,
                                    children: [
                                      SvgPicture.asset(AppImage.help),
                                      Text(
                                        'Contact Us'.tr(),
                                        style: TextStyle(
                                            color: AppColors.colorBlack,
                                            fontSize: 25.sp,
                                            fontWeight: FontManger.semiBold),
                                      ),
                                    ],
                                  ),
                                  Text(
                                      'Need assistance? We’re here for you! Reach out, and we’ll gladly assist you.!'
                                          .tr(),
                                      textAlign: TextAlign.center,
                                      style: TextStyles
                                          .font16MediumGrayTextMedium),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            commonLaunchUrl(
                                                'tel:${appSettingMain.contactNumber}');
                                          },
                                          child: Column(
                                            children: [
                                              Container(
                                                width: 118.w,
                                                height: 109.h,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 30.sp,
                                                    vertical: 15.h),
                                                decoration: BoxDecoration(
                                                  color: AppColors.colorBlack,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r),
                                                ),
                                                child: SvgPicture.asset(
                                                    AppImage.mobile),
                                              ),
                                              Text(
                                                'Call'.tr(),
                                                style: TextStyle(
                                                    color: AppColors.colorBlack,
                                                    fontSize: 25.sp,
                                                    fontWeight:
                                                        FontManger.semiBold,
                                                    decoration: TextDecoration
                                                        .underline),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: InkWell(
                                          onTap: () async {
                                            final Uri emailLaunchUri = Uri(
                                              scheme: 'mailto',
                                              path: appSettingMain.contactEmail,
                                            );
                                            await launchUrl(emailLaunchUri,
                                                    mode: LaunchMode
                                                        .externalApplication)
                                                .then((value) {})
                                                .catchError((e) {
                                              toast(
                                                  '${"individual".tr()} $emailLaunchUri');
                                            });
                                          },
                                          child: Column(
                                            children: [
                                              Container(
                                                width: 118.w,
                                                height: 109.h,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20.sp,
                                                    vertical: 25.h),
                                                decoration: BoxDecoration(
                                                  color: AppColors.colorBlack,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r),
                                                ),
                                                child: SvgPicture.asset(
                                                    AppImage.mail),
                                              ),
                                              Text(
                                                'Mail'.tr(),
                                                style: TextStyle(
                                                    color: AppColors.colorBlack,
                                                    fontSize: 25.sp,
                                                    fontWeight:
                                                        FontManger.semiBold,
                                                    decoration: TextDecoration
                                                        .underline),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
                //  HelpCenterScreen().launch(context);
              },
            ),
            /*  AccountMenuItem(
              icon: 'assets/svg_icon/formkit_help.svg',
              title: 'Help'.tr(),
              onTap: () {
                HelpCenterScreen().launch(context);
              },
            ),*/
            Divider(
              color: AppColors.colorMediumGrayText,
            ),
            AccountMenuItem(
              icon: AppImage.clarityLanguage,
              title: 'Select Language'.tr(),
              onTap: () {
                showModalBottomSheet(
                  backgroundColor: AppColors.colorWhite,
                  enableDrag: true,
                  //barrierColor: AppColors.colorMaster,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r)),
                  context: context,
                  builder: (context) {
                    LanguageCubit cubit = LanguageCubit.get(context);
                    return BlocBuilder<LanguageCubit, LanguageState>(
                      builder: (context, state) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.w, vertical: 5.h),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            spacing: 10.h,
                            children: [
                              Container(
                                height: 4.h,
                                width: 144.w,
                                color: AppColors.colorMediumGrayText,
                              ),
                              SizedBox.shrink(),
                              CustomFlushBar(
                                image: AppImage.iraqFlag,
                                text: 'اللغة العربية',
                                onTap: () async {
                                  cubit.selectLanguage("ar");
                                  await context.setLocale(
                                      EasyLocalization.of(context)!
                                          .supportedLocales[1]);
                                  await SharedPreferencesManager.saveData(
                                      AppConstants.local, "ar");
                                  navigateBack(context);
                                  LayoutCubit.get(context).changeIndex(0);
                                },
                                isPressed: cubit.selectedLanguage == "ar",
                              ),
                              CustomFlushBar(
                                image: AppImage.usFlag,
                                text: 'English',
                                onTap: () async {
                                  cubit.selectLanguage("en");
                                  await context.setLocale(
                                      EasyLocalization.of(context)!
                                          .supportedLocales[0]);
                                  await SharedPreferencesManager.saveData(
                                      AppConstants.local, "en");
                                  navigateBack(context);
                                  LayoutCubit.get(context).changeIndex(0);
                                },
                                isPressed: cubit.selectedLanguage == "en",
                              ),
                              SizedBox.shrink(),
                            ],
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
            Divider(
              color: AppColors.colorMediumGrayText,
            ),
            AccountMenuItem(
              icon: AppImage.news,
              title: 'News Articles'.tr(),
              onTap: () {
                navigateTo(NewsAllScreen());
              },
            ), /* Divider(
              color: AppColors.colorMediumGrayText,

            ),
            AccountMenuItem(
              icon: AppImage.currency,
              title: 'Currency'.tr(),
              onTap: () {
                // Handle currency tap
              },
            ),*/
          ],
        ),
      ),
    );
  }
}

class AccountMenuItem extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;

  const AccountMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 24.r,
              height: 24.r,
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                title,
                style: TextStyles.font16BlackMedium,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16.r,
              color: AppColors.colorBlack,
            ),
          ],
        ),
      ),
    );
  }
}
