import 'dart:async';
import 'package:bayt_finder/utils/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../extensions/decorations.dart';
import '../../extensions/extension_util/context_extensions.dart';
import '../../extensions/extension_util/string_extensions.dart';
import '../../extensions/extension_util/widget_extensions.dart';
import '../../extensions/price_widget.dart';
import '../../local_storage/shared_preferences_manager.dart';
import '../../utils/images.dart';
import '../search_screen.dart';
import '../../utils/app_common.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../../components/app_bar_components.dart';
import '../../extensions/app_button.dart';
import '../../extensions/app_text_field.dart';
import '../../extensions/colors.dart';
import '../../extensions/extension_util/int_extensions.dart';
import '../../extensions/horizontal_list.dart';
import '../../extensions/text_styles.dart';
import '../../main.dart';
import '../../models/dashBoard_response.dart';
import '../../models/my_properties_model.dart';
import '../../models/property_type_model.dart';
import '../../network/RestApis.dart';
import 'filter_cubit.dart';

class FilterScreen extends StatefulWidget {
  final bool isSelect;

  const FilterScreen({super.key, this.isSelect = false});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController mapLocation = TextEditingController();

  int selectPosted = 0;

  int page = 1;
  int? numPage;
  int? currentIndex = 0;

  bool isLastPage = false;
  bool select = false;
  bool isFilterList = false;

  num? latitude;
  num? longitude;

  List<PropertyTypeModel> list = [];
  List<Property> filterProperty = [];
  List<PropertyTypeList> propertyForList = [];

/*  List<PropertyTypeList> propertyList = [];*/

  String? propertySince;

  getList() {
    propertyForList.add(PropertyTypeList(0, "anytime", false));
    propertyForList.add(PropertyTypeList(1, "lastWeek", false));
    propertyForList.add(PropertyTypeList(2, "yesterday", false));
  }

/*
  getPropertyList() {
    propertyList.add(PropertyTypeList(0.toInt(), "Sell", false));
    propertyList.add(PropertyTypeList(1.toInt(), "Rent", false));
  }
*/

  late RangeValues _values;
  RangeValues? _apiSendValues;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    getList();
    _values =
        RangeValues(appStore.minPrice.toDouble(), appStore.maxPrice.toDouble());
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
    _apiSendValues ??= RangeValues(0, 0);

    appStore.setLoading(true);
    Map req;
    req = {
      "posted_since": propertySince,
      "latitude": latitude,
      "longitude": longitude,
      "start_price": _apiSendValues!.start,
      "end_price": _apiSendValues!.end,
      "property_for": FilterCubit.get(context).propertyForId.toString(),
    };

