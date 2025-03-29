import 'package:bayt_finder/components/appbar/custom_appbar.dart';
import 'package:bayt_finder/components/buttons/master_button.dart';
import 'package:bayt_finder/screens/my_property/cubit/my_property_cubit.dart';
import 'package:bayt_finder/screens/property/cubit/property_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';
import '../../extensions/loader_widget.dart';
import '../../local_storage/shared_preferences_manager.dart';
import '../../nav.dart';
import '../../utils/decorations.dart';
import '../my_property/add_Property_screen.dart';
import '../../utils/alert_two_buttons.dart';
import '../../utils/styles.dart';
import '../favourite/cubit/favourite_cubit.dart';
import '../image_view/photo_gallery_screen.dart';
import '../../extensions/decorations.dart';
import '../../extensions/text_styles.dart';
import '../../main.dart';
import '../../utils/app_common.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/images.dart';
import 'amenity_screen.dart';

class PropertyDetailScreen extends StatefulWidget {
  final int? propertyId;

  const PropertyDetailScreen({
    super.key,
    required this.propertyId,
  });

  @override
  State<PropertyDetailScreen> createState() => _PropertyDetailScreenState();
}

class _PropertyDetailScreenState extends State<PropertyDetailScreen> {
  @override
  Widget build(BuildContext context) {
    PropertyCubit propertyCubit = PropertyCubit.get(context);
    if (propertyCubit.currentMarker == null) {
      propertyCubit.convertMarkerImage();
    }
    int userId = SharedPreferencesManager.getIntAsync(
      AppConstants.userId,
    );
    propertyCubit.propertyDetail(id: widget.propertyId!);
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        return Future.value(true);
      },
      child: BlocConsumer<PropertyCubit, PropertyState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: CustomAppBar(
              title: propertyCubit.title.tr(),
              showBack: true,
              /*       actions: [
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
                  child: Center(
                      child: SvgPicture.asset(AppImage.search2))),
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
            ),

          ],*/
            ),
/*
        Loader().center().visible(appStore.isLoading)
*/
            body: propertyCubit.propertyDetailsModel.data != null
                ? SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 40),
              child: Column(
                children: [
                  Stack(
                    children: [
                      ColorFiltered(
                        colorFilter: ColorFilter.mode(
                            Color.fromRGBO(0, 0, 0, 0.25),
                            BlendMode.multiply),
                        child: cachedImage(
                            propertyCubit
                                .propertyDetailsModel.data!.propertyImage,
                            fit: BoxFit.fill,
                            height: 250.h,
                            radius: 0.0,
                            width: double.infinity),
                      ),
                      PositionedDirectional(
                        top: 20.h,
                        start: 16.w,
                        end: 16.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          spacing: 10.w,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 5.h),
                              decoration: AppBoxDecoration
                                  .decorationMasterRadius10,
                              child: Text(
                                  propertyCubit.propertyDetailsModel.data!
                                      .propertyFor ==
                                      0
                                      ? 'Rent'.tr()
                                      : propertyCubit.propertyDetailsModel
                                      .data!.propertyFor ==
                                      1
                                      ? 'Sell'.tr()
                                      : "PG/Co-living".tr(),
                                  style: TextStyles.font16WhiteRegular),
                            ),
                            Spacer(),
                            /* InkWell(
                                onTap: () {
                                  Share.share(
                                      propertyCubit
                                          .propertyDetailsModel.data!.name
                                          !,
                                      subject: propertyCubit
                                          .propertyDetailsModel.data!.name
                                          !);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(4.sp),
                                  decoration: BoxDecoration(
                                      color: AppColors.colorMediumMaster,
                                      shape: BoxShape.circle),
                                  child: Icon(Icons.share_outlined,
                                      size: 20.sp,
                                      color: AppColors.colorWhite),
                                )),*/
                            BlocConsumer<FavouriteCubit, FavouriteState>(
                              listener: (context, state) {
                                // TODO: implement listener
                              },
                              builder: (context, state) {
                                return InkWell(
                                    onTap: () {
                                      if (isLogin) {
                                        FavouriteCubit.get(context)
                                            .setFavouriteProperty(
                                            propertyId: propertyCubit
                                                .propertyDetailsModel
                                                .data!
                                                .id
                                                .toString())
                                            .then(
                                              (value) {
                                            if (value) {
                                              if (propertyCubit
                                                  .propertyDetailsModel
                                                  .data!
                                                  .isFavourite ==
                                                  0) {
                                                propertyCubit
                                                    .propertyDetailsModel
                                                    .data!
                                                    .isFavourite = 1;
                                              } else {
                                                propertyCubit
                                                    .propertyDetailsModel
                                                    .data!
                                                    .isFavourite = 0;
                                              }
                                            }
                                          },
                                        );
                                      } else {
                                        showDialog(
                                          context: context,
                                          builder:
                                              (BuildContext context) {
                                            return TwoButtonAlert();
                                          },
                                        );
                                      }
                                    },
                                    child: fevIconWidget(
                                      propertyCubit.propertyDetailsModel
                                          .data!.isFavourite,
                                      context,
                                    ));
                              },
                            )
                          ],
                        ),
                      ),
                      PositionedDirectional(
                        bottom: 12.h,
                        start: 10.w,
                        end: 10.w,
                        child: Row(
                          spacing: 8.w,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            /*  PremiumBtn(pDetail: false).visible(
                              appStore.subscription == "1" &&
                                  propertyCubit.propertyDetailsModel.data!.premiumProperty == 1),*/
                            Container(
                              width: 4.w,
                              height: 73.h,
                              decoration: BoxDecoration(
                                  color: AppColors.colorWhite,
                                  shape: BoxShape.rectangle),
                            ),
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Start Price'.tr(),
                                  style: TextStyles.font16WhiteRegular,
                                ),
                                Text(
                                  propertyCubit.propertyDetailsModel.data!
                                      .priceFormat
                                      .toString(),
                                  style: TextStyles.font20BlackMedium
                                      .copyWith(
                                      color: AppColors.colorWhite),
                                ),
                                Text(
                                  "${"Max price".tr()}${propertyCubit
                                      .propertyDetailsModel.data!.priceFormat
                                      .toString()}",
                                  style: TextStyles.font16WhiteRegular,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // 8.height,
                  Padding(
                    padding: EdgeInsets.only(
                        left: 15.w, right: 15.w, top: 10.h),
                    child: Column(
                      spacing: 15.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        photoGalleryWidget(propertyCubit),
                        Text(
                          propertyCubit
                              .propertyDetailsModel.data!.category
                              .toString(),
                          style: TextStyles.font20BlackMedium,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 34.w, vertical: 6.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(
                                  color: AppColors
                                      .colorMediumGrayBorderTextForm)),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                spacing: 3.h,
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        AppImage.ionBed,
                                        width: 20.w,
                                        height: 20.h,
                                      ),
                                      SvgPicture.asset(
                                        AppImage.cbiBathroom,
                                        width: 20.w,
                                        height: 20.h,
                                      ),
                                    ],
                                  ),
                                  Text(
                                      "${propertyCubit.propertyDetailsModel
                                          .data!.bhk.toString()} ${"BHK".tr()}",
                                      style: TextStyles
                                          .font16MediumGrayTextMedium),
                                ],
                              ),
                              /*     Column(
                                      spacing: 3.h,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                            'Furnished Type',
                                            style: TextStyles
                                                .font16MediumGrayTextMedium),
                                        Text(
                                            propertyCubit.propertyDetailsModel.data!.furnishedType==0?"unfurnished":propertyCubit.propertyDetailsModel.data!.furnishedType==1?'fully':"semi" ,
                                            style: TextStyles
                                                .font16MediumGrayTextMedium),
                                      ],
                                    ),*/
                              Container(
                                width: 2.w,
                                height: 45.h,
                                color: AppColors
                                    .colorMediumGrayBorderTextForm,
                              ),
                              Row(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                spacing: 5.h,
                                children: [
                                  Text(
                                      "${propertyCubit.propertyDetailsModel
                                          .data!.sqft.toString()} M",
                                      style:
                                      TextStyles.font24BlackMedium),
                                  SvgPicture.asset(
                                    AppImage.bxArea,
                                    color: AppColors.black,
                                    width: 20.w,
                                    height: 20.h,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "Property details".tr(),
                          style: TextStyles.font20BlackMedium,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                      "${"Furnished Type:".tr()} ${propertyCubit.propertyDetailsModel
                                          .data!.furnishedType==0? 'unfurnished'.tr():propertyCubit.propertyDetailsModel
                                          .data!.sallerType==1?'fully'.tr():'semi'.tr()} ",
                                      style: TextStyles
                                          .font16MediumGrayTextMedium),
                                  Text(
                                      "${"Age of Property:".tr()} ${propertyCubit.propertyDetailsModel
                                          .data!.ageOfProperty.toString()} ",
                                      style: TextStyles
                                          .font16MediumGrayTextMedium),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,

                                children: [
                                  Text(
                                      "${"Seller Type:".tr()} ${propertyCubit.propertyDetailsModel
                                          .data!.sallerType==0?'owner'.tr():propertyCubit.propertyDetailsModel
                                          .data!.sallerType==1?'broker'.tr():'builder'.tr()} ",
                                      style: TextStyles
                                          .font16MediumGrayTextMedium),
                                  Text(
                                      "${"Maintenance Charges:".tr()} ${propertyCubit.propertyDetailsModel
                                          .data!.maintenance.toString()} ",
                                      style: TextStyles
                                          .font16MediumGrayTextMedium),
                                ],
                              ),
                            )
                          ],
                        ),
                        Text(
                          "Overview".tr(),
                          style: TextStyles.font20BlackMedium,
                        ),

                        Text(
                          propertyCubit
                              .propertyDetailsModel.data!.description
                              .toString(),
                          style: TextStyles.fontPrivacyPolicy,
                        ),
                        if (propertyCubit.propertyDetailsModel
                            .propertyAmenityValue!.isNotEmpty)
                          AmenityScreen(
                              amenityValue: propertyCubit
                                  .propertyDetailsModel
                                  .propertyAmenityValue!),
                        Divider(
                            thickness: 1,
                            color: AppColors.colorMediumGrayText,
                            indent: 16,
                            endIndent: 16),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(AppImage.mapPoint,
                                height: 20, width: 20),
                            SizedBox(width: 5.h,),
                            Expanded(
                              child: Text(
                                  propertyCubit.propertyDetailsModel
                                      .data!.address
                                      .toString(),
                                  style: secondaryTextStyle(size: 14),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis),
                            )
                          ],
                        ),
