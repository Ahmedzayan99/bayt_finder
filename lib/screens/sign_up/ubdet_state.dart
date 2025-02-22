import 'package:bayt_finder/components/auth_text_form_field/auth_text_form_field.dart';
import 'package:bayt_finder/components/buttons/master_button.dart';
import 'package:bayt_finder/nav.dart';
import 'package:bayt_finder/screens/language/cubit/language_cubit.dart';
import 'package:bayt_finder/screens/layout/layout_screen.dart';
import 'package:bayt_finder/utils/decorations.dart';
import 'package:bayt_finder/utils/images.dart';
import 'package:bayt_finder/utils/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../extensions/common.dart';
import '../../extensions/decorations.dart';
import '../../local_storage/shared_preferences_manager.dart';
import '../../main.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../language/widgit/custom_flush_bar.dart';
import 'cubit/register_cubit.dart';

class UpdateStata extends StatelessWidget {
  const UpdateStata({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterCubit registerCubit = RegisterCubit.get(context);
    if (registerCubit.city.isEmpty) {
      registerCubit.getCity();
    }
    if (registerCubit.configurationPriceModel.maxPrice == null) {
      registerCubit.filterConfigurationPrice();
    }
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            appStore.isDarkModeOn ? Brightness.light : Brightness.light,
        systemNavigationBarIconBrightness:
            appStore.isDarkModeOn ? Brightness.light : Brightness.light,
      ),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if(state is UpdateUserStatusSuccessState){
            navigateFinish(context, LayoutScreen());
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.colorWhite,
            body: Stack(
              children: [
                Container(
                  height: 315.h,
                  width: double.infinity,
                  decoration: AppBoxDecoration.decorationWhiteRadius30Bottom,
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 60.h, left: 30.w, right: 30.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                backgroundColor: AppColors.colorWhite,
                                enableDrag: true,
                                //barrierColor: AppColors.colorMaster,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.r)),
                                context: context,
                                builder: (context) {
                                  LanguageCubit cubit = LanguageCubit.get(context);
                                  return BlocBuilder<LanguageCubit, LanguageState>(
                                    builder: (context, state) {
                                      return Padding(
                                        padding:
                                        EdgeInsets.symmetric(horizontal: 24.w, vertical: 5.h),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          spacing: 10.h,
                                          children: [
                                            Container(
                                              height: 4.h,
                                              width: 144.w,
                                              color: AppColors.colorMediumGrayText,
                                            ),
                                            SizedBox.shrink(),
                                            CustomFlushBar(
                                              image: AppImage.iraqFlag,
                                              text: 'اللغة العربية',
                                              onTap: () async {
                                                cubit.selectLanguage("ar");
                                                await context.setLocale(
                                                    EasyLocalization.of(context)!
                                                        .supportedLocales[0]);
                                                await SharedPreferencesManager.saveData(
                                                    "local",  "en");
                                                navigateBack(context);
                                              },
                                              isPressed: cubit.selectedLanguage == "ar",
                                            ),
                                            CustomFlushBar(
                                              image:AppImage.usFlag,
                                              text: 'English',
                                              onTap: () async {
                                                cubit.selectLanguage("en");
                                                await context.setLocale(
                                                    EasyLocalization.of(context)!
                                                        .supportedLocales[1]);
                                                await SharedPreferencesManager.saveData(
                                                    "local",  "ar");
                                                navigateBack(context);
                                              },
                                              isPressed: cubit.selectedLanguage == "en",
                                            ),
                                            SizedBox.shrink(),

                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                            child: SvgPicture.asset(AppImage.language)),
                        InkWell(
                          onTap: () {
                            navigateFinish(context, LayoutScreen());
                          },
                          child: Text(
                            'skip',
                            style: TextStyles.font16WhiteRegular,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 150.h, left: 30.w, right: 30.w),
                  child: Container(
                    width: double.infinity,
                    decoration: AppBoxDecoration.decorationWhiteRadius20Shadow,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 20.w, left: 30.w, right: 30.h, bottom: 50.h),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        spacing: 23.h,
                        children: [
                          Align(
                            alignment: AlignmentDirectional.topCenter,
                            child: SvgPicture.asset(
                              AppImage.appIcon,
                              width: 150.w,
                              height: 110.h,
                            ),
                          ),
                          SizedBox.shrink(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                registerCubit.intialStep == 0
                                    ? Icons.circle_outlined
                                    : Icons.check_circle_sharp,
                                color: AppColors.colorMaster,
                              ),
                              Container(
                                height: 1.h,
                                width: 60,
                                color: AppColors.colorMediumGrayBorder,
                              ),
                              Icon(
                                registerCubit.intialStep == 1
                                    ? Icons.circle_outlined
                                    : registerCubit.intialStep > 1
                                        ? Icons.check_circle_sharp
                                        : Icons.circle_sharp,
                                color: registerCubit.intialStep >= 1
                                    ? AppColors.colorMaster
                                    : AppColors.colorMediumGrayBorder,
                              ),
                              Container(
                                height: 1.h,
                                width: 60,
                                color: AppColors.colorMediumGrayBorder,
                              ),
                              Icon(
                                registerCubit.intialStep == 2
                                    ? Icons.circle_outlined
                                    : Icons.circle_sharp,
                                color: registerCubit.intialStep == 2
                                    ? AppColors.colorMaster
                                    : AppColors.colorMediumGrayBorder,
                              ),
                            ],
                          ),
                          Text(
                            registerCubit.textStepList[0].tr(),
                            textAlign: TextAlign.start,
                            style: TextStyles.font16BlackBold,
                          ),
                          if (registerCubit.intialStep == 0)
                            showSelectType(context, registerCubit),
                          if (registerCubit.intialStep == 1)
                            showSelectCity(
                              context,
                            ),
                          if (registerCubit.intialStep == 2)
                            showSelectSlider(
                              context,
                            ),
                          SizedBox.shrink(),
                          MasterButton(
                            onPressed: () {
                              if(registerCubit.intialStep==2){
                                registerCubit.updateUserStatus();
                              }else {
                                registerCubit.selectStep();
                              }

                            },
                            text: "Next".tr(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget showSelectType(context, registerCubit) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        spacing: 50.w,
        children: [
          Expanded(
            child: InkWell(
                onTap: () {
                  registerCubit.selectProperty(0);
                },
                child: Container(
                  padding: EdgeInsets.only(top: 20.h, bottom: 10.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(radiusCircular(14.r)),
                      color: AppColors.colorMediumGrayBg,
                      border: Border.all(
                        color: AppColors.colorMediumGrayBorder,
                      )),
                  child: Column(
                    spacing: 20.h,
                    children: [
                      Text(registerCubit.propertyList[0].title.toString(),
                          style: TextStyles.font24BlackMedium),
                      if (registerCubit.propertyList[0].select!)
                        Icon(
                          Icons.radio_button_on_outlined,
                          color: AppColors.colorMaster,
                        ),
                      if (!registerCubit.propertyList[0].select!)
                        Icon(
                          Icons.circle_outlined,
                          color: AppColors.colorMediumGrayText,
                        ),
                    ],
                  ),
                )),
          ),
          Expanded(
            child: InkWell(
                onTap: () {
                  registerCubit.selectProperty(1);
                },
                child: Container(
                  padding: EdgeInsets.only(top: 20.h, bottom: 10.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(radiusCircular(14.r)),
                      color: AppColors.colorMediumGrayBg,
                      border: Border.all(
                        color: AppColors.colorMediumGrayBorder,
                      )),
                  child: Column(
                    spacing: 20.h,
                    children: [
                      Text(registerCubit.propertyList[1].title.toString(),
                          style: TextStyles.font24BlackMedium),
                      if (registerCubit.propertyList[1].select!)
                        Icon(
                          Icons.radio_button_on_outlined,
                          color: AppColors.colorMaster,
                        ),
                      if (!registerCubit.propertyList[1].select!)
                        Icon(
                          Icons.circle_outlined,
                          color: AppColors.colorMediumGrayText,
                        ),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }

  Widget showSelectCity(
    context,
  ) {
    return AuthTextFormField(
        hintText: "City, community or tower..",
        onTap: () {
          print('zayan');
          showModalBottomSheet(
            backgroundColor: AppColors.colorWhite,
            enableDrag: true,
            //barrierColor: AppColors.colorMaster,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.r)),
            context: context,
            builder: (context) {
              RegisterCubit registerCubit = RegisterCubit.get(context);
              return BlocBuilder<RegisterCubit, RegisterState>(
                builder: (context, state) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.w, vertical: 5.h),
                    child: Column(
                      spacing: 40.h,
                      children: [
                        Container(
                          height: 4.h,
                          width: 144.w,
                          color: AppColors.colorMediumGrayText,
                        ),
                        AuthTextFormField(
                            controller: registerCubit.searchCityController,
                            hintText: "City, community or tower..",
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(15.h),
                              child: SvgPicture.asset(AppImage.search2),
                            ),
                            onChanged: (value) {
                              registerCubit.searchCity();
                            },
                            suffixIcon: SizedBox.shrink(),
                            obscureText: false),
                        Expanded(
                          child: ListView.separated(
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.h, horizontal: 10.w),
                                  child: Row(
                                    children: [
                                      Text(
                                          registerCubit
                                              .searchCityList[index].name
                                              .toString(),
                                          style: TextStyles.fontPrivacyPolicy),
                                      Spacer(),
                                      InkWell(
                                        onTap: () {
                                          registerCubit.selectCity(
                                            registerCubit
                                                .searchCityList[index].name,
                                          );
                                        },
                                        child: Icon(
                                          registerCubit.citySelect.contains(
                                                  registerCubit
                                                      .searchCityList[index]
                                                      .name)
                                              ? Icons.check_box_rounded
                                              : Icons.check_box_outline_blank,
                                          color: registerCubit.citySelect
                                                  .contains(registerCubit
                                                      .searchCityList[index]
                                                      .name)
                                              ? null
                                              : AppColors.colorMediumGray,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return Container(
                                  height: 2.h,
                                  color: AppColors.colorMediumGrayBorder,
                                );
                              },
                              itemCount: registerCubit.searchCityList.length),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
        controller: RegisterCubit.get(context).showCityController,
        prefixIcon: Padding(
          padding: EdgeInsets.all(15.h),
          child: SvgPicture.asset(AppImage.search2),
        ),
        suffixIcon: SizedBox.shrink(),
        readOnly: true,
        obscureText: false);
  }

  Widget showSelectSlider(
    context,
  ) {
    RegisterCubit registerCubit = RegisterCubit.get(context);
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              spacing: 10.w,
              children: [
                Expanded(
                  child: AuthTextFormField(
                      controller: registerCubit.minController,
                      hintText: "No min".tr(),
                      readOnly: true,
                      suffixIcon: SizedBox.shrink(),
                      obscureText: false),
                ),
                Image.asset(AppImage.prosAndCons),
                Expanded(
                  child: AuthTextFormField(
                      controller: registerCubit.mixController,
                      hintText: "No min".tr(),
                      readOnly: true,
                      suffixIcon: SizedBox.shrink(),
                      obscureText: false),
                ),
              ],
            ),
            SliderTheme(
              data: SliderThemeData(
                rangeThumbShape: const RoundRangeSliderThumbShape(
                  enabledThumbRadius: 8,
                ),
                activeTrackColor: AppColors.colorMaster,
                inactiveTrackColor: Colors.grey[300],
                trackHeight: 2,
                thumbColor: AppColors.colorWhite,
                overlayColor: Colors.black.withOpacity(0.1),
                valueIndicatorColor: AppColors.colorMaster,
                activeTickMarkColor: AppColors.colorMaster,
                inactiveTickMarkColor: Colors.grey[300],
              ),
              child: RangeSlider(
                values: registerCubit.rangeValues,
                min: 0,
                max: registerCubit.configurationPriceModel.maxPrice!.toDouble(),
                onChanged: (RangeValues values) {
                  registerCubit.selectRangeValues(values);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
