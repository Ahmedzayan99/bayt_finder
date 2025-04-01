import 'package:bayt_finder/nav.dart';
import 'package:bayt_finder/screens/google_map/cubit/google_map_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../appcontext.dart';
import '../../components/buttons/master_button.dart';
import '../../models/place_address_model.dart';
import '../../utils/colors.dart';
import '../../utils/decorations.dart';
import '../../utils/styles.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  @override
  Widget build(BuildContext context) {
    GoogleMapCubit googleMapCubit = GoogleMapCubit.get(context);
    googleMapCubit.debounce?.cancel();
    return BlocConsumer<GoogleMapCubit, GoogleMapState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: Padding(
              padding: EdgeInsetsDirectional.only(start: 10.w, bottom: 170.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                spacing: 10.h,
                children: [
                  InkWell(
                      onTap: () {
                        googleMapCubit.zoomIn();
                      },
                      child: Container(
                          padding: EdgeInsets.all(15.sp),
                          decoration: BoxDecoration(
                              color: AppColors.colorMaster,
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.add,
                            color: AppColors.colorWhite,
                          ))),
                  InkWell(
                      onTap: () {
                        googleMapCubit.zoomOut();
                      },
                      child: Container(
                          padding: EdgeInsets.all(15.sp),
                          decoration: BoxDecoration(
                              color: AppColors.colorMaster,
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.remove,
                            color: AppColors.colorWhite,
                          ))),
                  InkWell(
                      onTap: () {
                        googleMapCubit.goToCurrentLocation();
                      },
                      child: Container(
                          padding: EdgeInsets.all(15.sp),
                          decoration: BoxDecoration(
                              color: AppColors.colorMaster,
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.my_location,
                            color: AppColors.colorWhite,
                          ))),
                ],
              )),
          body: Stack(
            children: [
              Positioned.fill(
                child: GoogleMap(
                  /*      gestureRecognizers: {
            Factory<OneSequenceGestureRecognizer>(
                  () => EagerGestureRecognizer(),
            ),
          },*/
                  //style: lightMapString,
                  mapType: MapType.normal,
                  onMapCreated: (controller) =>
                      googleMapCubit.onMapCreatedSelect(controller),
                  //onCameraIdle: () => googleMapCubit.onCameraIdle(),
                  initialCameraPosition: CameraPosition(
                    target: googleMapCubit.currentLatLong ??
                        LatLng(30.118695, 31.270132),
                    zoom: 19,
                  ),
                  onCameraMove: (position) =>
                      googleMapCubit.onMapMove(position),
                  markers: Set<Marker>.from(googleMapCubit.markers.values),
                  buildingsEnabled: false,
                  zoomControlsEnabled: false,
                  myLocationEnabled: false,
                  myLocationButtonEnabled: false,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(20.sp),
                  decoration: AppBoxDecoration.decorationWhiteRadius20,
                  child: Column(
                    spacing: 11.h,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        googleMapCubit.currentPickLocation,
                        style: TextStyles.font15BlackMedium,
                      ),
                      const SizedBox.shrink(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: MasterButton(
                          onPressed: () async {
                            navigateBack();
                            googleMapCubit.addData();
                          },
                          text: "confirm".tr(),
                        ),
                      ),
                      const SizedBox.shrink(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
