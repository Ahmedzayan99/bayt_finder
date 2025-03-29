import 'package:bayt_finder/components/appbar/custom_appbar.dart';
import 'package:bayt_finder/nav.dart';
import 'package:bayt_finder/screens/filter/cubit/filter_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../components/auth_text_form_field/auth_text_form_field.dart';
import '../../local_storage/shared_preferences_manager.dart';
import '../../utils/alert_two_buttons.dart';
import '../../utils/constants.dart';
import '../favourite/cubit/favourite_cubit.dart';
import '../property/property_widget.dart';
import '../property/property_detail_screen.dart';
import '../../../main.dart';
import '../../extensions/loader_widget.dart';
import '../../extensions/text_styles.dart';
import '../../utils/colors.dart';
import '../../utils/images.dart';

class SearchScreen extends StatelessWidget {

  const SearchScreen({super.key,});
  @override
  Widget build(BuildContext context)  {
    FilterCubit filterCubit=FilterCubit.get(context);
    filterCubit.mRecentSearchList= ( SharedPreferencesManager.getStringListAsync(AppConstants.recentSearchList,))??[];
    return BlocConsumer<FilterCubit ,FilterState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            title: 'Search'.tr(),
            showBack: true,
            elevation: 0,
          ),
          body: Column(
            spacing: 20.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              searchWidget(filterCubit,context),
         if(filterCubit.mRecentSearchList.isNotEmpty)     Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(AppImage.recent),
                        Text("Recently Searched Location".tr(),
                            style:
                            secondaryTextStyle(size: 18)),
                      ],
                    ),
                    SizedBox(
                      height: 40.h,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final item = filterCubit.mRecentSearchList[index];
                            return InkWell(
                              onTap: () {
                                filterCubit.mSearchCont.text =
                                    item.toString();
                                filterCubit.mSearchValue =
                                    filterCubit.mSearchCont.text;
                                filterCubit.searchLocation();
                             //   searchPropertyApi();
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10.w,vertical:2.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.r),
                                  border: Border.all(
                                    width: 1.w,
                                    color: AppColors.colorBlack,
                                  ),
                                ),
                                child: Text(item,
                                    style:
                                    primaryTextStyle()),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: 15.w,
                            );
                          },
                          itemCount: filterCubit.mRecentSearchList
                              .length),
                    ),

                /*    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        18.height,
                        Stack(
                          children: [
                            if(filterCubit.mergePropertyData.isNotEmpty)ListView.builder(
                                physics: ScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: filterCubit.mergePropertyData.length,
                                itemBuilder: (context, index) {
                                  return AdvertisementPropertyComponent(
                                    property: filterCubit.mergePropertyData[index],
                                    isFullWidth: true,
                                    onCall: () {},
                                  ).onTap(() async {
                                    bool? res =
                                    await PropertyDetailScreen(
                                        propertyId:
                                        filterCubit.mergePropertyData[
                                        index]
                                            .id)
                                        .launch(context);
                                    if (res == true) {
                                      filterCubit.searchLocation();
                                      setState(() {});
                                    }
                                  });
                                }),
                    //   filterCubit.mergePropertyData.isNotEmpty
             *//*                   ?
                                : Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Text("foundState",
                                          style: primaryTextStyle(),
                                          textAlign: TextAlign.start)),
                                  40.height,
                                  Image.asset(ic_no_search_found,
                                      height: 150, width: 200)
                                      .center(),
                                  20.height,
                                  Text("searchNotFound",
                                      style: boldTextStyle())
                                      .center(),
                                  20.height,
                                  Text(
                                    "searchMsg"
                                        .capitalizeFirstLetter(),
                                    style: secondaryTextStyle(),
                                    textAlign: TextAlign.center,
                                  ).paddingSymmetric(horizontal: 16)
                                ]),*//*
                          ],
                        )
                      ],
                    )*/
                  ],
                ),
              ),
              if (state is SearchLocationLoadingState) Loader(),
             if(filterCubit.mergePropertyData.isNotEmpty) Expanded(
                child: ListView.separated(
                  physics: ScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.symmetric(vertical: 25.w),
                  shrinkWrap: true,
                  itemCount: filterCubit.mergePropertyData.length,
                  itemBuilder: (context, i) {
                    return PropertyWidget(
                      property: filterCubit.mergePropertyData[i],
                      onTap: () {
                        navigateTo( PropertyDetailScreen(
                            propertyId: filterCubit.mergePropertyData[i].id));
                      },
                      onTapFavourite: () {
                        if (isLogin) {
                          FavouriteCubit.get(context)
                              .setFavouriteProperty(
                              propertyId: filterCubit.mergePropertyData[i].id
                                  .toString())
                              .then(
                                (value) {
                              if (value) {
                                if (filterCubit.mergePropertyData[i].isFavourite ==
                                    0) {
                                  filterCubit.mergePropertyData[i].isFavourite =
                                  1;
                                } else {
                                  filterCubit.mergePropertyData[i].isFavourite =
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
            ],
          ),
        );
      },
    );
  }

  Widget searchWidget(FilterCubit filterCubit,context) {
    return Container(
      color: AppColors.colorWhite,
      child: Padding(
        padding: EdgeInsets.only(left: 18.sp,right: 18.sp,bottom: 18.sp),
        child: AuthTextFormField(
            focusNode:    filterCubit.search,
            hintText: 'search'.tr(),
            textInputType: TextInputType.name,
            onFieldSubmitted: (v) {
              filterCubit.mSearchValue = v;
              filterCubit.searchLocation();
            },
            prefixIcon: Padding(
              padding: EdgeInsets.all(13.h),
              child: SvgPicture.asset(AppImage.search2),
            ),
            fillColor: AppColors.colorBGSheet,
            obscureText: false),
      ),
    );
  }
}
