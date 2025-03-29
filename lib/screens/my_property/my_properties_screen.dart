import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/appbar/custom_appbar.dart';
import '../../extensions/loader_widget.dart';
import '../../nav.dart';
import '../../utils/colors.dart';
import '../../utils/styles.dart';
import 'add_Property_screen.dart';
import '../favourite/cubit/favourite_cubit.dart';
import '../no_data_screen.dart';
import '../property/property_widget.dart';
import '../property/property_detail_screen.dart';
import 'cubit/my_property_cubit.dart';

class MyPropertiesScreen extends StatefulWidget {
  const MyPropertiesScreen({super.key});

  @override
  State<MyPropertiesScreen> createState() => _MyPropertiesScreenState();
}

class _MyPropertiesScreenState extends State<MyPropertiesScreen> {
  late MyPropertyCubit myPropertyCubit;

  @override
  void initState() {
    myPropertyCubit = MyPropertyCubit.get(context);
    myPropertyCubit.getMyProperty();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyPropertyCubit, MyPropertyState>(
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
              statusBarIconBrightness: Brightness.dark,
              systemNavigationBarIconBrightness: Brightness.light,
            ),
            child: Scaffold(
              appBar: CustomAppBar(
                title: "My units".tr(),
                showBack: true,
              ),
              body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (state is GetMyPropertyLoadingState) Loader(),
                    if (myPropertyCubit.myProperties.isNotEmpty)
                      Expanded(
                        child: ListView.separated(
                          physics: ScrollPhysics(),
                          padding: EdgeInsets.symmetric(vertical: 25.w),
                          shrinkWrap: true,
                          itemCount: myPropertyCubit.myProperties.length,
                          itemBuilder: (context, i) {
                            return PropertyWidget(
                              isMyProperty: true,
                              property: myPropertyCubit.myProperties[i],
                              onTap: () {
                                navigateTo(PropertyDetailScreen(
                                    propertyId:
                                        myPropertyCubit.myProperties[i].id));
                              },
                              onTapFavourite: () {
                                FavouriteCubit.get(context)
                                    .setFavouriteProperty(
                                        propertyId: myPropertyCubit
                                            .myProperties[i].id
                                            .toString())
                                    .then(
                                  (value) {
                                    if (value) {
                                      if (myPropertyCubit
                                              .myProperties[i].isFavourite ==
                                          0) {
                                        myPropertyCubit
                                            .myProperties[i].isFavourite = 1;
                                      } else {
                                        myPropertyCubit
                                            .myProperties[i].isFavourite = 0;
                                      }
                                    }
                                  },
                                );
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
                    if (state is! GetMyPropertyLoadingState &&
                        myPropertyCubit.myProperties.isEmpty)
                      Center(
                          child: NoDataScreen(mTitle: "Result Not Found".tr())),
                  ]),
              bottomNavigationBar: Padding(
                padding: EdgeInsets.all(16.sp),
                child: InkWell(
                  onTap: () {
                    MyPropertyCubit.get(context).getCategory();
                    navigateTo(AddPropertyScreen());
                    /*    appStore.subscription == "1"
                        ? appStore.isSubscribe != 0
                            ? appStore.subscriptionDetail!.subscriptionPlan!
                                        .packageData!.addProperty ==
                                    0
                                ? showDialog(
                                    context: context,
                                    builder: (context) {
                                      return appStore.addLimitCount == 0
                                          ? LimitExceedDialog(
                                              onTap: () {
                                                LimitScreen(
                                                        limit: "add_property")
                                                    .launch(context);
                                              },
                                            )
                                          : AddPropertyDialog();
                                    },
                                  )
                                : showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AddPropertyDialog();
                                    },
                                  )
                            : SubscribeScreen().launch(context)
                        : */
                  },
                  borderRadius: BorderRadius.circular(12.r),
                  child: Container(
                    width: double.infinity,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: AppColors.colorMaster,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 13.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        spacing: 8.w,
                        children: [
                          Text("Add new property".tr(),
                              style: TextStyles.font15WhiteBold
                                  .copyWith(color: AppColors.colorWhite)),
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.colorWhite),
                            child: Icon(Icons.arrow_forward),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
/*      bottomNavigationBar: AppButton(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        text: "addNew",
        width: double.infinity,
        color: AppColors.colorMaster,
        elevation: 0,
        onTap: () {
          appStore.subscription == "1"
              ? appStore.isSubscribe != 0
              ? appStore.subscriptionDetail!.subscriptionPlan!.packageData!.addProperty == 0
              ? showDialog(
            context: context,
            builder: (context) {
              return appStore.addLimitCount == 0
                  ? LimitExceedDialog(
                onTap: () {
                  LimitScreen(limit: "add_property").launch(context);
                },
              )
                  : AddPropertyDialog();
            },
          )
              : showDialog(
            context: context,
            builder: (context) {
              return AddPropertyDialog();
            },
          )
              : SubscribeScreen().launch(context)
              : showDialog(
            context: context,
            builder: (context) {
              return AddPropertyDialog();
            },
          );
        },
      ).paddingAll(16),*/
            ),
          ),
        );
      },
    );
  }

/*
  Widget propertyList({required List<Property> mPropertyData}) {
    return Stack(
      children: [
        AnimatedListView(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            onNextPage: () {
              if (!isLastPage) {
                appStore.setLoading(true);
                currentPage++;
                setState(() {});
                init();
              }
            },
            itemCount: mPropertyData.length,
            itemBuilder: (context, i) {
              Property data = mPropertyData[i];
              return Container(
                margin: EdgeInsets.only(bottom: 16),
                decoration: boxDecorationWithRoundedCorners(
                  borderRadius: radiusOnly(topLeft: 12, topRight: 12),
                  backgroundColor: AppColors.colorMediumGrayTextForm,
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            cachedImage(data.propertyImage!, height: 145, fit: BoxFit.cover, width: 130).cornerRadiusWithClipRRectOnly(topLeft: 12),
                            if (appStore.subscription == "1" && data.premiumProperty == 1) Positioned(top: 0, left: 0, child: PremiumBtn(pDetail: true)),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                PriceWidget(price: formatNumberString(data.price!), textStyle: boldTextStyle(size: 18, color: AppColors.colorMaster)).expand(),
                                fevIconWidget(data.isFavourite,context).onTap(() {
                                  setState(() {
                                    setFavouriteApi(data.id, data.isFavourite);
                                  });
                                }),
                              ],
                            ),
                            Text(data.name!.capitalizeFirstLetter(), style: primaryTextStyle(size: 16, color: Colors.black)),
                            8.height,
                            Row(
                              children: [
                                Image.asset(ic_property, height: 18, width: 18,color: AppColors.colorMaster),
                                SizedBox(width: 4.w,),
                                Text(data.category!, style: secondaryTextStyle()),
                              ],
                            ),
                            8.height,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(ic_map_point, width: 16, height: 16, color: grey),
                                SizedBox(width: 4.w,),
                                Text(data.address!, maxLines: 3, overflow: TextOverflow.ellipsis, style: secondaryTextStyle()).expand(),
                              ],
                            ),
                          ],
                        ).paddingSymmetric(horizontal: 14, vertical: 10).expand(),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration:
                          boxDecorationWithRoundedCorners(backgroundColor: data.advertisementProperty == 1 ? boostBgColor : AppColors.colorMaster, borderRadius: radiusOnly(bottomLeft: 12, bottomRight: 12)),
                      child: Text(data.advertisementProperty == 1 ? "alreadyBoostedYourProperty" : "boostYourProperty",
                              style: primaryTextStyle(color: Colors.white), textAlign: TextAlign.end)
                          .center(),
                    ).onTap(() {
                      paymentId = data.id;
                      paymentPrice = data.price;
                      setState(() {
                        if (appStore.subscription == "1") {
                          if (appStore.isSubscribe != 0) {
                            if (data.advertisementProperty == null && appStore.subscriptionDetail!.subscriptionPlan!.packageData!.advertisement! == 0) {
                              if (appStore.advertisement == 0) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return LimitExceedDialog(
                                        onTap: () {
                                          finish(context);
                                          LimitScreen(limit: "advertisement_property").launch(context);
                                        },
                                      );
                                    });
                              } else {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return BoostDialog(onAccept: () {
                                        setState(() {
                                          setAdvertisement(data.id, data.advertisementProperty);
                                          finish(context);
                                        });
                                      });
                                    });
                              }
                            }
                          } else {
                            SubscribeScreen().launch(context);
                          }
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return BoostDialog(onAccept: () {
                                  setState(() {
                                    setAdvertisement(data.id, data.advertisementProperty);
                                    finish(context);
                                  });
                                });
                              });
                        }
                      });
                    })
                  ],
                ),
              ).paddingSymmetric(horizontal: 16).onTap(() async {
                {
                  bool? res = await PropertyDetailScreen(propertyId: data.id, update: true, onTap: (bool? result) {}).launch(context);
                  if (res!) {
                    getMyProperty();
                  }
                }
              });
            }),
        if (mPropertyData.isEmpty && !appStore.isLoading) emptyWidget(),
        if (appStore.isLoading) Loader()
      ],
    );
  }
*/
}