/*
                              if (propertyCubit
                                      .propertyDetailsModel.customer!.id !=
                                  SharedPreferencesManager.getIntAsync(
                                      "USER_ID"))
                              if (propertyCubit
                                      .propertyDetailsModel.customer!.id !=
                                  SharedPreferencesManager.getIntAsync(
                                      "USER_ID"))
                                contactWidget(propertyCubit),*/
                        mapWidget(propertyCubit),
                      ],
                    ),
                  ),
                ],
              ),
            )
                : state is PropertyDetailLoadingState
                ? Center(child: Loader())
                : SizedBox.shrink(),
            bottomNavigationBar: propertyCubit.propertyDetailsModel.data != null
                ? userId == propertyCubit.propertyDetailsModel.customer!.id
                ? BlocConsumer<MyPropertyCubit, MyPropertyState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                MyPropertyCubit myPropertyCubit =
                MyPropertyCubit.get(context);
                return Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 16, vertical: 12),
                  decoration: boxDecorationWithRoundedCorners(
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Expanded(
                        child: MasterButton(
                          text: 'delete'.tr(),
                          svgPath: AppImage.delete,
                          backgroundColor: AppColors.colorTransparent,
                          textColor: AppColors.colorError,
                          typeButton: TypeButton.svgText,
                          borderColor: AppColors.colorError,
                          isLoading:
                          state is PropertyDeleteLoadingState,
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return TwoButtonAlert(
                                  title:
                                  "You are one step away from Deleted Property. Do you really want to Deleted?"
                                      .tr(),
                                  onTap: () async {
                                    navigateBack(context);
                                    await myPropertyCubit
                                        .propertyDelete(id: 1)
                                        .then(
                                          (value) {
                                        if (value) {
                                          myPropertyCubit
                                              .getMyProperty();
                                          navigateBack(context);
                                        }
                                      },
                                    );
                                  },
                                  textButtonConfirm: "Deleted".tr(),
                                );
                              },
                            );
                          },
                          /*              padding: EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 14),
                                    decoration: boxDecorationWithRoundedCorners(
                                        backgroundColor: AppColors.colorMaster,
                                        borderRadius: BorderRadius.circular(12)),*/
                          /*    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset(ic_delete_ac,
                                            height: 24,
                                            width: 24,
                                            color: Colors.white),
                                        SizedBox(width: 20.h,),
                                        Text("delete",
                                            style: primaryTextStyle(
                                                color: Colors.white)),
                                      ],
                                    ),*/
                        ),
                      ),

                      SizedBox(width: 8.h,),
                      Expanded(
                        child: MasterButton(
                          text: 'Edit'.tr(),
                          svgPath: AppImage.edit,
                          typeButton: TypeButton.svgText,
                          onPressed: () {
                            MyPropertyCubit.get(context)
                                .getCategory();
                            navigateTo(
                                AddPropertyScreen(
                                    updateProperty: true,
                                    idProperty: propertyCubit
                                        .propertyDetailsModel
                                        .data!
                                        .id!));
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            )
                : Container(
              padding:
              EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: boxDecorationWithRoundedCorners(
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        commonLaunchUrl(
                            'tel:${propertyCubit.propertyDetailsModel.customer!
                                .contactNumber}');
                        /* bool res = (await AddPropertyScreen(
                              updateProperty: true,
                              pId: widget.propertyId,
                              propertyFor: propertyCubit.propertyDetailsModel.data!.propertyFor,
                              updatePropertyData: propertyCubit.propertyDetailsModel
                          .launch(context)) as bool;
                      if (res) {
                      }*/

                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16, vertical: 14),
                        decoration: boxDecorationWithRoundedCorners(
                            backgroundColor: AppColors.colorBGSheet,
                            borderRadius: BorderRadius.circular(12.r)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AppImage.call,
                                height: 24.h, width: 24.w),

                            SizedBox(width: 20.h,),
                            Text("Call Us".tr(),
                                style: primaryTextStyle(
                                    color: Colors.black)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.h,),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        commonLaunchUrl(
                            'whatsapp://send?phone=:${propertyCubit
                                .propertyDetailsModel.customer!
                                .contactNumber}');
                        /*  showConfirmDialogCustom(
                              bgColor: limitColor.withOpacity(0.10),
                              iconColor: limitColor,
                              positiveBg: Colors.red,
                              image: ic_delete_ac,
                              context,
                              AppColors.colorMaster: AppColors.colorMaster,
                              positiveTextColor: Colors.white,
                              negativeBg: primaryLight,
                              negativeTextColor: AppColors.colorMaster,
                              title: "deletePropertyMsg",
                              positiveText: "delete",
                              height: 100,
                              onAccept: (c) async {
                                await deletePropertyApi(widget.propertyId);
                                setState(() {});
                              },
                            );
                    */
                        setState(() {});
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16, vertical: 14),
                        decoration: boxDecorationWithRoundedCorners(
                            backgroundColor: AppColors.colorGreen,
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AppImage.whatsapp,
                              height: 24,
                              width: 24,
                            ),
                            SizedBox(width: 20.h,),
                            Text("Whatsapp".tr(),
                                style: primaryTextStyle(
                                    color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
                : SizedBox.shrink(),
          );
        },
      ),
    );
  }

  //region Cost of living

