import 'package:bayt_finder/components/appbar/custom_appbar.dart';
import 'package:bayt_finder/extensions/loader_widget.dart';
import 'package:bayt_finder/nav.dart';
import 'package:bayt_finder/screens/layout/layout_screen.dart';
import 'package:bayt_finder/screens/map/cubit/show_property_in_map_cubit.dart';
import 'package:bayt_finder/utils/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../appcontext.dart';
import '../../components/buttons/master_button.dart';
import '../../main.dart';
import '../../utils/app_common.dart';
import '../../utils/custom_bottom_sheet.dart';
import '../../utils/decorations.dart';
import '../../utils/images.dart';
import '../../utils/styles.dart';
import '../image_view/photo_gallery_screen.dart';
import '../property/amenity_screen.dart';

class ShowPropertyInMapScreen extends StatelessWidget {
  const ShowPropertyInMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ShowPropertyInMapCubit mapCubit = ShowPropertyInMapCubit.get(context);
    if (mapCubit.currentMarker == null) {
      mapCubit.convertMarkerImage();
    }
    if (mapCubit.currentLocation == null) {
      mapCubit.getCurrentLocation();
    }
    return BlocConsumer<ShowPropertyInMapCubit, ShowPropertyInMapState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: Padding(
              padding: EdgeInsetsDirectional.only(start: 10.w, bottom: 30.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10.h,
                children: [
                  SizedBox(
                    height: 100.h,
                  ),
                  InkWell(
                      onTap: () {
                        navigateFinish(LayoutScreen());
                      },

                      child: Container(
                          padding: EdgeInsets.all(15.sp),
                          decoration: BoxDecoration(
                              color: AppColors.colorMaster,
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.arrow_forward,
                            color: AppColors.colorWhite,
                          ))),
                  Spacer(),
                  InkWell(
                      onTap: () {
                        mapCubit.chengeMapType();
                      },
                      child: Container(
                          padding: EdgeInsets.all(15.sp),
                          decoration: BoxDecoration(
                              color: AppColors.colorMaster,
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.style_sharp,
                            color: AppColors.colorWhite,
                          ))),
                  InkWell(
                      onTap: () {
                        mapCubit.goToCurrentLocation();
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
                  InkWell(
                      onTap: () {
                        mapCubit.zoomIn();
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
                        mapCubit.zoomOut();
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
                ],
              )),
          body: GoogleMap(
            /*      gestureRecognizers: {
            Factory<OneSequenceGestureRecognizer>(
                  () => EagerGestureRecognizer(),
            ),
          },*/
            //style: lightMapString,
            mapType: mapCubit.mapType,
            onMapCreated: (controller) => mapCubit.onMapCreated(controller),
            initialCameraPosition: CameraPosition(
              target: mapCubit.currentLocation ?? LatLng(30.118695, 31.270132),
              zoom: 14,
            ),
            onCameraMove: (position) => mapCubit.onMapMove(position),
            markers: Set<Marker>.from(mapCubit.markers.values),
            buildingsEnabled: false,
            zoomControlsEnabled: false,
            myLocationEnabled: false,
            myLocationButtonEnabled: false,
          ),
        );
      },
    );
  }

}
