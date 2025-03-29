import 'package:bayt_finder/components/auth_text_form_field/auth_text_form_field.dart';
import 'package:bayt_finder/nav.dart';
import 'package:bayt_finder/screens/my_property/add_Property_screen.dart';
import 'package:bayt_finder/screens/layout/cubit/layout_cubit.dart';
import 'package:bayt_finder/screens/property/cubit/property_cubit.dart';
import 'package:bayt_finder/screens/property/property_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../components/slider_components.dart';
import '../../utils/alert_two_buttons.dart';
import '../../utils/styles.dart';
import '../my_property/cubit/my_property_cubit.dart';
import '../../components/top_agencies_component.dart';
import '../../main.dart';
import '../../utils/colors.dart';
import '../../utils/images.dart';
import '../filter/filter_screen.dart';
import '../filter/search_screen.dart';
import '../notification/notification_screen.dart';
import '../top_agencies/top_agencies.dart';
import 'cubit/home_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver  {
  TextEditingController mSearchCont = TextEditingController();

  late HomeCubit homeCubit;

  @override
  void initState() {
    super.initState();
    homeCubit = HomeCubit.get(context);
    if (!homeCubit.permission) {
      homeCubit.getLocation();
    }
    if (isLogin && homeCubit.userDetail.data == null) {
      homeCubit.getUserDetail();
    }
    homeCubit.getDashboardList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.colorBGSheet,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor:AppColors.colorWhite ,
            elevation: 0,
            leading: Padding(
              padding: EdgeInsetsDirectional.only(start: 10.w, top: 10.h),
              child: Image.asset(AppImage.splash,
                  height: 50.h,
                  width: 80.w,
                  color: AppColors.colorMaster,
                  fit: BoxFit.fill),
            ),
            actions: [
              /*  citySelectionWidget(),
              6.width*/
              Padding(
                padding: EdgeInsetsDirectional.only(end: 20.w),
                child: InkWell(
                    onTap: () {
                      if (isLogin) {
                        navigateTo( NotificationScreen());
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return TwoButtonAlert();
                          },
                        );
                      }
                    },
                    child: SvgPicture.asset(
                      AppImage.notification,
                      width: 24,
                      height: 24,
                    )),
              )
            ],
          ),
          body: Column(
            children: [
              searchWidget(),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      spacing: 30.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox.shrink(),
                        SlidesComponents(data: homeCubit.slider),
                        categoryList(),
                        popularAreasList(),
                        topAgenciesList(),
                        mangeMyProperty(),
                        SizedBox(
                          height: 120.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          /*if (appStore.latitude ==null)
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WaveAnimation(
                key: homeCubit.waveAnimationKey,
                size: 80.0,
                color: AppColors.colorMaster.withOpacity(0.3),
                // You can specify your desired color here
                centerChild: Image.asset(AppImage.icLogo,
                    color: AppColors.colorMediumGrayTextForm,
                    height: 22,
                    width: 24),
              ),
              Text("Fetching Your Current Location".tr(),
                  style: secondaryTextStyle(color: AppColors.colorMaster))
            ],
          ),*/
          /* floatingActionButton: Padding(
            padding: EdgeInsets.only(bottom: 100.h),
            child: FloatingActionButton(
              heroTag: "chatGpt",
              onPressed: () {
                ChattingScreen().launch(context);
              },
              backgroundColor: AppColors.colorMaster,
              child: Image.asset(ic_bot,
                  color: Colors.white, width: 30, height: 30),
            ),
          ),*/
        );
      },
    );
  }

  Widget searchWidget() {
    return Container(
      color: AppColors.colorWhite,
      child: Padding(
        padding: EdgeInsets.all(18.sp),
        child: Row(
          spacing: 14.w,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SizedBox(
                height: 43.h,
                child: AuthTextFormField(
                    hintText: 'search'.tr(),
                    readOnly: true,
                    onTap: () async {
                      navigateTo( SearchScreen());
                    },
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.sp),
                      child: SvgPicture.asset(AppImage.search2),
                    ),
                    fillColor: AppColors.colorBGSheet,
                    suffixIcon: SizedBox.shrink(),
                    obscureText: false),
              ),
            ),
            InkWell(
              onTap: () {
                navigateTo( FilterScreen());
              },
              child: Container(
                  height: 43.h,
                  width: 52.w,
                  decoration: BoxDecoration(
                      color: AppColors.colorBGSheet,
                      borderRadius: BorderRadius.circular(7.r),
                      border: Border.all(
                        width: 1.w,
                        color: AppColors.colorBorderMediumGray,
                      )),
                  child: Center(
                      child: SvgPicture.asset(
                    AppImage.filter,
                  ))),
            )
          ],
        ),
      ),
    );
  }

  Widget categoryList() {
    if (homeCubit.category.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 25.h,
        children: [
          Text("Searching For".tr(),
              style: TextStyle(
                  color: AppColors.colorBlack,
                  fontSize: 18.sp,
                  fontWeight: FontManger.extraBold)),
          SizedBox(
            height: 100.h,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      LayoutCubit.get(context).changeIndex(1);
                      PropertyCubit.get(context).filterProperty(
                          categoryId: homeCubit.category[index].id,
                          titleScreen:
                              homeCubit.category[index].name.toString());
/*                      navigateTo( SearchResultScreen(
                          title1: false,
                          title: false,
                          bhkSend: bhkSend,
                          bhk: selectCategory,
                          budgetMaxPrice: budgetMaxPrice,
                          budgetMinPrice: budgetMinPrice,
                          selectCategory: homeCubit.category[index].id!));*/
                    },
                    child: Container(
                      height: 100.h,
                      width: 100.w,
                      padding: EdgeInsets.only(
                          top: 16.w, right: 4.w, left: 4.w, bottom: 7.w),
                      decoration: BoxDecoration(
                        color: AppColors.colorWhite,
                        borderRadius: BorderRadius.circular(7.r),
                        border: Border.all(
                          width: 1.w,
                          color: AppColors.colorBorderMediumGray,
                        ),
                      ),
                      child: Column(
                        spacing: 8.h,
                        children: [
                          Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: Image.network(
                              homeCubit.category[index].categoryImage
                                  .toString(),
                              fit: BoxFit.fill,
                            ),
                          )),
                          Text(homeCubit.category[index].name.toString(),
                              style: TextStyle(
                                  color: AppColors.colorBlack,
                                  fontSize: 14.sp,
                                  fontWeight: FontManger.regular)),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 15.w,
                  );
                },
                itemCount: homeCubit.category.length),
          )

          /*HorizontalList(
            itemCount: homeCubit.category.length,
            itemBuilder: (BuildContext context, int i) {
              return InkWell(
                onTap: () {
                  selectCategory = homeCubit.category[i].id!;
                  budgetMinPrice = 0.0;
                  budgetMaxPrice = 0.0;
                  bhkSend = int.tryParse('');
              */ /*    SearchResultScreen(
                      title1: false,
                      title: false,
                      bhkSend: bhkSend,
                      bhk: selectCategory,
                      budgetMaxPrice: budgetMaxPrice,
                      budgetMinPrice: budgetMinPrice,
                      selectCategory: selectCategory)
                      .launch(context);*/ /*
                },
                child: Container(
                  height: 100.h,
                  width: 100.w,
                  padding: EdgeInsets.only(
                      top: 16.w, right: 4.w, left: 4.w, bottom: 7.w),
                  decoration: BoxDecoration(
                    color: AppColors.colorWhite,
                    borderRadius: BorderRadius.circular(7.r),
                    border: Border.all(
                      width: 1.w,
                      color: AppColors.colorBorderMediumGray,
                    ),
                  ),
                  child: Column(
                    spacing: 8.h,
                    children: [
                      Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: Image.network(
                              homeCubit.category[i].categoryImage.toString(),
                              fit: BoxFit.fill,
                            ),
                          )),
                      Text(homeCubit.category[i].name.toString(),
                          style: TextStyle(
                              color: AppColors.colorBlack,
                              fontSize: 14.sp,
                              fontWeight: FontManger.regular)),
                    ],
                  ),
                ),
              );
            },
          ),*/
        ],
      );
    }
    return SizedBox.shrink();
  }

  Widget popularAreasList() {
    if (homeCubit.cityList.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 24.h,
        children: [
          Text("Popular Areas".tr(),
              style: TextStyle(
                  color: AppColors.colorBlack,
                  fontSize: 18.sp,
                  fontWeight: FontManger.extraBold)),
          SizedBox(
            height: 147.h,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      navigateTo( PropertyScreen());
                      PropertyCubit.get(context).filterProperty(
                          city: homeCubit.cityList[index].selectVal.toString(),
                          titleScreen:
                              homeCubit.cityList[index].title.toString());
                      /*                 SearchResultScreen(
                    title1: false,
                    title: false,
                    bhkSend: bhkSend,
                    bhk: selectCategory,
                    budgetMaxPrice: budgetMaxPrice,
                    budgetMinPrice: budgetMinPrice,
                    selectCategory: selectCategory)
                    .launch(context);*/
                    },
                    child: Column(
                      spacing: 3.h,
                      children: [
                        Expanded(
                          child: Container(
                            width: 120.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              child: Image.network(
                                homeCubit.cityList[index].categoryImage
                                    .toString(),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Text(homeCubit.cityList[index].title.toString(),
                            style: TextStyles.font16BlackMedium),
                        Text(
                            "${homeCubit.cityList[index].count.toString()} ${"Properties".tr()}",
                            style: TextStyles.font16MediumGrayTextMedium),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 15.w,
                  );
                },
                itemCount: homeCubit.cityList.length),
          )
        ],
      );
    }
    return SizedBox.shrink();
  }

  Widget topAgenciesList() {
    if (homeCubit.agentList.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 24.h,
        children: [
          Text("Top Agencies".tr(),
              style: TextStyle(
                  color: AppColors.colorBlack,
                  fontSize: 18.sp,
                  fontWeight: FontManger.extraBold)),

          SizedBox(
            height: 125.h,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                                navigateTo(
                                    TopAgencies(
                              propertyId: homeCubit.agentList[index].id!,
                            //  onCall: () {}
                                    )
                                );
                    },
                    child: TopAgenciesComponents(
                        agentList: homeCubit.agentList[index]),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 15.w,
                  );
                },
                itemCount: homeCubit.agentList.length),
          )
        ],
      );
    }
    return SizedBox.shrink();
  }

  Widget mangeMyProperty() {
    return InkWell(
      onTap: () {
        if(isLogin){
          MyPropertyCubit.get(context).getCategory();
          navigateTo( AddPropertyScreen());
        }else{
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return TwoButtonAlert();
            },
          );
        }

        /*    showDialog(
           context: context,
           builder: (context) {
             return AddPropertyDialog();
           },
         );*/
        /*
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
         );*/
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: AppColors.colorLayetGray,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 17.h,
                children: [
                  Text("Mange my property".tr(), style: TextStyles.font16BlackBold),
                  Text("Valuate, Analyze and stay updates".tr(),
                      style: TextStyles.font16MediumGrayTextMedium),
                ],
              ),
            ),
            Image.asset(AppImage.house),
          ],
        ),
      ),
    );
  }

}