//endregion

//region Map View
  Widget mapWidget(PropertyCubit propertyCubit) {
    return Column(
      children: [
        if (propertyCubit.propertyDetailsModel.data!.latitude != null &&
            propertyCubit.propertyDetailsModel.data!.longitude != null)
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              InkWell(
                onTap: () async {
                  await MapsLauncher.launchCoordinates(
                      double.parse(propertyCubit.propertyDetailsModel.data!
                          .latitude.toString()),
                      double.parse(propertyCubit.propertyDetailsModel.data!
                          .longitude.toString()));
                },
                child: SizedBox(
                  height: 180.h, // Adjust height as needed
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: GoogleMap(
                      scrollGesturesEnabled: false,
                      compassEnabled: false,
                      zoomControlsEnabled: false,
                      mapType: MapType.hybrid,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(
                          double.parse(propertyCubit.propertyDetailsModel.data!
                              .latitude.toString()), double.parse(propertyCubit
                            .propertyDetailsModel.data!.longitude.toString()),),
                        zoom: 12.0,
                      ),
                      markers: <Marker>{
                        Marker(
                          markerId: MarkerId('pinpoint'),
                          position: LatLng(
                              double.parse(propertyCubit.propertyDetailsModel
                                  .data!.latitude.toString()),
                              double.parse(propertyCubit.propertyDetailsModel
                                  .data!.longitude.toString())),
                          icon: BitmapDescriptor.defaultMarker,
                        ),
                      },
                    ),
                  ),
                ),
              ),
              /*       AppButton(
              enableScaleAnimation: false,
              width: double.infinity,
              textStyle: boldTextStyle(size: 14),
              text: "viewOnMap",
              color: AppColors.colorMediumGrayTextForm,
              elevation: 0,
              onTap: () async {
                await MapsLauncher.launchCoordinates(
                    propertyCubit.propertyDetailsModel.data!.latitude!
                        .toDouble(),
                    propertyCubit.propertyDetailsModel.data!.longitude!
                        .toDouble());
                setState(() {});
              },
            ).paddingSymmetric(horizontal: 16),*/
            ],
            // child:
          ),
      ],
    );
  }

