import 'package:bayt_finder/components/appbar/custom_appbar.dart';
import 'package:bayt_finder/screens/property/cubit/property_cubit.dart';
import 'package:bayt_finder/screens/property/property_widget.dart';
import 'package:bayt_finder/utils/colors.dart';
import 'package:bayt_finder/utils/images.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../extensions/loader_widget.dart';
import '../../main.dart';
import '../../nav.dart';
import '../../utils/alert_two_buttons.dart';
import '../favourite/cubit/favourite_cubit.dart';
import '../filter/filter_screen.dart';
import '../filter/search_screen.dart';
import '../layout/cubit/layout_cubit.dart';
import 'property_detail_screen.dart';

class PropertyScreen extends StatelessWidget {
  const PropertyScreen(
      {super.key, this.title = 'Property', this.fromLayout = false });

  final String title;
  final bool fromLayout;


  @override
  Widget build(BuildContext context) {
    PropertyCubit propertyCubit = PropertyCubit.get(context);
    return BlocConsumer<PropertyCubit, PropertyState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async {
            return true;
          },
          child: AnnotatedRegion(
            value: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness:
                  Brightness.dark,
              systemNavigationBarIconBrightness:
                  Brightness.light,
            ),
            child: Scaffold(
              appBar: CustomAppBar(
                title: propertyCubit.title.tr(),
                showBack: true,
                onBackButtonPressed: fromLayout?() {
                  LayoutCubit.get(context).changeIndex(LayoutCubit.get(context).currentFrom);
                }:null,
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

                ],
              ),
         body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (state is FilterPropertyLoadingState) Loader(),
                    Expanded(
                      child: ListView.separated(
                        physics: ScrollPhysics(),
                        padding: EdgeInsets.symmetric(vertical: 25.w),
                        shrinkWrap: true,
                        itemCount: propertyCubit.property.length,
                        itemBuilder: (context, i) {
                          return PropertyWidget(
                            property: propertyCubit.property[i],
                            onTap: () {
                              navigateTo(   PropertyDetailScreen(
                                  propertyId: propertyCubit.property[i].id));
                            },
                            onTapFavourite: () {
                              if (isLogin) {
                                FavouriteCubit.get(context)
                                    .setFavouriteProperty(
                                        propertyId: propertyCubit.property[i].id
                                            .toString())
                                    .then(
                                  (value) {
                                    if (value) {
                                      if (propertyCubit
                                              .property[i].isFavourite ==
                                          0) {
                                        propertyCubit.property[i].isFavourite =
                                            1;
                                      } else {
                                        propertyCubit.property[i].isFavourite =
                                            0;
                                      }
                                    }
                                  },
                                );
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return TwoButtonAlert();
                                  },
                                );
                              }
                            },
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 20.h,
                          );
                        },
                      ),
                    ),
                  ]),
            ),
          ),
        );
      },
    );
  }
}