    await filterApi(req).then((value) {
      filterProperty.clear();
      Iterable it = value.property!;
      it.map((e) => filterProperty.add(e)).toList();
      appStore.setLoading(false);

      print("Request Is For Filter ==> $req");

      SearchScreen(
        propertyId: FilterCubit.get(context).propertyForId,
        propertySince: propertySince,
        budgetMaxPrice: _apiSendValues!.end,
        budgetMinPrice: _apiSendValues!.start,
        latitude: latitude,
        longitude: longitude,
        isFilter: true,
        mPropertyData: filterProperty,
        isBack: false,
      ).launch(context);

      setState(() {});
    }).catchError((e) {
      print(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    FilterCubit filterCubit = FilterCubit.get(context);
    return BlocConsumer<FilterCubit, FilterState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: appBarWidget("Filter".tr(),
              titleSpace: 0,
              context1: context,
              actions: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
                  child: InkWell(
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
                        child:
                            Center(child: SvgPicture.asset(AppImage.search2))),
                  ),
                ),
              ],
              showBack: true,
              backWidget: Icon(Icons.arrow_back_ios,
                  color: AppColors.colorBlack, size: 28.sp)),
          bottomNavigationBar: AppButton(
            width: context.width(),
            color: primaryColor,
            textColor: Colors.white,
            text: 'apply Filter',
            onTap: () {
              filterData();
              setState(() {});
            },
          ).paddingSymmetric(horizontal: 16, vertical: 24),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 50.w,
                children: [
                  Expanded(
                    child: InkWell(
                        onTap: () {
                          filterCubit.selectProperty(0);
                        },
                        child: Container(
                          height:50.h ,
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
                                filterCubit.propertyList[0].title.toString(),
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
                          height:50.h ,
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
                                filterCubit.propertyList[1].title.toString(),
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
                ],
              ),
              Text("priceRange", style: boldTextStyle()),
              HorizontalList(
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: filterCubit.propertyList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          filterCubit.selectProperty(index);
                        },
                        child: Container(
                          width: (context.width() - 50) / 2,
                          margin: EdgeInsets.only(right: 8),
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(radiusCircular(14.r)),
                              color: filterCubit.propertyList[index].select!
                                  ? AppColors.colorMaster
                                  : AppColors.colorMediumGrayBg,
                              border: Border.all(
                                color: filterCubit.propertyList[index].select!
                                    ? AppColors.colorMaster
                                    : AppColors.colorMediumGrayBorder,
                              )),
                          child: Text(
                              filterCubit.propertyList[index].title.toString(),
                              style: TextStyle(
                                fontSize: 19.sp,
                                fontWeight: FontManger.regular,
                                color: filterCubit.propertyList[index].select!
                                    ? AppColors.colorWhite
                                    : AppColors.colorMaster,
                              )).center(),
                        ));
                  }),
              20.height,
              Text("priceRange", style: boldTextStyle()),
              20.height,
              SliderTheme(
                data: SliderThemeData(
                    showValueIndicator: ShowValueIndicator.always),
                child: RangeSlider(
                  values: RangeValues(_values.start, _values.end),
                  min: SharedPreferencesManager.getStringAsync(MIN_PRICE).toDouble(),
                  max: SharedPreferencesManager.getStringAsync(MAX_PRICE).toDouble(),
                  onChanged: (RangeValues newValues) {
                    setState(() {
                      _values = RangeValues(newValues.start, newValues.end);
                      _apiSendValues = _values;
                    });
                  },
                  labels: RangeLabels(
                      formatFilterNumberString(
                          _values.start.toStringAsFixed(2).toDouble()),
                      formatFilterNumberString(
                          _values.end.toStringAsFixed(2).toDouble())),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PriceWidget(
                      price: formatFilterNumberString(
                          _values.start.toStringAsFixed(2).toDouble()),
                      textStyle: primaryTextStyle(size: 14)),
                  PriceWidget(
                      price: formatFilterNumberString(
                          _values.end.toStringAsFixed(2).toDouble()),
                      textStyle: primaryTextStyle(size: 14))
                ],
              ),
              20.height,
              Text('postedSince', style: boldTextStyle()),
              10.height,
              HorizontalList(
                  padding: EdgeInsets.zero,
                  itemCount: propertyForList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: (context.width() - 63) / 3,
                      // width: context.width() * 0.28,
                      margin: EdgeInsets.only(right: 8),
                      padding: EdgeInsets.all(12),
                      decoration: boxDecorationWithRoundedCorners(
                          borderRadius: radius(8),
                          backgroundColor: propertyForList[index].select!
                              ? primaryColor
                              : appStore.isDarkModeOn
                                  ? cardDarkColor
                                  : primaryExtraLight),
                      child: Text(
                        propertyForList[index].title.validate(),
                        style: primaryTextStyle(
                            color: propertyForList[index].select!
                                ? Colors.white
                                : grayColor),
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
              Text("'location'", style: boldTextStyle()),
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
                        ? primaryColor
                        : appStore.isDarkModeOn
                            ? cardDarkColor
                            : primaryExtraLight),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.my_location_sharp, color: grayColor),
                    10.width,
                    Text("chooseLocation",
                            style: primaryTextStyle(
                                color: select ? Colors.white : grayColor))
                        .center(),
                  ],
                ),
              ).onTap(() async {
                /*      PlaceAddressModel? res = await GoogleMapScreen(
              isFromFilter: true,
              onAddress: address,
              onLatLong: latLongFunction,
            ).launch(context);
            if (res != null) {}*/
              })
            ],
          ).paddingSymmetric(horizontal: 16),
        );
      },
    );
  }
}
