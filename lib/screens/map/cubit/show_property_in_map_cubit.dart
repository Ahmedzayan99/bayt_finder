import 'dart:math';

import 'package:bayt_finder/appcontext.dart';
import 'package:bayt_finder/models/map_property_model.dart';
import 'package:bayt_finder/network/dio_maneger.dart';
import 'package:bayt_finder/utils/custom_bottom_sheet.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

import '../../../components/buttons/master_button.dart';
import '../../../extensions/common.dart';
import '../../../extensions/decorations.dart';
import '../../../extensions/loader_widget.dart';
import '../../../extensions/text_styles.dart';
import '../../../main.dart';
import '../../../models/property_details_model.dart';
import '../../../nav.dart';
import '../../../utils/alert_two_buttons.dart';
import '../../../utils/app_common.dart';
import '../../../utils/colors.dart';
import '../../../utils/decorations.dart';
import '../../../utils/images.dart';
import '../../../utils/styles.dart';
import '../../image_view/photo_gallery_screen.dart';
import '../../my_property/add_Property_screen.dart';
import '../../my_property/cubit/my_property_cubit.dart';
import '../../property/amenity_screen.dart';

part 'show_property_in_map_state.dart';

class ShowPropertyInMapCubit extends Cubit<ShowPropertyInMapState> {
  ShowPropertyInMapCubit() : super(ShowPropertyInMapInitial());

  static ShowPropertyInMapCubit get(context) => BlocProvider.of(context);
  DioManager dioManager = DioManager();
  GoogleMapController? googleMapController;
  LatLng? currentLocation;
  BitmapDescriptor? currentMarker;
  Map<MarkerId, Marker> markers = {};
  MapType mapType = MapType.hybrid;

  void chengeMapType() {
    if (mapType == MapType.hybrid) {
      mapType = MapType.normal;
    } else {
      mapType = MapType.hybrid;
    }
    emit(ChengeMapType());
  }