//endregion

//region Photo Gallery
  Widget photoGalleryWidget(PropertyCubit propertyCubit) {
    return SizedBox(
     height: 60.h,
      child: InkWell(
        onTap: () {
          navigateTo( PhotoGalleyScreen(
              mPropertyDetail: propertyCubit.propertyDetailsModel.data));
        },
        child: ListView.separated(
          scrollDirection: Axis.horizontal,

          itemBuilder: (context, index) {
          return cachedImage(
            propertyCubit.propertyDetailsModel.data!.propertyGallary![index],
            fit: BoxFit.cover,
            height: 55.h,
            width: 70.w,
          );
        },
            separatorBuilder: (context, index) {
              return SizedBox(width: 3.w,);
            },
            itemCount:
            propertyCubit.propertyDetailsModel.data!.propertyGallary!.length,)),
    );
  }

// endregion

//region Description
  Widget descriptionWidget(PropertyCubit propertyCubit) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if( propertyCubit.propertyDetailsModel.data!.description != null)Text(
            "description".tr(), style: boldTextStyle(size: 18)),
        SizedBox(height: 8.h,),

        if( propertyCubit.propertyDetailsModel.data!.description != null) Text(
            propertyCubit.propertyDetailsModel.data!.description!
            ,
            style: secondaryTextStyle(size: 16))
        ,
      ],
    );
  }

