import 'package:bayt_finder/extensions/common.dart';
import 'package:bayt_finder/screens/language/widgit/custom_flush_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/buttons/master_button.dart';
import '../../local_storage/shared_preferences_manager.dart';
import '../../nav.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/decorations.dart';
import '../../utils/images.dart';
import '../../utils/styles.dart';
import '../layout/layout_screen.dart';
import 'cubit/language_cubit.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.colorMaster,
        body: BlocBuilder<LanguageCubit, LanguageState>(
          builder: (context, state) {
            final cubit = LanguageCubit.get(context);
            return Column(
              children: [
                SizedBox(
                  height: 140.h,
                ),
                Image.asset(AppImage.splash,width: 200.w,height: 150.h,),
                Spacer(),
                Container(
                  width: double.infinity,
                  decoration: AppBoxDecoration.decorationWhiteRadius20Top,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 21.w, right: 21.w, top: 33.r),
                    child: Column(
                      spacing: 25.h,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Please select language",
                              style: TextStyles.font18BlackRegular,
                            ),
                            Text(
                              "من فضلك اختار اللغة",
                              style: TextStyles.font18BlackRegular,
                            ),
                          ],
                        ),
                        CustomFlushBar(
                          image: AppImage.iraqFlag,
                          text: 'اللغة العربية',
                          onTap: () {
                            cubit.selectLanguage("ar");
                          },
                          isPressed: cubit.selectedLanguage == "ar",
                        ),
                        CustomFlushBar(
                          image:AppImage.usFlag,
                          text: 'English',
                          onTap: () {
                            cubit.selectLanguage("en");
                          },
                          isPressed: cubit.selectedLanguage == "en",
                        ),
                        SizedBox.shrink(),
                        MasterButton(
                          onPressed: () async {
                            if (cubit.selectedLanguage == '') {
                              toast('Choose your language'.tr());

                            } else {
                              ///supportedLocales ==0 >>>en
                              ///supportedLocales ==1 >>>ar
                              switch (cubit.selectedLanguage) {
                                case 'en':
                                  await context.setLocale(
                                      EasyLocalization.of(context)!
                                          .supportedLocales[0]);
                                  await SharedPreferencesManager.saveData(
                                      AppConstants.local,  "en");
                                  navigateFinish( LayoutScreen());
                                  //navigateFinish( UpdateStataScreen());
                              // navigateFinish( WalkThroughScreen());
                                case 'ar':
                                  await context.setLocale(
                                      EasyLocalization.of(context)!
                                          .supportedLocales[1]);
                                  await SharedPreferencesManager.saveData(
                                      AppConstants.local,  "ar");
                                  navigateFinish( LayoutScreen());

                              // navigateFinish( UpdateStataScreen());

                              //   navigateFinish( WalkThroughScreen());
                              }
                            }
                          },
                          text: 'Next',
                        ),
                        Column(
                          children: [
                            Text(
                              "يمكنك تغيير اللغة لاحقا من الاعدادات",
                              style: TextStyles.font15BlackRegular,
                            ),
                            Text(
                              "You can change language later from settings",
                              style: TextStyles.font15BlackRegular,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 60.h,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ));
  }
}
