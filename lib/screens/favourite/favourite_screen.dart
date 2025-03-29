import 'package:bayt_finder/nav.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/appbar/custom_appbar.dart';
import '../../extensions/loader_widget.dart';
import '../../main.dart';
import '../../utils/alert_two_buttons.dart';
import '../layout/cubit/layout_cubit.dart';
import '../no_data_screen.dart';
import '../property/property_widget.dart';
import '../property/property_detail_screen.dart';
import 'cubit/favourite_cubit.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key, });
/*  Future<void> getFavouritePropertyData() async {
    appStore.setLoading(true);
    getFavouriteProperty(page).then((value) {
      appStore.setLoading(false);
      numPage = value.pagination!.totalPages;
      if (page == 1) {
        mFavouriteProperty.clear();
      }
      Iterable it = value.data!;
      it.map((e) => mFavouriteProperty.add(e)).toList();

      print("Favourite Property List Is ==>$mFavouriteProperty");
      setState(() {});
    }).catchError((e) {
      print("Error is $e");
      appStore.setLoading(false);
    });
  }*/
  @override
  Widget build(BuildContext context) {
    FavouriteCubit favouriteCubit  =FavouriteCubit.get(context);
    favouriteCubit.getFavouriteProperty();
    return BlocBuilder<FavouriteCubit,FavouriteState>(
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
              title: "Favourite".tr(),
                showBack: true,
                onBackButtonPressed:() {
                  LayoutCubit.get(context).changeIndex(LayoutCubit.get(context).currentFrom);
                }
              /* actions: [
                Padding(
                  padding:
                  EdgeInsets.symmetric( horizontal: 20.w),
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
                        child: Center(
                            child: SvgPicture.asset(AppImage.search2))),
                  ),
                ),
              ],*/
            ),
            body: Stack(
              children: [
                if(favouriteCubit.favouriteProperty.isNotEmpty)ListView.separated(
                  // controller: scrollController,
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 20.h,
                      );
                    },
                    physics: ScrollPhysics(),
                    padding: EdgeInsets.symmetric(vertical: 25.w),
                    shrinkWrap: true,
                    itemCount: favouriteCubit.favouriteProperty.length,
                    itemBuilder: (context, i) {
                      /*  .onTap(() async {
                          if (favouriteCubit.favouriteProperty[i].premiumProperty == 1) {
                          if (appStore.subscription == "1") {
                          if (appStore.isSubscribe != 0) {
                          bool? res = await PropertyDetailScreen(propertyId: favouriteCubit.favouriteProperty[i].id).launch(context);
                          if (res == true) {
                          // init();
                          }
                          } else {
                          SubscribeScreen().launch(context);
                          }
                          } else {
                          bool? res = await PropertyDetailScreen(propertyId: favouriteCubit.favouriteProperty[i].id).launch(context);
                          if (res == true) {
                          //   init();
                          }
                          }
                          } else {
                          bool? res = await PropertyDetailScreen(propertyId: favouriteCubit.favouriteProperty[i].id).launch(context);
                          if (res == true) {
                          //    init();
                          }
                          }
                          setState(() {});
                          }).paddingBottom(16);*/
                      return PropertyWidget(
                        property: favouriteCubit.favouriteProperty[i],
                        onTap: () {
                          navigateTo(PropertyDetailScreen(
                              propertyId: favouriteCubit.favouriteProperty[i].id));
                        },
                        onTapFavourite: () {
                          if (isLogin) {
                            FavouriteCubit.get(context)
                                .setFavouriteProperty(
                                propertyId: favouriteCubit.favouriteProperty[i].id.toString())
                                .then(
                                  (value) {
                                if (value) {
                                  favouriteCubit.favouriteProperty.removeAt(i);[i];
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
                    }),
                if(state is! GetFavouriteLoadingState &&favouriteCubit.favouriteProperty.isEmpty)NoDataScreen(mTitle: "Result Not Found".tr()),
                if(state is GetFavouriteLoadingState )Center(child: Loader())
              ],
            )),
      ),
    );
  },
);
  }
}