//endregion

//region Contact

//endregion

//region horizontal


// region nearby google
/*
  Widget nearByGoogle(PropertyCubit propertyCubit) {
    return propertyCubit.propertyDetailsModel.nearByPlace != null
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Nearest By Google", style: boldTextStyle(size: 18))
                  .paddingSymmetric(horizontal: 16)
                  .visible(propertyCubit
                      .propertyDetailsModel.data!.propertyGallary!.isNotEmpty),
              8.height,
              HorizontalList(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: propertyCubit
                      .propertyDetailsModel.nearByPlace!.results!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () async {
                        await MapsLauncher.launchCoordinates(
                            propertyCubit.propertyDetailsModel.nearByPlace!
                                .results![index].geometry!.location!.lat!
                                .toDouble(),
                            propertyCubit.propertyDetailsModel.nearByPlace!
                                .results![index].geometry!.location!.lng!
                                .toDouble());
                      },
                      child: Container(
                        decoration: boxDecorationRoundedWithShadow(
                          12,
                          backgroundColor: AppColors.colorMediumGrayTextForm,
                        ),
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            propertyCubit.propertyDetailsModel.nearByPlace!
                                            .results![index].photos !=
                                        null &&
                                    propertyCubit
                                        .propertyDetailsModel
                                        .nearByPlace!
                                        .results![index]
                                        .photos!
                                        .isNotEmpty
                       //     '"https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=AUy1YQ33QwckuPqTj203YfQSL513-LgpJnw5FAPrIdpAc8I8v_m8vDZ134tH3GCWRjzeLswlGvTwnps733oTaTJAta3OUYSWKmvfbrpzD3DMWG0EMZ3JL_ksYq38bVy-Xjzy82jZDlcE7IKsw6JVRgCMhfvCEARnIKgBDlXnwK4aXTcND3iEywmkMum3G0jXuyluDXMPBv4NfjGOb4YfsYtYVa-fpWEMkRHI1mQtWveX9brQjz3kQn9VrBQAZLAxFS9k-MigOVdTxWwqpoi98PtpuYjTLRbmv-xKrTxCGYS1USu5R9nk81XxUlt3jAegDscLAnxkABoM9jY&key=AIzaSyC4gTSwhUFShnUEBpmB3UPDuPJEB8N0ru4"'
                                ? Image.network(
                                    'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=${propertyCubit.propertyDetailsModel.nearByPlace!.results![index].photos![0].photoReference}&key=AIzaSyC4gTSwhUFShnUEBpmB3UPDuPJEB8N0ru4',
                                    fit: BoxFit.cover,
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    height: 140,
                                  ).cornerRadiusWithClipRRectOnly(
                                    topRight: 12,
                                    topLeft: 12,
                                  )
                                : Image.asset(
                                    ic_not_available,
                                    fit: BoxFit.cover,
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    height: 140,
                                  ).cornerRadiusWithClipRRectOnly(
                                    topRight: 12,
                                    topLeft: 12,
                                  ),
                            SizedBox(height: 4.w,),
                            Text(
                              propertyCubit.propertyDetailsModel.nearByPlace!
                                  .results![index].name
                                  .toString()
                                  .capitalizeFirstLetter(),
                              style: boldTextStyle(size: 18),
                            ).paddingSymmetric(horizontal: 12),
                            SizedBox(height: 4.w,),
                            Text(
                              propertyCubit.propertyDetailsModel.nearByPlace!
                                  .results![index].vicinity
                                  .toString(),
                              style: primaryTextStyle(size: 12),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ).paddingSymmetric(horizontal: 14),
                            SizedBox(height: 4.w,),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '${propertyCubit.propertyDetailsModel.nearByPlace!.results![index].rating ?? 0.0}/5',
                                  style: primaryTextStyle(size: 14),
                                ),
                                SizedBox(width: 4.w,),
                                RatingBar.builder(
                                  initialRating: (propertyCubit
                                              .propertyDetailsModel
                                              .nearByPlace!
                                              .results![index]
                                              .rating ??
                                          0)
                                      .toDouble(),
                                  minRating: 0,
                                  ignoreGestures: true,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 15,
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (double value) {},
                                ),
                              ],
                            ).paddingSymmetric(horizontal: 14),
                            4.height
                          ],
                        ),
                      ),
                    );
                  })
            ],
          )
        : SizedBox();
  }
*/

//endregion
}
