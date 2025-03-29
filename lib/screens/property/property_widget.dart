import 'package:bayt_finder/nav.dart';
import 'package:bayt_finder/screens/my_property/add_Property_screen.dart';
import 'package:bayt_finder/screens/my_property/cubit/my_property_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../models/property_details_model.dart';
import '../../utils/alert_two_buttons.dart';
import '../../utils/app_common.dart';
import '../../utils/colors.dart';
import '../../utils/decorations.dart';
import '../../utils/images.dart';
import '../../utils/styles.dart';
import '../favourite/cubit/favourite_cubit.dart';

class PropertyWidget extends StatelessWidget {
  const PropertyWidget({
    super.key,
    required this.property,
    required this.onTap,
    required this.onTapFavourite,
    this.isMyProperty = false,
  });

  final PropertyDetail property;
  final void Function() onTap;
  final void Function() onTapFavourite;
  final bool isMyProperty;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: AppBoxDecoration.decorationWhiteRadius20,
        child: Column(
          spacing: 7.h,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius:
                  BorderRadius.vertical(top: Radius.circular(20.r)),
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                        Color.fromRGBO(0, 0, 0, 0.25), BlendMode.multiply),

                   child: cachedImage(property.propertyImage,
                        height: 158.h,
                        width: double.infinity,
                        fit: BoxFit.fill),
                  ),
                ),
                PositionedDirectional(
                  top: 18.h,
                  start: 12.w,
                  end: 12.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 5.h),
                        decoration: AppBoxDecoration.decorationMasterRadius10,
                        child: Text(property.propertyFor==0?'Rent'.tr():property.propertyFor==1?'Sell'.tr():"PG/Co-living".tr(),
                            style: TextStyles.font16WhiteRegular),
                      ),
                      BlocConsumer<FavouriteCubit, FavouriteState>(
                        listener: (context, state) {
                          // TODO: implement listener
                        },
                        builder: (context, state) {
                          return InkWell(
                            onTap: onTapFavourite,
                            child: fevIconWidget(property.isFavourite, context),
                          );
                        },
                      )
                    ],
                  ),
                  //PremiumBtn(pDetail: true),
                ),
              ],
            ),
            SizedBox(
              height: 7.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 7.h,
                      children: [
                        Text(property.name.toString(),
                            style: TextStyles.font20BlackMedium),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 4.w,
                          children: [
                            SvgPicture.asset(AppImage.location,
                                height: 15.h, width: 15.w),
                            Expanded(
                              child: Text(
                                property.address.toString(),
                                style: TextStyles.font16MediumGrayTextMedium,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                        Row(
                          spacing: 4.w,
                          children: [
                            SvgPicture.asset(
                              AppImage.bathroom,
                            ),
                            SvgPicture.asset(
                              AppImage.bedroom,
                            ),
                            Text(
                              property.bhk.toString(),
                              style: TextStyles.font16MediumGrayTextMedium,
                              overflow: TextOverflow.ellipsis,
                            ),
                   /*         SvgPicture.asset(
                              AppImage.bathroom,
                            ),
                            Text(
                              property.status.toString(),
                              style: TextStyles.font16MediumGrayTextMedium,
                              overflow: TextOverflow.ellipsis,
                            ),*/
                        /*    SvgPicture.asset(
                              AppImage.carLine,
                            ),
                            Text(
                              property.toString(),
                              style: TextStyles.font16MediumGrayTextMedium,
                              overflow: TextOverflow.ellipsis,
                            ),*/
                            Container(
                              height: 20.h,
                              width: 1.w,
                              color: AppColors.colorMediumGrayText,
                            ),
                            SvgPicture.asset(
                              AppImage.bxArea,
                            ),
                            Text(
                              "${property.sqft.toString()} ${"M".tr()}",
                              style: TextStyles.font16MediumGrayTextMedium,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    spacing: 14.h,
                    children: [
                      if(isMyProperty)BlocConsumer<MyPropertyCubit, MyPropertyState>(
                        listener: (context, state) {
                        },
                        builder: (context, state) {
                          MyPropertyCubit myPropertyCubit =MyPropertyCubit.get(context);
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            spacing: 4.w,
                            children: [

                              InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return TwoButtonAlert(
                                        title:
                                        "You are one step away from Delete Property. Do you really want to Delete?"
                                            .tr(),
                                        onTap: () {
                                          navigateBack(context);
                                          myPropertyCubit.propertyDelete(id: property.id!).then((value) {
                                            if(value ==true){
                                              myPropertyCubit.getMyProperty();
                                            }
                                          },);
                                        },
                                        textButtonConfirm: "Delete".tr(),
                                      );
                                    },
                                  );

                                },
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      AppImage.delete,
                                    ),
                                    Text(
                                      "Delete".tr(),
                                      style: TextStyles
                                          .font16MediumGrayTextMedium
                                          .copyWith(
                                          color: AppColors.colorError),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  MyPropertyCubit.get(context).getCategory();
                                  navigateTo( AddPropertyScreen(
                                    updateProperty: true,
                                    idProperty: property.id!,
                                  ));
                                },
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      AppImage.edit,
                                    ),
                                    Text(
                                      "Edit".tr(),
                                      style: TextStyles
                                          .font16MediumGrayTextMedium,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                      ),
                      Text(property.priceFormat.toString(),
                          style: TextStyles.font20BlackMedium),
                    ],
                  )
                ],
              ),
            ),
            SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
