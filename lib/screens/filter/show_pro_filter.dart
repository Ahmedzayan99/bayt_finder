import 'package:bayt_finder/components/appbar/custom_appbar.dart';
import 'package:bayt_finder/nav.dart';
import 'package:bayt_finder/screens/filter/cubit/filter_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/alert_two_buttons.dart';
import '../favourite/cubit/favourite_cubit.dart';
import '../property/property_widget.dart';
import '../property/property_detail_screen.dart';
import '../../../main.dart';

class PropertyFilterScreen extends StatelessWidget {

  const PropertyFilterScreen({super.key,});
  @override
  Widget build(BuildContext context)  {
    FilterCubit filterCubit=FilterCubit.get(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Filter'.tr(),
        showBack: true,
        elevation: 0,
      ),
      body: Column(
        spacing: 20.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Expanded(
            child: ListView.separated(
              physics: ScrollPhysics(),
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.symmetric(vertical: 25.w),
              shrinkWrap: true,
              itemCount: filterCubit.property.length,
              itemBuilder: (context, i) {
                return PropertyWidget(
                  property: filterCubit.property[i],
                  onTap: () {
                    navigateTo( PropertyDetailScreen(
                        propertyId: filterCubit.property[i].id));
                  },
                  onTapFavourite: () {
                    if (isLogin) {
                      FavouriteCubit.get(context)
                          .setFavouriteProperty(
                          propertyId: filterCubit.property[i].id
                              .toString())
                          .then(
                            (value) {
                          if (value) {
                            if (filterCubit.property[i].isFavourite ==
                                0) {
                              filterCubit.property[i].isFavourite =
                              1;
                            } else {
                              filterCubit.property[i].isFavourite =
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
  }
}
