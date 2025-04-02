import 'package:bayt_finder/components/appbar/custom_appbar.dart';
import 'package:bayt_finder/extensions/loader_widget.dart';
import 'package:bayt_finder/nav.dart';
import 'package:bayt_finder/screens/no_data_screen.dart';
import 'package:bayt_finder/screens/property/property_detail_screen.dart';
import 'package:bayt_finder/screens/top_agencies/cubit/top_agencies_cubit.dart';
import 'package:bayt_finder/utils/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../extensions/decorations.dart';
import '../../extensions/text_styles.dart';
import '../../utils/app_common.dart';
import '../../utils/images.dart';
import '../../utils/styles.dart';
import '../favourite/cubit/favourite_cubit.dart';

class TopAgencies extends StatelessWidget {
  const TopAgencies({super.key, required this.propertyId});

  final int propertyId;

  @override
  Widget build(BuildContext context) {
    TopAgenciesCubit topAgenciesCubit = TopAgenciesCubit.get(context);
    topAgenciesCubit.getAgenciesDetail(id: propertyId);
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: BlocConsumer<TopAgenciesCubit, TopAgenciesState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return AnnotatedRegion(
            value: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
              systemNavigationBarIconBrightness: Brightness.light,
            ),
            child: topAgenciesCubit.agenciesDetail.data != null
                ? Scaffold(
                    appBar: CustomAppBar(
                      title: "",
                      showBack: true,
                      actions: [
                        /*  InkWell(
                     onTap: () {
                       Share.share(
                           topAgenciesCubit.agenciesDetail.data!.username
                               .toString(),
                           subject: topAgenciesCubit.agenciesDetail.data!.profileImage
                               .toString());
                     },
                     child: Icon(Icons.share_outlined,
                         size: 27.sp,
                         color: AppColors.colorBlack)),*/
                        /*       BlocConsumer<FavouriteCubit, FavouriteState>(
                   listener: (context, state) {
                     // TODO: implement listener
                   },
                   builder: (context, state) {
                     return InkWell(
                         onTap: () {
                    */ /*       if (isLogin) {
                             FavouriteCubit.get(context)
                                 .setFavouriteProperty(
                                 propertyId: '3')
                                 .then(
                                   (value) {
                                 if (value) {
                                   if (topAgenciesCubit.agenciesDetail.
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
                           }*/ /*
                         },
                         child:SvgPicture.asset('assets/svg_icon/ic_favorite_fill.svg',
                             color: AppColors.colorBlack,
                             height:30.h, width: 20.w), );*/ /* child:SvgPicture.asset('assets/svg_icon/fivoret.svg',
                             height: 20.h, width: 20.w), );*/ /*
                   },
                 )*/
                      ],
                    ),
                    body: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          cachedImage(
                              topAgenciesCubit.agenciesDetail.data!.profileImage
                                  .toString(),
                              fit: BoxFit.fill,
                              height: 365.h,
                              radius: 0.0,
                              width: double.infinity),
                          Padding(
                            padding: EdgeInsets.all(12.w),
                            child: Column(
                              spacing: 15.h,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    topAgenciesCubit
                                        .agenciesDetail.data!.username
                                        .toString(),
                                    style: TextStyles.font17MasterBold),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  spacing: 10.w,
                                  children: [
                                    /*       SvgPicture.asset(AppImage.profile,
                                height: 15.h, width: 15.w),
                            Text(
                              "${"Agents".tr()}${topAgenciesCubit.agenciesDetail.data!.ag
                                  .toString()}",
                              style: TextStyles.font16MediumGrayTextMedium,
                              overflow: TextOverflow.ellipsis,
                            ),*/
                                    Image.asset(AppImage.residential,
                                        height: 15.h, width: 15.w),
                                    Text(
                                      "${"Properties".tr()} ${topAgenciesCubit.agenciesDetail.property!.length.toString()}",
                                      style:
                                          TextStyles.font16MediumGrayTextMedium,
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  ],
                                ),
                                Text(
                                  "Description".tr(),
                                  style: TextStyles.font20BlackBold,
                                ),
                                Text(
                                  topAgenciesCubit
                                      .agenciesDetail.data!.description
                                      .toString(),
                                  style: TextStyles.fontPrivacyPolicy,
                                ),
                                Text(
                                  "Listing".tr(),
                                  style: TextStyles.font20BlackBold,
                                ),
                                if (topAgenciesCubit
                                    .agenciesDetail.property!.isEmpty)NoDataScreen(mTitle: "No properties added yet".tr()),
                                if (topAgenciesCubit
                                    .agenciesDetail.property!.isNotEmpty)  ListView.separated(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          navigateTo(PropertyDetailScreen(
                                            propertyId: topAgenciesCubit
                                                .agenciesDetail
                                                .property![index]
                                                .id,
                                          ));
                                        },
                                        child: Row(
                                          spacing: 10.w,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(12.r),
                                              child: cachedImage(
                                                topAgenciesCubit
                                                    .agenciesDetail
                                                    .property![index]
                                                    .propertyImage
                                                    .toString(),
                                                fit: BoxFit.fill,
                                                height: 115.h,
                                                width: 115.h,
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                spacing: 4.h,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox.shrink(),
                                                  Text(
                                                      topAgenciesCubit
                                                          .agenciesDetail
                                                          .property![index]
                                                          .name
                                                          .toString(),
                                                      style: TextStyles
                                                          .font16MediumGrayTextMedium),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    spacing: 4.w,
                                                    children: [
                                                      SvgPicture.asset(
                                                          AppImage.location,
                                                          height: 15.h,
                                                          width: 15.w),
                                                      Expanded(
                                                        child: Text(
                                                          topAgenciesCubit
                                                              .agenciesDetail
                                                              .property![index]
                                                              .address
                                                              .toString(),
                                                          maxLines: 1,
                                                          style: TextStyles
                                                              .font16MediumGrayTextMedium,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    spacing: 4.w,
                                                    children: [
                                                      SvgPicture.asset(
                                                        AppImage.bxArea,
                                                        width: 16.w,
                                                        height: 16.h,
                                                        colorFilter:
                                                            ColorFilter.mode(
                                                                AppColors
                                                                    .colorBlack,
                                                                BlendMode
                                                                    .srcIn),
                                                      ),
                                                      Text(
                                                        "${topAgenciesCubit.agenciesDetail.property![index].sqft.toString()} ${"M".tr()}",
                                                        style: TextStyles
                                                            .font16MediumGrayTextMedium,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                      SvgPicture.asset(
                                                        AppImage.bedroom,
                                                        width: 16.w,
                                                        height: 16.h,
                                                        colorFilter:
                                                            ColorFilter.mode(
                                                                AppColors
                                                                    .colorBlack,
                                                                BlendMode
                                                                    .srcIn),
                                                      ),
                                                      SvgPicture.asset(
                                                        AppImage.cbiBathroom,
                                                        width: 16.w,
                                                        height: 16.h,
                                                        colorFilter:
                                                            ColorFilter.mode(
                                                                AppColors
                                                                    .colorBlack,
                                                                BlendMode
                                                                    .srcIn),
                                                      ),
                                                      Text(
                                                        topAgenciesCubit
                                                            .agenciesDetail
                                                            .property![index]
                                                            .bhk
                                                            .toString(),
                                                        style: TextStyles
                                                            .font16MediumGrayTextMedium,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                      topAgenciesCubit
                                                          .agenciesDetail
                                                          .property![index]
                                                          .priceFormat
                                                          .toString(),
                                                      style: TextStyles
                                                          .font20BlackMedium
                                                          .copyWith(
                                                              color: AppColors
                                                                  .colorPrice)),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.h),
                                        child: Container(
                                          color: AppColors.colorMediumGrayText,
                                          width: double.infinity,
                                          height: 1.h,
                                        ),
                                      );
                                    },
                                    itemCount: topAgenciesCubit
                                        .agenciesDetail.property!.length)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    bottomNavigationBar: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 12.h),
                      decoration: boxDecorationWithRoundedCorners(
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                commonLaunchUrl(
                                    'tel:${topAgenciesCubit.agenciesDetail.data!.contactNumber.toString()}');
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
                                    SizedBox(
                                      width: 20.h,
                                    ),
                                    Text("Call Us".tr(),
                                        style: primaryTextStyle(
                                            color: Colors.black)),
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
                                    'whatsapp://send?phone=:${topAgenciesCubit.agenciesDetail.data!.whatsapp.toString()}');
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
                                    SizedBox(
                                      width: 20.h,
                                    ),
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
                    ),
                  )
                : Scaffold(
              appBar: CustomAppBar(
              title: "",
              showBack: true,
            ),
                body: Loader()),
          );
        },
      ),
    );
  }
}
