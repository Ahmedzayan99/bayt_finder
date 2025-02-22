import 'dart:math';
import 'package:bayt_finder/components/auth_text_form_field/auth_text_form_field.dart';
import 'package:bayt_finder/nav.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../components/advertisement_property_component.dart';
import '../../components/waves_animaiton.dart';
import '../../extensions/colors.dart';
import '../../extensions/extension_util/context_extensions.dart';
import '../../extensions/extension_util/int_extensions.dart';
import '../../extensions/extension_util/string_extensions.dart';
import '../../local_storage/shared_preferences_manager.dart';
import '../../utils/styles.dart';
import '../no_data_screen.dart';
import '../../components/news_components.dart';
import '../../components/other_property_component.dart';
import '../../components/property_components.dart';
import '../../components/slider_components.dart';
import '../../components/suggestion_components.dart';
import '../../components/title_components.dart';
import '../../extensions/animatedList/animated_wrap.dart';
import '../../extensions/decorations.dart';
import '../../extensions/extension_util/widget_extensions.dart';
import '../../extensions/horizontal_list.dart';
import '../../extensions/text_styles.dart';
import '../../main.dart';
import '../../models/dashBoard_response.dart';
import '../../utils/app_common.dart';
import '../../utils/colors.dart';
import '../../utils/images.dart';
import '../advertisement_see_all_screen.dart';
import '../chatting_screen.dart';
import '../filter/filter_screen.dart';
import '../nearBy_all_screen.dart';
import '../news_all_screen.dart';
import '../news_details_screen.dart';
import '../notification_screen.dart';
import '../owner_furnished_see_all.dart';
import '../property_detail_screen.dart';
import '../search_result_screen.dart';
import '../search_screen.dart';
import 'cubit/home_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  TextEditingController mSearchCont = TextEditingController();

  late HomeCubit homeCubit;

  int? currentIndex = 0;

  int? bhkSend;
  int? selectCategory;
  int numberOfParts = 10;

  List<String> myList = [];
  String? selectedCity;
  String? selectCityName;

  double? budgetMinPrice;
  double? budgetMaxPrice;

  bool cityReceived = false;
  bool selectBhk = false;

  @override
  void initState() {
    super.initState();
    homeCubit = HomeCubit.get(context);
    if(homeCubit.userDetail.data ==null){
      homeCubit.getUserDetail();
    }

      homeCubit.getDashboardList();


    homeCubit.getLocation();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.colorBGSheet,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor:
            appStore.isDarkModeOn ? scaffoldColorDark : selectIconColor,
            elevation: 0,
            leading: Padding(
              padding: EdgeInsetsDirectional.only(start: 10.w, top: 10.h),
              child: Image.asset(AppImage.splash,
                  height: 50.h,
                  width: 80.w,
                  color: appStore.isDarkModeOn ? Colors.white : primaryColor,
                  fit: BoxFit.fill),
            ),
            actions: [
              /*  citySelectionWidget(),
              6.width*/
              Padding(
                padding: EdgeInsetsDirectional.only(end: 20.w),
                child: InkWell(
                    onTap: () {
                      NotificationScreen().launch(context);
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
                child: Stack(
                  children: [
                    SingleChildScrollView(
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
                            SizedBox(
                              height: 60.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                    /*     if (homeCubit.property.isEmpty &&
                        homeCubit.advertisementProperty.isEmpty &&
                        homeCubit.category.isEmpty &&
                        homeCubit.slider.isEmpty &&
                        homeCubit.article.isEmpty &&
                        homeCubit.fullyFurnishedProperty.isEmpty &&
                        homeCubit.nearByProperty.isEmpty &&
                        homeCubit.ownerProperty.isEmpty &&
                        homeCubit.amenity.isEmpty &&
                        !homeCubit.isLocationLocation)
                      NoDataScreen(mTitle: "result Not Found".tr()),*/
                    if (homeCubit.isLocationLocation)
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            WaveAnimation(
                              key: homeCubit.waveAnimationKey,
                              size: 80.0,
                              color: primaryColor.withOpacity(0.3),
                              // You can specify your desired color here
                              centerChild: Image.asset(AppImage.icLogo,
                                  color: primaryExtraLight,
                                  height: 22,
                                  width: 24),
                            ),
                            Text("Fetching Your Current Location".tr(),
                                style: secondaryTextStyle(color: primaryColor))
                          ],
                        ),
                      )
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: Padding(
            padding: EdgeInsets.only(bottom: 100.h),
            child: FloatingActionButton(
              heroTag: "chatGpt",
              onPressed: () {
                ChattingScreen().launch(context);
              },
              backgroundColor: primaryColor,
              child: Image.asset(ic_bot,
                  color: Colors.white, width: 30, height: 30),
            ),
          ),
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
              child: Stack(
                children: [
                  SizedBox(
                    height: 43.h,
                    child: AuthTextFormField(
                        hintText: 'search'.tr(),
                        readOnly: true,
                        onTap: () async {
                          navigateTo(context, SearchScreen());
                        },
                        prefixIcon: SizedBox(
                          width: 15.w,
                        ),
                        fillColor: AppColors.colorBGSheet,
                        suffixIcon: SizedBox.shrink(),
                        obscureText: false),
                  ),
                  Transform.translate(
                      offset: Offset(10.w, -8.h),
                      child: SvgPicture.asset(AppImage.search2)),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                navigateTo(context, FilterScreen());
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
          Text("Searching For",
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
                      selectCategory = homeCubit.category[index].id!;
                      budgetMinPrice = 0.0;
                      budgetMaxPrice = 0.0;
                      bhkSend = int.tryParse('');
                          SearchResultScreen(
                      title1: false,
                      title: false,
                      bhkSend: bhkSend,
                      bhk: selectCategory,
                      budgetMaxPrice: budgetMaxPrice,
                      budgetMinPrice: budgetMinPrice,
                      selectCategory: selectCategory)
                      .launch(context);
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
                                  homeCubit.category[index].categoryImage.toString(),
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
                  return SizedBox(width: 15.w,);
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
              *//*    SearchResultScreen(
                      title1: false,
                      title: false,
                      bhkSend: bhkSend,
                      bhk: selectCategory,
                      budgetMaxPrice: budgetMaxPrice,
                      budgetMinPrice: budgetMinPrice,
                      selectCategory: selectCategory)
                      .launch(context);*//*
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 25.h,
        children: [
          Text("Popular Areas",
              style: TextStyle(
                  color: AppColors.colorBlack,
                  fontSize: 18.sp,
                  fontWeight: FontManger.extraBold)),
          SizedBox(
            height: 160.h,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      selectCategory = homeCubit.category[index].id!;
                      budgetMinPrice = 0.0;
                      budgetMaxPrice = 0.0;
                      bhkSend = int.tryParse('');
                      /*    SearchResultScreen(
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
                      spacing: 8.h,
                      children: [
                        Container(
                          height: 100.h,
                          width: 120.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child:ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: Image.network(
                            homeCubit.category[index].categoryImage.toString(),
                            fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Text(homeCubit.category[index].name.toString(),
                            style: TextStyles.font16BlackMedium),
                        Text(homeCubit.category[index].name.toString(),
                            style: TextStyles.font16MediumGrayTextMedium),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: 15.w,);
                },
                itemCount: homeCubit.category.length),
          )
        ],
      ),
    );
  }

  Widget topAgenciesList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 25.h,
      children: [
        Text("Top Agencies",
            style: TextStyle(
                color: AppColors.colorBlack,
                fontSize: 18.sp,
                fontWeight: FontManger.extraBold)),
     /*         Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text("Top Agencies",
                style: TextStyle(
                    color: AppColors.colorBlack,
                    fontSize: 18.sp,
                    fontWeight: FontManger.extraBold)),
            Spacer(),
            InkWell(
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                bool? res = await OwnerFurnishedSeeAllScreen(seller: true)
                    .launch(context);
                if (res == true) {
                  setState(() {});
                }
              },
              splashColor: Colors.transparent,
              child: Text("View All",
                  style: TextStyle(
                      color: AppColors.colorBlack,
                      fontSize: 14.sp,
                      fontWeight: FontManger.semiBold)),
            ),
          ],
        ),*/
        SizedBox(
          height: 125.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    navigateTo(context, PropertyDetailScreen(
                        propertyId: homeCubit.agentList[index].id, onCall: () {}));
                  },
                  child: TopAgenciesComponents(agentList: homeCubit.agentList[index]),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: 15.w,);
              },
              itemCount: homeCubit.agentList.length),
        )
      ],
    );
  }

/* Widget articleWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleComponents(
            title: "newsArticles",
            subTitle: "readWhatsHappeningInRealEstate",
            trailingTitle: "seeAll",
            onTap: () {
              NewsAllScreen().launch(context);
            }),
        HorizontalList(
            spacing: 12,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            itemCount: homeCubit.article.length,
            itemBuilder: (context, articleIndex) {
              return NewsComponents(
                article: homeCubit.article[articleIndex],
              ).onTap(() {
                NewsDetailsScreen(articles: homeCubit.article[articleIndex])
                    .launch(context);
              });
            }),
      ],
    );
  }*/
}
/*
import 'dart:math';
import 'package:bayt_finder/components/auth_text_form_field/auth_text_form_field.dart';
import 'package:bayt_finder/nav.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../components/advertisement_property_component.dart';
import '../../components/waves_animaiton.dart';
import '../../extensions/colors.dart';
import '../../extensions/extension_util/context_extensions.dart';
import '../../extensions/extension_util/int_extensions.dart';
import '../../extensions/extension_util/string_extensions.dart';
import '../../local_storage/shared_preferences_manager.dart';
import '../../utils/styles.dart';
import '../no_data_screen.dart';
import '../../components/news_components.dart';
import '../../components/other_property_component.dart';
import '../../components/property_components.dart';
import '../../components/slider_components.dart';
import '../../components/suggestion_components.dart';
import '../../components/title_components.dart';
import '../../extensions/animatedList/animated_wrap.dart';
import '../../extensions/decorations.dart';
import '../../extensions/extension_util/widget_extensions.dart';
import '../../extensions/horizontal_list.dart';
import '../../extensions/text_styles.dart';
import '../../main.dart';
import '../../models/dashBoard_response.dart';
import '../../utils/app_common.dart';
import '../../utils/colors.dart';
import '../../utils/images.dart';
import '../advertisement_see_all_screen.dart';
import '../chatting_screen.dart';
import '../filter/filter_screen.dart';
import '../nearBy_all_screen.dart';
import '../news_all_screen.dart';
import '../news_details_screen.dart';
import '../notification_screen.dart';
import '../owner_furnished_see_all.dart';
import '../property_detail_screen.dart';
import '../search_result_screen.dart';
import '../search_screen.dart';
import 'cubit/home_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  TextEditingController mSearchCont = TextEditingController();

  late HomeCubit homeCubit;

  int? currentIndex = 0;

  int? bhkSend;
  int? selectCategory;
  int numberOfParts = 10;

  List<String> myList = [];
  String? selectedCity;
  String? selectCityName;

  double? budgetMinPrice;
  double? budgetMaxPrice;

  bool cityReceived = false;
  bool selectBhk = false;

  @override
  void initState() {
    super.initState();
    homeCubit = HomeCubit.get(context);
    homeCubit.getUserDetail();
    homeCubit.getDashboardList();
    homeCubit.getLocation();
    */
/* WidgetsBinding.instance.addObserver(this);*/ /*

    init();
    setState(() {});
  }

  void init() async {

    // if (appStore.latitude.isNotEmpty && appStore.longitude.isNotEmpty && appStore.cityName.isNotEmpty) {
    // await getData();
    // await updateUserLatLong();
    // }
    */
/* if (await checkPermission()) {
      await checkLocationPermissionOnLaunch(context);
    }*/ /*

    // setState(() {});
  }

  */
/* void initLocationStream() async {
    positionStream?.cancel();

    positionStream =
        Geolocator.getPositionStream().listen((Position event) async {
      List<Placemark> placeMarks = await placemarkFromCoordinates(
        event.latitude,
        event.longitude,
      );
      if (placeMarks.isNotEmpty && cityReceived == false) {
        appStore.setUserLatitude(event.latitude.toString());
        appStore.setUserLongitude(event.longitude.toString());
        appStore.setUserCity(placeMarks.first.locality!);
        if (appStore.latitude.isNotEmpty &&
            appStore.longitude.isNotEmpty &&
            appStore.cityName.isNotEmpty &&
            cityReceived == false) {
          await getData();
        }
        cityReceived = true;

        setState(() {});
      }
    }, onError: (error) {
      setState(() {});
    });
  }*/ /*


  List<String> generateList() {
    int start = int.tryParse(appStore.minPrice.replaceAll(',', '')) ?? 0;
    int end = int.tryParse(appStore.maxPrice.replaceAll(',', '')) ?? 0;
    int difference = ((end - start) / (numberOfParts - 1)).round();

    List<String> list = [];
    for (int i = 0; i < numberOfParts; i++) {
      list.add((start + (difference * i)).toString());
    }

    myList = list;
    setState(() {});

    return list;
  }

  // updateUserLatLong() async {
  //   Map req = {
  //     "latitude": appStore.latitude,
  //     "longitude": appStore.longitude,
  //
  //   };
  //   await updatePlayerIdApi(req).then((value) {
  //     //
  //   }).catchError((error) {
  //     //
  //   });
  // }

  // Future<void> getData() async {
  //   appStore.setLoading(true);
  //  await getDashBoardData({
  //     "latitude": 30.1348533,
  //     "longitude": 31.267225,
  //     "city": "Bahtim",
  //     "player_id": SharedPreferencesManager.getStringAsync(PLAYER_ID)
  //   }).then((value) {
  //     data = value;
  */
/*     appStore.setMinPrice(homeCubit.filterConfiguration!.minPrice.toString());
      appStore.setMaxPrice(homeCubit.filterConfiguration!.maxPrice.toString());*/ /*

  //     generateList();
  //     setState(() {});
  //   }).catchError((e) {
  //     setState(() {});
  //     print("=======>${e.toString()}");
  //   }).whenComplete(
  //     () => appStore.setLoading(false),
  //   );
  // }



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.colorBGSheet,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor:
            appStore.isDarkModeOn ? scaffoldColorDark : selectIconColor,
            elevation: 0,
            leading: Padding(
              padding: EdgeInsetsDirectional.only(start: 10.w, top: 10.h),
              child: Image.asset(AppImage.splash,
                  height: 50.h,
                  width: 80.w,
                  color: appStore.isDarkModeOn ? Colors.white : primaryColor,
                  fit: BoxFit.fill),
            ),
            actions: [
              */
/*  citySelectionWidget(),
              6.width*/ /*

              Padding(
                padding: EdgeInsetsDirectional.only(end: 20.w),
                child: InkWell(
                    onTap: () {
                      NotificationScreen().launch(context);
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
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          spacing: 30.h,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox.shrink(),
                            if (homeCubit.slider.isNotEmpty)
                              SlidesComponents(data: homeCubit.slider),
                            categoryList(),
                            if (homeCubit.property.isNotEmpty) propertiesList(),
                            ownerPropertyWidget()
                                .visible(homeCubit.agentList.isNotEmpty),
                            if (homeCubit.advertisementProperty.isNotEmpty)
                              advertiseListWidget(),
                            if (homeCubit.nearByProperty.isNotEmpty)
                              nearByPropertyList(),
                            if (homeCubit.fullyFurnishedProperty.isNotEmpty)
                              fullyFurnisedWidget(),
                            if (homeCubit.article.isNotEmpty) articleWidget(),
                            SizedBox(
                              height: 60.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                    */
/*     if (homeCubit.property.isEmpty &&
                        homeCubit.advertisementProperty.isEmpty &&
                        homeCubit.category.isEmpty &&
                        homeCubit.slider.isEmpty &&
                        homeCubit.article.isEmpty &&
                        homeCubit.fullyFurnishedProperty.isEmpty &&
                        homeCubit.nearByProperty.isEmpty &&
                        homeCubit.ownerProperty.isEmpty &&
                        homeCubit.amenity.isEmpty &&
                        !homeCubit.isLocationLocation)
                      NoDataScreen(mTitle: "result Not Found".tr()),*/ /*

                    if (homeCubit.isLocationLocation)
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            WaveAnimation(
                              key: homeCubit.waveAnimationKey,
                              size: 80.0,
                              color: primaryColor.withOpacity(0.3),
                              // You can specify your desired color here
                              centerChild: Image.asset(AppImage.icLogo,
                                  color: primaryExtraLight,
                                  height: 22,
                                  width: 24),
                            ),
                            Text("Fetching Your Current Location".tr(),
                                style: secondaryTextStyle(color: primaryColor))
                          ],
                        ),
                      )
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: Padding(
            padding: EdgeInsets.only(bottom: 100.h),
            child: FloatingActionButton(
              heroTag: "chatGpt",
              onPressed: () {
                ChattingScreen().launch(context);
              },
              backgroundColor: primaryColor,
              child: Image.asset(ic_bot,
                  color: Colors.white, width: 30, height: 30),
            ),
          ),
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
              child: Stack(
                children: [
                  SizedBox(
                    height: 43.h,
                    child: AuthTextFormField(
                        hintText: 'search'.tr(),
                        readOnly: true,
                        onTap: () async {
                          navigateTo(context, SearchScreen());
                        },
                        prefixIcon: SizedBox(
                          width: 15.w,
                        ),
                        fillColor: AppColors.colorBGSheet,
                        suffixIcon: SizedBox.shrink(),
                        obscureText: false),
                  ),
                  Transform.translate(
                      offset: Offset(10.w, -8.h),
                      child: SvgPicture.asset(AppImage.search2)),
                ],
              ),
            ),
            */
/* AppTextField(
                readOnly: true,
                controller: mSearchCont,
                textStyle: primaryTextStyle(),
                textFieldType: TextFieldType.NAME,
                onTap: () async {
                  bool? res = await SearchScreen(isBack: true).launch(context);
                  if (res == true) {
                    init();
                    setState(() {});
                  }
                  setState(() {});
                },

                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  border: InputBorder.none,
                  hintText: "search",
                  focusColor: AppColors.colorBGSheet,
                  hintStyle: primaryTextStyle(color: grey),
                  fillColor: AppColors.colorBGSheet,)),*/ /*

            InkWell(
              onTap: () {
                FilterScreen(isSelect: true).launch(context);
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

  Widget citySelectionWidget() {
    return homeCubit.propertyCity.isNotEmpty
        ? SizedBox(
      width: 160,
      height: 40,
      child: DropdownButtonFormField<String>(
        focusColor: Colors.transparent,
        alignment: Alignment.centerLeft,
        isExpanded: true,
        padding: EdgeInsets.zero,
        elevation: 0,
        icon:
        Icon(Icons.keyboard_arrow_down_rounded, color: primaryColor),
        borderRadius: radius(),
        decoration: InputDecoration(
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            prefixIconConstraints: BoxConstraints(minWidth: 1),
            prefixIcon: Image.asset(ic_map_point,
                color: primaryColor, width: 18, height: 18)
                .paddingOnly(left: 14, top: 10, bottom: 10, right: 10),
            alignLabelWithHint: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: radius(24),
                borderSide: BorderSide(
                    color: appStore.isDarkModeOn
                        ? cardDarkColor
                        : primaryExtraLight,
                    width: 1)),
            border: OutlineInputBorder(
                borderRadius: radius(24),
                borderSide: BorderSide(
                    color: appStore.isDarkModeOn
                        ? cardDarkColor
                        : primaryColor,
                    width: 1)),
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderRadius: radius(24),
                borderSide:
                BorderSide(color: Colors.transparent, width: 0)),
            fillColor:
            appStore.isDarkModeOn ? cardDarkColor : primaryExtraLight,
            contentPadding:
            EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
            enabled: true),
        isDense: true,
        hint: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            homeCubit.propertyCity.isNotEmpty
                ? appStore.cityName.isEmpty
                ? Text(homeCubit.propertyCity[0].name.toString(),
                style: primaryTextStyle(color: primaryColor),
                maxLines: 1)
                : Text(appStore.cityName,
                style: primaryTextStyle(color: primaryColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis)
                .expand()
                : Text("select City",
                style: primaryTextStyle(color: primaryColor),
                maxLines: 1),
          ],
        ),
        dropdownColor: context.cardColor,
        items: homeCubit.propertyCity.map((PropertyCity e) {
          return DropdownMenuItem<String>(
            value: homeCubit.propertyCity
                .contains(SharedPreferencesManager.getStringAsync( "city"))
                ? SharedPreferencesManager.getStringAsync( "city")
                : e.name.validate(),
            child: Text(e.name.validate(),
                style: primaryTextStyle(color: primaryColor),
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                textAlign: TextAlign.end),
          );
        }).toList(),
        onChanged: (String? value) async {
          selectedCity = value;
          selectCityName = value;
          appStore.setUserCity(selectCityName!);
          appStore.isLoading = true;
          setState(() {});
          //await getData();
          appStore
              .setMinPrice(filterConfigurationMain.minPrice.toString());
          appStore
              .setMaxPrice(filterConfigurationMain.maxPrice.toString());
          generateList();

          setState(() {});
        },
      ),
    ).paddingSymmetric(vertical: 8)
        : SizedBox();
  }

  Widget advertiseListWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleComponents(
          title: "advertisement Properties",
          trailingTitle: "see All",
          onTap: (() async {
            bool? res = await AdvertisementSeeAllScreen(onCall: () {
              init();
              setState(() {});
            }).launch(context);
            if (res == true) {
              init();
              setState(() {});
            }
          }),
        ),
        HorizontalList(
            spacing: 12,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            itemCount: homeCubit.advertisementProperty.length,
            itemBuilder: (context, i) {
              return AdvertisementPropertyComponent(
                  property: homeCubit.advertisementProperty[i])
                  .onTap(() async {
                bool? res = await PropertyDetailScreen(
                    propertyId: homeCubit.advertisementProperty[i].id,
                    onCall: () {
                      init();
                    },
                    onTap: (bool? result) {
                      //   getData();
                      setState(() {});
                    }).launch(context);
                if (res == true) {
                  init();
                  setState(() {});
                }
                setState(() {});
              });
            }),
      ],
    );
  }

  Widget propertiesList() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 25.h,
        children: [
          Text("Popular Areas",
              style: TextStyle(
                  color: AppColors.colorBlack,
                  fontSize: 18.sp,
                  fontWeight: FontManger.extraBold)),
          */
/*TitleComponents(
            title: "properties",
            trailingTitle: "seeAll",
            onTap: (() async {
              bool? res = await SeeAllScreen(onCall: () {
                init();
                setState(() {});
              }).launch(context);
              if (res == true) {
                init();
                setState(() {});
              }
            }),
          ),*/ /*

          HorizontalList(
              itemCount: homeCubit.property.length,
              spacing: 12.w,
              itemBuilder: (context, i) {
                return PropertyComponents(property: homeCubit.property[i])
                    .onTap(() async {
                  bool? res = await PropertyDetailScreen(
                      propertyId: homeCubit.property[i].id,
                      onTap: (bool? result) {
                        //getData();
                        setState(() {});
                      }).launch(context);
                  if (res!) {
                    setState(() {});
                  }

                  setState(() {});
                });
              }),
        ],
      ),
    );
  }

  Widget categoryList() {
    if (homeCubit.category.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 25.h,
        children: [
          Text("Searching For",
              style: TextStyle(
                  color: AppColors.colorBlack,
                  fontSize: 18.sp,
                  fontWeight: FontManger.extraBold)),
          HorizontalList(
            itemCount: homeCubit.category.length,
            itemBuilder: (BuildContext context, int i) {
              return InkWell(
                onTap: () {
                  selectCategory = homeCubit.category[i].id!;
                  budgetMinPrice = 0.0;
                  budgetMaxPrice = 0.0;
                  bhkSend = int.tryParse('');
                  setState(() {});
                  SearchResultScreen(
                      title1: false,
                      title: false,
                      bhkSend: bhkSend,
                      bhk: selectCategory,
                      budgetMaxPrice: budgetMaxPrice,
                      budgetMinPrice: budgetMinPrice,
                      selectCategory: selectCategory)
                      .launch(context);
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
          ),
        ],
      );
    }
    return SizedBox.shrink();
  }
  Widget nearByPropertyList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleComponents(
          title: "nearByProperty",
          subTitle: "handpickedPropertiesForYou",
          trailingTitle: "seeAll",
          onTap: () async {
            bool? res = await NearBySeeAllScreen().launch(context);
            if (res == true) {
              init();
              setState(() {});
            }
          },
        ).visible(homeCubit.nearByProperty.isNotEmpty),
        8.height,
        CarouselSlider(
          items: List.generate(
            homeCubit.nearByProperty.length,
                (index) => SuggestionComponents(
              propertyId: homeCubit.nearByProperty[index].id,
              imageFull: true,
              price: homeCubit.nearByProperty[index].price,
              address: homeCubit.nearByProperty[index].address.validate(),
              name: homeCubit.nearByProperty[index].name.validate(),
              img: homeCubit.nearByProperty[index].propertyImage.validate(),
              propertyTFor:
              homeCubit.nearByProperty[index].propertyFor.validate(),
              isFav: homeCubit.nearByProperty[index].isFavourite,
            ).onTap(() async {
              await PropertyDetailScreen(
                  propertyId: homeCubit.nearByProperty[index].id,
                  onTap: (bool? result) {
                    init();
                    setState(() {});
                  }).launch(context);
            }),
          ),
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * 0.3,
            viewportFraction: 0.65,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: false,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            onPageChanged: (index, _) {
              setState(() {
                currentIndex = index;
              });
            },
            scrollDirection: Axis.horizontal,
          ),
        ).visible(homeCubit.nearByProperty.isNotEmpty),
      ],
    );
  }

  Widget myListWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleComponents(
            title: "selectBudget",
            subTitle: "explorePro" "pertiesBasedOnBudget",
            trailingTitle: ""),
        HorizontalList(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          itemCount: myList.length,
          spacing: 8,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: boxDecorationWithRoundedCorners(
                backgroundColor:
                appStore.isDarkModeOn ? cardDarkColor : primaryExtraLight,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                  "${"upTo"} ${formatNumberString(myList[index].toInt())}",
                  style: secondaryTextStyle(size: 16)),
            ).onTap(() async {
              if (index == 0) {
                budgetMinPrice = 0.0;
                budgetMaxPrice = myList[index].toDouble();
              } else {
                budgetMinPrice = myList[index - 1].toDouble();
                budgetMaxPrice = myList[index].toDouble();
              }

              selectBhk = true;
              bhkSend = int.tryParse('');
              setState(() {});
              SearchResultScreen(
                title1: true,
                bhkSend: bhkSend,
                budgetMaxPrice: budgetMaxPrice,
                budgetMinPrice: budgetMinPrice,
                selectCategory: selectCategory,
              ).launch(context);
            });
          },
        ),
      ],
    );
  }
  Widget ownerPropertyWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 25.h,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text("Top Agencies",
                style: TextStyle(
                    color: AppColors.colorBlack,
                    fontSize: 18.sp,
                    fontWeight: FontManger.extraBold)),
            Spacer(),
            InkWell(
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                bool? res = await OwnerFurnishedSeeAllScreen(seller: true)
                    .launch(context);
                if (res == true) {
                  init();
                  setState(() {});
                }
              },
              splashColor: Colors.transparent,
              child: Text("View All",
                  style: TextStyle(
                      color: AppColors.colorBlack,
                      fontSize: 14.sp,
                      fontWeight: FontManger.semiBold)),
            ),
          ],
        ),
        */
/*   TitleComponents(
          title: "ownerProperties",
          trailingTitle: "seeAll",
          onTap: () async {
            bool? res = await OwnerFurnishedSeeAllScreen(seller: true).launch(
                context);
            if (res == true) {
              init();
              setState(() {});
            }
          },
        ).visible(homeCubit.ownerProperty!.isNotEmpty),*/ /*

        AnimatedWrap(
          columnCount: 2,
          runSpacing: 16,
          spacing: 16,
          children: List.generate(min(6, homeCubit.agentList.length), (i) {
            return OtherPropertyComponents(
                agentList: homeCubit.agentList[i]
              // name: homeCubit.ownerProperty![i].name,
              // img: homeCubit.ownerProperty![i].propertyImage,
              // property: homeCubit.ownerProperty![i].category,
              // isPremium: homeCubit.ownerProperty![i].premiumProperty,
            )
                .onTap(() async {
              PropertyDetailScreen(
                  propertyId: homeCubit.agentList[i].id,
                  onCall: () {
                    init();
                  }).launch(context);
              setState(() {});
            });
          }),
        )
            .paddingSymmetric(horizontal: 16)
            .visible(homeCubit.agentList.isNotEmpty),
      ],
    );
  }
  Widget fullyFurnisedWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleComponents(
          title: "fullyFurnishedProperties",
          trailingTitle: "seeAll",
          onTap: () async {
            bool? res =
            await OwnerFurnishedSeeAllScreen(seller: false).launch(context);
            if (res == true) {
              init();
              setState(() {});
            }
          },
        ),
        HorizontalList(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            itemCount: homeCubit.fullyFurnishedProperty.length,
            itemBuilder: (context, i) {
              return PropertyComponents(
                  property: homeCubit.fullyFurnishedProperty[i])
                  .onTap(() async {
                PropertyDetailScreen(
                    propertyId: homeCubit.fullyFurnishedProperty[i].id,
                    onTap: (bool? result) {
                      init();
                      setState(() {});
                    }).launch(context);
              });
            }),
      ],
    );
  }
  Widget articleWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleComponents(
            title: "newsArticles",
            subTitle: "readWhatsHappeningInRealEstate",
            trailingTitle: "seeAll",
            onTap: () {
              NewsAllScreen().launch(context);
            }),
        HorizontalList(
            spacing: 12,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            itemCount: homeCubit.article.length,
            itemBuilder: (context, articleIndex) {
              return NewsComponents(
                article: homeCubit.article[articleIndex],
              ).onTap(() {
                NewsDetailsScreen(articles: homeCubit.article[articleIndex])
                    .launch(context);
              });
            }),
      ],
    );
  }
}
*/