  Future<bool> convertMarkerImage() async {
    currentMarker = await BitmapDescriptor.asset(
        const ImageConfiguration(size: Size(30.0, 50.0)),
        "assets/image/icon_hoase_map.png");
    if (currentMarker != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition();
    currentLocation = LatLng(position.latitude, position.longitude);
    emit(CurrentLocation());
    propertyMap(latitude: position.latitude, longitude: position.longitude);
  }

  void onMapCreated(GoogleMapController controller) async {
    googleMapController = controller;
    convertMarkerImage();
    await goToCurrentLocation();
  }

  Future<void> goToCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition();
    googleMapController!.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 18,
      ),
    ));
  }

  Future<void> zoomOut() async {
    googleMapController!.animateCamera(CameraUpdate.zoomOut());
  }

  Future<void> zoomIn() async {
    googleMapController!.animateCamera(CameraUpdate.zoomIn());
  }

  Future<void> addMarker(LatLng latLng, int id, BitmapDescriptor icon) async {
    MarkerId markerId = MarkerId(id.toString());
    Marker marker = Marker(
      markerId: markerId,
      position: latLng,
      draggable: false,
      icon: icon,
      onTap: () {
        propertyDetail(id: id);
        NewCustomBottomSheet.showModalBottomCustom(
          AppContext.context,
          child: BlocBuilder<ShowPropertyInMapCubit, ShowPropertyInMapState>(
            builder: (context, state) {
              return Container(
                padding: EdgeInsets.all(
                  10.h,
                ),
                decoration: AppBoxDecoration.decorationWhiteRadius20,
                child: propertyDetailsModel.data != null
                    ? Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 10.h,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.keyboard_arrow_up_outlined,
                                size: 24.sp,
                              ),
                            ],
                          ),
                          Divider(
                            color: AppColors.colorMediumGrayText,
                          ),
                          ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.r)),
                            child: cachedImage(
                                propertyDetailsModel.data!.propertyImage,
                                height: 177.h,
                                width: double.infinity,
                                fit: BoxFit.fill),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.w),
                            child: Column(
                              spacing: 10.h,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(propertyDetailsModel.data!.name.toString(),
                                    style:
                                        TextStyles.font16MediumGrayTextMedium),
                                Text(
                                    propertyDetailsModel.data!.priceFormat
                                        .toString(),
                                    style: TextStyles.font20BlackMedium
                                        .copyWith(color: AppColors.colorPrice)),
                                Row(
                                  spacing: 4.w,
                                  children: [
                                    SvgPicture.asset(
                                      AppImage.bedroom,
                                      width: 16.w,
                                      height: 16.h,
                                      colorFilter: ColorFilter.mode(
                                          AppColors.colorBlack,
                                          BlendMode.srcIn),
                                    ),
                                    SvgPicture.asset(
                                      AppImage.cbiBathroom,
                                      width: 16.w,
                                      height: 16.h,
                                      colorFilter: ColorFilter.mode(
                                          AppColors.colorBlack,
                                          BlendMode.srcIn),
                                    ),
                                    Text(
                                      propertyDetailsModel.data!.bhk.toString(),
                                      style:
                                          TextStyles.font16MediumGrayTextMedium,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SvgPicture.asset(
                                      AppImage.bxArea,
                                      width: 16.w,
                                      height: 16.h,
                                      colorFilter: ColorFilter.mode(
                                          AppColors.colorBlack,
                                          BlendMode.srcIn),
                                    ),
                                    Text(
                                      "${propertyDetailsModel.data!.sqft.toString()} ${"M".tr()}",
                                      style:
                                          TextStyles.font16MediumGrayTextMedium,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: 4.w,
                                  children: [
                                    Icon(Icons.location_on_outlined),
                                    Expanded(
                                      child: Text(
                                        propertyDetailsModel.data!.address
                                            .toString(),
                                        maxLines: 2,
                                        style: TextStyles
                                            .font16MediumGrayTextMedium,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )
                                  ],
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
                                              "${"Furnished Type:".tr()} ${propertyDetailsModel
                                                  .data!.furnishedType==0? 'unfurnished'.tr():propertyDetailsModel
                                                  .data!.sallerType==1?'fully'.tr():'semi'.tr()} ",
                                              style: TextStyles
                                                  .font16MediumGrayTextMedium),
                                          Text(
                                              "${"Age of Property:".tr()} ${propertyDetailsModel
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
                                              "${"Seller Type:".tr()} ${propertyDetailsModel
                                                  .data!.sallerType==0?'owner'.tr():propertyDetailsModel
                                                  .data!.sallerType==1?'broker'.tr():'builder'.tr()} ",
                                              style: TextStyles
                                                  .font16MediumGrayTextMedium),
                                          Text(
                                              "${"Maintenance Charges:".tr()} ${propertyDetailsModel
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

                                      propertyDetailsModel.data!.description
                                      .toString(),
                                  style: TextStyles.fontPrivacyPolicy,
                                ),
                                Text(
                                  "Overview".tr(),
                                  style: TextStyles.font20BlackMedium,
                                ),
                                Text(
                                  propertyDetailsModel.data!.description
                                      .toString(),
                                  style: TextStyles.fontPrivacyPolicy,
                                ),
                  SizedBox(
                    height: 60.h,
                    child: InkWell(
                        onTap: () {
                          navigateTo(PhotoGalleyScreen(
                              mPropertyDetail: propertyDetailsModel.data));
                        },
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              child: cachedImage(
                                propertyDetailsModel.data!.propertyGallary![index],
                                fit: BoxFit.cover,
                                height: 55.h,
                                width: 70.w,
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: 3.w,
                            );
                          },
                          itemCount:propertyDetailsModel.data!.propertyGallary!.length,
                        )),
                  ),
                                if (propertyDetailsModel
                                    .propertyAmenityValue!.isNotEmpty)
                                  AmenityScreen(
                                      amenityValue: propertyDetailsModel
                                          .propertyAmenityValue!),
                                userId != propertyDetailsModel.customer!.id
                                    ? Container(
                                        decoration:
                                            boxDecorationWithRoundedCorners(
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: InkWell(
                                                onTap: () async {
                                                  commonLaunchUrl(
                                                      'tel:${propertyDetailsModel.customer!.contactNumber}');
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 16,
                                                      vertical: 14),
                                                  decoration:
                                                      boxDecorationWithRoundedCorners(
                                                          backgroundColor:
                                                              AppColors
                                                                  .colorBGSheet,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.r)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SvgPicture.asset(
                                                          AppImage.call,
                                                          height: 24.h,
                                                          width: 24.w),
                                                      SizedBox(
                                                        width: 20.h,
                                                      ),
                                                      Text("Call Us".tr(),
                                                          style:
                                                              primaryTextStyle(
                                                                  color: Colors
                                                                      .black)),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 8.h,
                                            ),
                                            Expanded(
                                              child: InkWell(
                                                onTap: () {
                                                  commonLaunchUrl(
                                                      'whatsapp://send?phone=:${propertyDetailsModel.customer!.contactNumber}');
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
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 16,
                                                      vertical: 14),
                                                  decoration:
                                                      boxDecorationWithRoundedCorners(
                                                          backgroundColor:
                                                              AppColors
                                                                  .colorGreen,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SvgPicture.asset(
                                                        AppImage.whatsapp,
                                                        height: 24,
                                                        width: 24,
                                                      ),
                                                      SizedBox(
                                                        width: 20.h,
                                                      ),
                                                      Text("Whatsapp".tr(),
                                                          style:
                                                              primaryTextStyle(
                                                                  color: Colors
                                                                      .white)),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : SizedBox.shrink(),
                              ],
                            ),
                          ),
                        ],
                      )
                    : Container(
                        height: 400.h,
                        child: Center(
                          child: Loader(),
                        ),
                      ),
              );
            },
          ),
        );
      },
    );
    markers[markerId] = marker;
    // emit(AddMarker());
  }

  PropertyDetailsModel propertyDetailsModel = PropertyDetailsModel();

  Future<void> propertyDetail({
    required int id,
  }) async {
    propertyDetailsModel = PropertyDetailsModel();
    emit(PropertyDetailLoadingState());
    Either<String, PropertyDetailsModel> response =
        await dioManager.propertyDetail(id: id);
    response.fold(
      (left) {
        toast(left.toString());
        emit(PropertyDetailErrorState());
      },
      (right) {
        propertyDetailsModel = right;

        emit(PropertyDetailSuccessState());
      },
    );
  }

  MapPropertyModel mapPropertyModel = MapPropertyModel();
  bool isLoading = false;

  Future<void> propertyMap({
    required double latitude,
    required double longitude,
  }) async {
    isLoading = true;
    emit(PropertyDetailLoadingState());
    Either<String, MapPropertyModel> response =
        await dioManager.propertyMap(latitude: latitude, longitude: longitude);
    response.fold(
      (left) {
        toast(left.toString());
        isLoading = false;
        emit(PropertyDetailErrorState());
      },
      (right) {
        mapPropertyModel = right;
        oldLocation = LatLng(latitude, longitude);
        if (mapPropertyModel.data != null &&
            mapPropertyModel.data!.isNotEmpty) {
          for (var i in mapPropertyModel.data!) {
            addMarker(LatLng(i.latitude!, i.longitude!), i.id!, currentMarker!);
          }
        }
        isLoading = false;
        emit(PropertyDetailSuccessState());
      },
    );
  }

  LatLng? oldLocation;

  Future<void> onMapMove(CameraPosition position) async {
    if (oldLocation != null) {
      if (calculateDistance(
              lat1: position.target.latitude,
              lon1: position.target.longitude,
              lat2: oldLocation!.latitude,
              lon2: oldLocation!.longitude) >=
          18.00) {
        if (!isLoading) {
          propertyMap(
              latitude: position.target.latitude,
              longitude: position.target.longitude);
        }
      }
    }
  }
}

calculateDistance(
    {required double lat1,
    required double lon1,
    required double lat2,
    required double lon2}) {
  var p = 0.017453292519943295;
  var a = 0.5 -
      cos((lat2 - lat1) * p) / 2 +
      cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
  var val = (12742 * asin(sqrt(a)));
  print("Distance$val");
  return val;
}
