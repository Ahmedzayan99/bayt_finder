import 'package:bayt_finder/components/buttons/master_button.dart';
import 'package:bayt_finder/screens/filter/show_pro_filter.dart';
import 'package:bayt_finder/utils/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../components/appbar/custom_appbar.dart';
import '../../components/auth_text_form_field/auth_text_form_field.dart';
import '../../extensions/decorations.dart';
import '../../nav.dart';
import '../../utils/images.dart';
import 'search_screen.dart';
import '../../utils/colors.dart';
import 'cubit/filter_cubit.dart';

class FilterScreen extends StatefulWidget {
  final bool isSelect;

  const FilterScreen({super.key, this.isSelect = false});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen>
    with SingleTickerProviderStateMixin {


  @override
  Widget build(BuildContext context) {
    FilterCubit filterCubit = FilterCubit.get(context);
    filterCubit.getCity();
    if (filterCubit.categoryListModel.data == null) {
      filterCubit.getCategory();
    }
    if (filterCubit.configurationPriceModel.maxPrice == null) {
      filterCubit.filterConfigurationPrice();
    }
    return BlocConsumer<FilterCubit, FilterState>(
      listener: (context, state) {
        if(state is FilterPropertySuccessState){
          navigateTo( PropertyFilterScreen());
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            title: "Filter".tr(),
            actions: [
              InkWell(
                onTap: () {
                  navigateTo( SearchScreen());
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
                    child: Center(child: SvgPicture.asset(AppImage.search2))),
              ),
            ],
            showBack: true,
          ),
          bottomNavigationBar: Padding(
            padding:  EdgeInsets.all(18.sp),
            child: MasterButton(
              isLoading: state is FilterPropertyLoadingState,
              onPressed: (){
                filterCubit.filterProperty();
              },text: 'Apply Filter'.tr(),),
          ),
          body: SingleChildScrollView(
            child: Column(
              spacing: 12.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox.shrink(),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                  child: Row(
                    spacing: 20.w,
                    children: [
                      Expanded(
                        child: InkWell(
                            onTap: () {
                              filterCubit.selectProperty(0);
                            },
                            child: Container(
                              height: 50.h,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(radiusCircular(14.r)),
                                  color: filterCubit.propertyList[0].select!
                                      ? AppColors.colorMaster
                                      : AppColors.colorMediumGrayBg,
                                  border: Border.all(
                                    color: filterCubit.propertyList[0].select!
                                        ? AppColors.colorMaster
                                        : AppColors.colorMediumGrayBorder,
                                  )),
                              child: Center(
                                child: Text(
                                    filterCubit.propertyList[0].title
                                        .toString().tr(),
                                    style: TextStyle(
                                      fontSize: 19.sp,
                                      fontWeight: FontManger.regular,
                                      color: filterCubit.propertyList[0].select!
                                          ? AppColors.colorWhite
                                          : AppColors.colorMaster,
                                    )),
                              ),
                            )),
                      ),
                      Expanded(
                        child: InkWell(
                            onTap: () {
                              filterCubit.selectProperty(1);
                            },
                            child: Container(
                              height: 50.h,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(radiusCircular(14.r)),
                                  color: filterCubit.propertyList[1].select!
                                      ? AppColors.colorMaster
                                      : AppColors.colorMediumGrayBg,
                                  border: Border.all(
                                    color: filterCubit.propertyList[1].select!
                                        ? AppColors.colorMaster
                                        : AppColors.colorMediumGrayBorder,
                                  )),
                              child: Center(
                                child: Text(
                                    filterCubit.propertyList[1].title
                                        .toString().tr(),
                                    style: TextStyle(
                                      fontSize: 19.sp,
                                      fontWeight: FontManger.regular,
                                      color: filterCubit.propertyList[1].select!
                                          ? AppColors.colorWhite
                                          : AppColors.colorMaster,
                                    )),
                              ),
                            )),
                      ),
                      Expanded(
                        child: InkWell(
                            onTap: () {
                              filterCubit.selectProperty(2);
                            },
                            child: Container(
                              height: 50.h,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(radiusCircular(14.r)),
                                  color: filterCubit.propertyList[2].select!
                                      ? AppColors.colorMaster
                                      : AppColors.colorMediumGrayBg,
                                  border: Border.all(
                                    color: filterCubit.propertyList[2].select!
                                        ? AppColors.colorMaster
                                        : AppColors.colorMediumGrayBorder,
                                  )),
                              child: Center(
                                child: Text(
                                    filterCubit.propertyList[2].title
                                        .toString().tr(),
                                    style: TextStyle(
                                      fontSize: 19.sp,
                                      fontWeight: FontManger.regular,
                                      color: filterCubit.propertyList[2].select!
                                          ? AppColors.colorWhite
                                          : AppColors.colorMaster,
                                    )),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_sharp,
                        size: 24.sp,
                      ),
                      Text(
                        "Location".tr(),
                        style: TextStyles.font20WhiteRegular.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 22.w,),
                  child: AuthTextFormField(
                    onTap: () {
                      showModalBottomSheet(
                        backgroundColor: AppColors.colorWhite,
                        enableDrag: true,
                        //barrierColor: AppColors.colorMaster,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.r)),
                        context: context,
                        builder: (context) {
                          FilterCubit filterCubit = FilterCubit.get(context);
                          return BlocBuilder<FilterCubit, FilterState>(
                            builder: (context, state) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 24.w, vertical: 5.h),
                                child: Column(
                                  spacing: 40.h,
                                  children: [
                                    Container(
                                      height: 4.h,
                                      width: 144.w,
                                      color: AppColors.colorMediumGrayText,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Select City".tr(),
                                          textAlign: TextAlign.start,
                                          style: TextStyles.font20WhiteRegular
                                              .copyWith(
                                            color: AppColors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    AuthTextFormField(
                                        controller:
                                            filterCubit.searchCityController,
                                        hintText: "Search".tr(),
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.all(15.h),
                                          child: SvgPicture.asset(
                                              AppImage.search2),
                                        ),
                                        onChanged: (value) {
                                          filterCubit.searchCity();
                                        },
                                        textInputType: TextInputType.text,
                                        fillColor: AppColors.colorMediumGrayBg,
                                        suffixIcon: SizedBox.shrink(),
                                        obscureText: false),
                                    Expanded(
                                      child: ListView.separated(
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10.h,
                                                  horizontal: 10.w),
                                              child: InkWell(
                                                onTap: () {
                                                  filterCubit.selectCity(
                                                    filterCubit
                                                        .searchCityList[index],
                                                  );
                                                  navigateBack(context);
                                                },
                                                child: Text(
                                                    filterCubit
                                                        .searchCityList[index]
                                                        .title
                                                        .toString(),
                                                    style: TextStyles
                                                        .fontPrivacyPolicy),
                                              ),
                                            );
                                          },
                                          separatorBuilder: (context, index) {
                                            return Container(
                                              height: 2.h,
                                              color: AppColors
                                                  .colorMediumGrayBorder,
                                            );
                                          },
                                          itemCount: filterCubit
                                              .searchCityList.length),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                    readOnly: true,
                    hintText: 'Select City'.tr(),
                    prefixIcon: Icon(
                      Icons.location_on_outlined,
                      color: AppColors.lightGrey,
                      size: 24.sp,
                    ),
                    //onChanged: (value) => context.read<PropertyFilterCubit>().searchCity(value),
                  ),
                ),
                if (filterCubit.citySelect.isNotEmpty)
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 22.w,),
                    child: SizedBox(
                      height: 40.h,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final item = filterCubit.citySelect[index].title!;
                            return Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 2.h),
                              decoration: BoxDecoration(
                                color: AppColors.colorMediumGrayBorderTextForm,
                                borderRadius: BorderRadius.circular(7.r),
                                border: Border.all(
                                  width: 1.w,
                                  color: AppColors.colorBlack,
                                ),
                              ),
                              child: Row(
                                spacing: 3.w,
                                children: [
                                  Text(item,
                                      style: TextStyles.font19DarkGreyRegular),
                                  InkWell(
                                      onTap: () {
                                        filterCubit.removeAtCity(index);
                                      },
                                      child: Icon(Icons.clear)),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: 15.w,
                            );
                          },
                          itemCount: filterCubit.citySelect.length),
                    ),
                  ),
                Divider(
                  color: AppColors.colorMediumGrayText,

                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 28.w,),
                  child: Row(
                    children: [
                    /*  Icon(
                        Icons.location_on_sharp,
                        size: 24.sp,
                      ),*/
                      Text(
                        "Property Types".tr(),
                        style: TextStyles.font20WhiteRegular.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 28.w,),
                  child: categoryList(),
                ),
                Divider(
                  color: AppColors.colorMediumGrayText,

                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w,),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppImage.hotPrice,
                      ),
                      Text(
                        "Price Range".tr(),
                        style: TextStyles.font20WhiteRegular.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                 padding:  EdgeInsets.symmetric(horizontal: 16.w,),
                  child: showSelectSlider(context),
                ),
                Divider(
                  color: AppColors.colorMediumGrayText,

                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 28.w,),
                  child: Row(
                    children: [
                    /*  SvgPicture.asset(
                        AppImage.hotPrice,
                      ),*/
                      Text(
                        "Age Range".tr(),
                        style: TextStyles.font20WhiteRegular.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                 padding:  EdgeInsets.symmetric(horizontal: 16.w,),
                  child: showSelectAge(context),
                ),
                Divider(
                  color: AppColors.colorMediumGrayText,

                ),
                Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 16.w,),
                  child: Row(
                    spacing: 3.w,
                    children: [
                      SvgPicture.asset(
                        AppImage.ionBed,
                        width: 24.w,
                        height: 24.h,
                      ),
                      Text(
                        "BHK".tr(),
                        style: TextStyles.font20WhiteRegular.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 22.w,),
                  child: SizedBox(
                    height: 40.h,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                           onTap: () {
                             filterCubit.selectPropertyBhk(filterCubit.bhkList[index]);
                           },
                            child: Container(
                              width: 56.w,
                              height:47.h ,
                              decoration: BoxDecoration(
                                color:filterCubit.bhkList[index]==filterCubit.selectedBhkValue?AppColors.colorMaster:AppColors.colorWhite,
                                borderRadius: BorderRadius.circular(7.r),
                                border: Border.all(
                                  width: 1.w,
                                  color: AppColors.colorMediumGrayBorder,
                                ),
                              ),
                              child: Center(
                                child: Text(filterCubit.bhkList[index],
                                    style: TextStyles.font19DarkGreyRegular.copyWith(
                                        color:filterCubit.bhkList[index]==filterCubit.selectedBhkValue?AppColors.colorWhite:AppColors.colorMaster )),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: 15.w,
                          );
                        },
                        itemCount: filterCubit.bhkList.length),
                  ),
                ),
                Divider(
                  color: AppColors.colorMediumGrayText,
                ),
                Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 16.w,),
                  child: Row(
                    spacing: 3.w,
                    children: [
                      Image.asset(
                        AppImage.couch,
                        width: 24.w,
                        height: 24.h,
                      ),
                      Text(
                        "Finishing".tr(),
                        style: TextStyles.font20WhiteRegular.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 22.w,),
                  child: SizedBox(
                    height: 40.h,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              filterCubit.selectPropertyFurnished(filterCubit.furnishedTypeList[index]);
                            },
                            child: Container(

                              padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 8.h),
                              decoration: BoxDecoration(
                                color:filterCubit.furnishedTypeList[index]==filterCubit.furnishedValue?AppColors.colorMaster:AppColors.colorWhite,
                                borderRadius: BorderRadius.circular(7.r),
                                border: Border.all(
                                  width: 1.w,
                                  color: AppColors.colorMediumGrayBorder,
                                ),
                              ),
                              child: Center(
                                child: Text(filterCubit.furnishedTypeList[index].tr(),
                                    style: TextStyles.font19DarkGreyRegular.copyWith(
                                        color:filterCubit.furnishedTypeList[index]==filterCubit.furnishedValue?AppColors.colorWhite:AppColors.colorMaster )),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: 15.w,
                          );
                        },
                        itemCount: filterCubit.furnishedTypeList.length),
                  ),
                ),
                Divider(
                  color: AppColors.colorMediumGrayText,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  Widget categoryList() {
    FilterCubit filterCubit=FilterCubit.get(context);
    if (filterCubit.categoryListModel.data !=null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 25.h,
        children: [
          SizedBox(
            height: 100.h,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      filterCubit. selectCategory(filterCubit.categoryListModel.data![index].id);
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
                          width:filterCubit.categoryListModel.data![index].id==filterCubit.categoryId?3.w: 1.w,
                          color:filterCubit.categoryListModel.data![index].id==filterCubit.categoryId?AppColors.colorMaster :AppColors.colorBorderMediumGray,
                        ),
                      ),
                      child: Column(
                        spacing: 8.h,
                        children: [
                          Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
                                child: Image.network(
                                  filterCubit.categoryListModel.data![index].categoryImage
                                      .toString(),
                                  fit: BoxFit.fill,
                                ),
                              )),
                          Text(filterCubit.categoryListModel.data![index].name.toString(),
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
                itemCount: filterCubit.categoryListModel.data!.length),
          )
        ],
      );
    }
    return SizedBox.shrink();
  }
  Widget showSelectSlider(
    context,
  ) {
    FilterCubit filterCubit = FilterCubit.get(context);
    return BlocBuilder<FilterCubit, FilterState>(
      builder: (context, state) {
        return Column(
          spacing: 20.h,
          children: [
            Row(
              spacing: 60.w,
              children: [
                Expanded(
                  child: AuthTextFormField(
                      controller: filterCubit.minController,
                      hintText: "No min".tr(),
                      readOnly: true,
                      suffixIcon: SizedBox.shrink(),
                      obscureText: false),
                ),
                Expanded(
                  child: AuthTextFormField(
                      controller: filterCubit.mixController,
                      hintText: "No max".tr(),
                      readOnly: true,
                      suffixIcon: SizedBox.shrink(),
                      obscureText: false),
                ),
              ],
            ),
            SliderTheme(
              data: SliderThemeData(
                rangeThumbShape: const RoundRangeSliderThumbShape(
                  enabledThumbRadius: 8,
                ),
                activeTrackColor: AppColors.colorMaster,
                inactiveTrackColor: Colors.grey[300],
                trackHeight: 2,
                thumbColor: AppColors.colorWhite,
                overlayColor: Colors.black.withOpacity(0.1),
                valueIndicatorColor: AppColors.colorMaster,
                activeTickMarkColor: AppColors.colorMaster,
                inactiveTickMarkColor: Colors.grey[300],
              ),
              child: RangeSlider(
                values: filterCubit.rangeValues,
                min: filterCubit.configurationPriceModel.minPrice??0.0,
                max:filterCubit.configurationPriceModel.maxPrice??100000,
                onChanged: (RangeValues values) {
                  filterCubit.selectRangeValues(values);
                },
              ),
            ),
          ],
        );
      },
    );
  }
  Widget showSelectAge(
    context,
  ) {
    FilterCubit filterCubit = FilterCubit.get(context);
    return BlocBuilder<FilterCubit, FilterState>(
      builder: (context, state) {
        return Column(
          spacing: 20.h,
          children: [
            Row(
              spacing: 60.w,
              children: [
                Expanded(
                  child: AuthTextFormField(
                      controller: filterCubit.minAgeController,
                      hintText: "No min".tr(),
                      readOnly: true,
                      suffixIcon: SizedBox.shrink(),
                      obscureText: false),
                ),
                Expanded(
                  child: AuthTextFormField(
                      controller: filterCubit.mixAgeController,
                      hintText: "No max".tr(),
                      readOnly: true,
                      suffixIcon: SizedBox.shrink(),
                      obscureText: false),
                ),
              ],
            ),
            SliderTheme(
              data: SliderThemeData(
                rangeThumbShape: const RoundRangeSliderThumbShape(
                  enabledThumbRadius: 8,
                ),
                activeTrackColor: AppColors.colorMaster,
                inactiveTrackColor: Colors.grey[300],
                trackHeight: 2,
                thumbColor: AppColors.colorWhite,
                overlayColor: Colors.black.withOpacity(0.1),
                valueIndicatorColor: AppColors.colorMaster,
                activeTickMarkColor: AppColors.colorMaster,
                inactiveTickMarkColor: Colors.grey[300],
              ),
              child: RangeSlider(
                values: filterCubit.rangeValuesAge,
                min: 0,
                max:50,
                onChanged: (RangeValues values) {
                  filterCubit.selectRangeAge(values);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

/*
import 'dart:async';
import 'package:bayt_finder/extensions/extension_util/context_extensions.dart';
import 'package:bayt_finder/extensions/extension_util/int_extensions.dart';
import 'package:bayt_finder/screens/filter/search_screen.dart';
import 'package:bayt_finder/screens/layout/layout_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../components/appbar/custom_appbar.dart';
import '../../extensions/app_button.dart';
import '../../extensions/app_text_field.dart';
import '../../extensions/colors.dart';
import '../../extensions/decorations.dart';
import '../../extensions/horizontal_list.dart';
import '../../extensions/loader_widget.dart';
import '../../extensions/price_widget.dart';
import '../../extensions/system_utils.dart';
import '../../extensions/text_styles.dart';
import '../../main.dart';
import '../../models/my_properties_model.dart';
import '../../models/place_address_model.dart';
import '../../models/property_details_model.dart';
import '../../models/property_type_model.dart';
import '../../nav.dart';
import '../../network/RestApis.dart';
import '../../utils/app_common.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/images.dart';
import '../google_map_screen.dart';
*/

/*
class FilterScreen extends StatefulWidget {
  final bool isSelect;

  FilterScreen({this.isSelect = false});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> with SingleTickerProviderStateMixin {
  TextEditingController mapLocation = TextEditingController();

  int selectPosted = 0;
  int propertyForId = 0;
  int page = 1;
  int? numPage;
  int? currentIndex = 0;

  bool isLastPage = false;
  bool select = false;
  bool isFilterList = false;

  num? latitude;
  num? longitude;

  List<PropertyTypeModel> list = [];
  List<PropertyDetail> filterProperty = [];
  List<PropertyTypeList> propertyForList = [];
  List<PropertyTypeList> propertyList = [];

  String? propertySince;

  getList() {
    propertyForList.add(PropertyTypeList(0, "anytime", false));
    propertyForList.add(PropertyTypeList(1, "lastWeek", false));
    propertyForList.add(PropertyTypeList(2, "yesterday", false));
  }

  getPropertyList() {
    propertyList.add(PropertyTypeList(0.toInt(), "forRent", false));
    propertyList.add(PropertyTypeList(1.toInt(), "forSell", false));
  }

  late RangeValues _values;
  RangeValues? _apiSendValues;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    getList();
    getPropertyList();
    _values = RangeValues(filterConfigurationMain.minPrice!.toDouble(), filterConfigurationMain.maxPrice!.toDouble());
    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  latLongFunction(num? filterLatitude, num? filterLongitude) {
    latitude = filterLatitude;
    longitude = filterLongitude;
  }

  address(String? finalMapAddress) {
    mapLocation.text = finalMapAddress.toString();
    setState(() {});
  }

  Future<void> filterData() async {
    if (_apiSendValues == null) {
      _apiSendValues = RangeValues(0, 0);
    }

    appStore.setLoading(true);
    Map req;
    req = {
      "posted_since": propertySince,
      "latitude": latitude,
      "longitude": longitude,
      "start_price": _apiSendValues!.start,
      "end_price": _apiSendValues!.end,
      "property_for": propertyForId.toString(),
    };

    await filterApi(req).then((value) {
      filterProperty.clear();
      Iterable it = value.property!;
      it.map((e) => filterProperty.add(e)).toList();
      appStore.setLoading(false);

      print("Request Is For Filter ==> " + req.toString());

      SearchScreen(
      */
/*  propertyId: propertyForId,
        propertySince: propertySince,
        budgetMaxPrice: _apiSendValues!.end,
        budgetMinPrice: _apiSendValues!.start,
        latitude: latitude,
        longitude: longitude,
        isFilter: true,
        mPropertyData: filterProperty,
        isBack: false,*/ /*
      ).launch(context);
      setState(() {});
    }).catchError((e) {
      print(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Filter".tr(),
        actions: [
          InkWell(
            onTap: () {
              navigateTo( SearchScreen());
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
                child: Center(child: SvgPicture.asset(AppImage.search2))),
          ),
        ],
        onBackButtonPressed: () {

          if (widget.isSelect == false) {
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LayoutScreen()), (route) => true);
          } else {
            propertyForList.clear();
            propertyList.clear();
            list.clear();
            mapLocation.clear();
            init();
            setState(() {});
            finish(context);
          }
        },
        showBack: true,
      ),

      bottomNavigationBar: AppButton(
        width: double.infinity,
        color: AppColors.colorMaster,
        textColor: Colors.white,
        text: "applyFilter",
        onTap: () {
          filterData();
          setState(() {});
        },
      ).paddingSymmetric(horizontal: 16, vertical: 24),
      body: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HorizontalList(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: propertyList.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: (double.infinity - 50) / 2,
                    margin: EdgeInsets.only(right: 8),
                    padding: EdgeInsets.all(12),
                    decoration: boxDecorationWithRoundedCorners(
                        borderRadius: radius(8),
                        backgroundColor: propertyList[index].select!
                            ? AppColors.colorMaster
                            : appStore.isDarkModeOn
                            ? cardDarkColor
                            : AppColors.colorMediumGrayTextForm),
                    child: Text(
                      propertyList[index].title!.toString(),
                      style: primaryTextStyle(color: propertyList[index].select! ? Colors.white : grayColor),
                    ).center(),
                  ).onTap(() {
                    setState(() {
                      for (int i = 0; i < propertyList.length; i++) {
                        propertyList[i].select = i == index;
                        propertyForId = propertyList[index].id!;
                      }
                    });
                  });
                }),
            20.height,
            Text("priceRange", style: boldTextStyle()),
            20.height,
            SliderTheme(
              data: SliderThemeData(showValueIndicator: ShowValueIndicator.always),
              child: RangeSlider(
                values: RangeValues(_values.start, _values.end),
                min: filterConfigurationMain.minPrice!.toDouble(),
                max: filterConfigurationMain.maxPrice!.toDouble(),
                onChanged: (RangeValues newValues) {
                  setState(() {
                    _values = RangeValues(newValues.start, newValues.end);
                    _apiSendValues = _values;
                  });
                },
                labels: RangeLabels(formatFilterNumberString(_values.start.toStringAsFixed(2).toDouble()), formatFilterNumberString(_values.end.toStringAsFixed(2).toDouble())),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PriceWidget(price: formatFilterNumberString(_values.start.toStringAsFixed(2).toDouble()), textStyle: primaryTextStyle(size: 14)),
                PriceWidget(price: formatFilterNumberString(_values.end.toStringAsFixed(2).toDouble()), textStyle: primaryTextStyle(size: 14))
              ],
            ),
            20.height,
            Text("postedSince", style: boldTextStyle()),
            10.height,
            HorizontalList(
                padding: EdgeInsets.zero,
                itemCount: propertyForList.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: (double.infinity - 63) / 3,
                    // width: double.infinity * 0.28,
                    margin: EdgeInsets.only(right: 8),
                    padding: EdgeInsets.all(12),
                    decoration: boxDecorationWithRoundedCorners(
                        borderRadius: radius(8),
                        backgroundColor: propertyForList[index].select!
                            ? AppColors.colorMaster
                            : appStore.isDarkModeOn
                            ? cardDarkColor
                            : AppColors.colorMediumGrayTextForm),
                    child: Text(
                      propertyForList[index].title!,
                      style: primaryTextStyle(color: propertyForList[index].select! ? Colors.white : grayColor),
                    ).center(),
                  ).onTap(() {
                    setState(() {
                      for (int i = 0; i < propertyForList.length; i++) {
                        propertyForList[i].select = i == index;
                        propertySince = propertyForList[index].title;
                      }
                    });
                  });
                }),
            20.height,
            Text("location", style: boldTextStyle()),
            10.height,
            if (mapLocation.text.isNotEmpty)
              AppTextField(
                maxLines: 3,
                readOnly: true,
                controller: mapLocation,
                textFieldType: TextFieldType.OTHER,
                keyboardType: TextInputType.streetAddress,
                decoration: defaultInputDecoration(
                  context,
                ),
              ).visible(mapLocation.text.isNotEmpty),
            20.height.visible(mapLocation.text.isNotEmpty),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: boxDecorationWithRoundedCorners(
                  borderRadius: radius(8.0),
                  backgroundColor: select
                      ? AppColors.colorMaster
                      : appStore.isDarkModeOn
                      ? cardDarkColor
                      : AppColors.colorMediumGrayTextForm),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.my_location_sharp, color: grayColor),
                  SizedBox(width: 10.w,),
                  Text("chooseLocation", style: primaryTextStyle(color: select ? Colors.white : grayColor)).center(),
                ],
              ),
            ).onTap(() async {
              PlaceAddressModel? res = await GoogleMapScreen(
                // isFromFilter: true,
                // onAddress: address,
                // onLatLong: latLongFunction,
              ).launch(context);
              if (res != null) {}
            })
          ],
        ).paddingSymmetric(horizontal: 16),
        Loader().center().visible(appStore.isLoading),
      ]),
    );
  }
}
*/
