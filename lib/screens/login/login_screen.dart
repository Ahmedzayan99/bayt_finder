import 'package:bayt_finder/components/buttons/master_button.dart';
import 'package:bayt_finder/nav.dart';
import 'package:bayt_finder/screens/login/otp_screen.dart';
import 'package:bayt_finder/screens/terms_and_privacy_policy/terms_conditions_screen.dart';
import 'package:bayt_finder/utils/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/appbar/custom_appbar.dart';
import '../../components/auth_text_form_field/phone_number_text_field.dart';
import '../../extensions/common.dart';

import '../../utils/images.dart';
import '../../utils/styles.dart';
import '../terms_and_privacy_policy/privacy_policy_screen.dart';
import 'cubit/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    LoginCubit loginCubit = LoginCubit.get(context);
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            Brightness.dark,
        systemNavigationBarIconBrightness:
            Brightness.dark,
      ),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor:AppColors.colorWhite,
            appBar: CustomAppBar(
              title: "Sign in".tr(),
              showBack: true,
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Form(
                key: loginCubit.loginFormKey,
                child: Column(
                  spacing: 20.h,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height:5.h ,),
                    Image.asset(AppImage.login,
                      fit: BoxFit.fill,
                      height: 240.h,
                      width: 180.w,
                    ),
                    Text(
                        'We’ll send you a verifications code to your mobile number.'
                            .tr(),
                        textAlign: TextAlign.center,
                        style: TextStyles.font16BlackMedium),
                    CustomInternationalPhoneNumberInput(
                      onInputValidated: (value) {},
                      focusNode:loginCubit.mobileFocus ,
                      onInputChanged: (value) {
                        loginCubit.phoneNumber = value;
                      },
                      isSpace: true,
                      initialValue: loginCubit.phoneNumber,
                      keyboardType: TextInputType.visiblePassword,
                      isEnabled: false,
                      suffixIcon: Padding(
                        padding: EdgeInsetsDirectional.only(
                            bottom: 12.h, top: 12.h, end: 12.w),
                        child: Image.asset(
                          AppImage.icCallOutline,
                          width: 24.w,
                          height: 24.h,
                        ),
                      ),
                      fillColor: AppColors.colorMediumGrayTextForm,
                      textFieldController: loginCubit.mobileNumberController,
                    ),
                    SizedBox(height:20.h ,),
                    MasterButton(
                      text: 'Send Code'.tr(),
                      onPressed: () async {
                        if (loginCubit.loginFormKey.currentState!.validate()) {
                          loginCubit.loginFormKey.currentState!.save();
                          hideKeyboard(context);
                          navigateTo( OTPScreen());
                          /*         await loginWithOTP(
                                context, loginCubit.phoneNumber.phoneNumber.toString(), loginCubit.mMobileNumberCont.text.trim(), true, () {})
                                .then((value) {})
                                .catchError((e) async {
                              toast(e.toString());
                             // await appStore.setLoading(false);
                           //   setState(() {});
                            });*/
                        }

                      },),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.symmetric(
                            horizontal: 20.w),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "By continue you agree to our".tr(),
                                style: TextStyles.font16BlackMedium,
                              ),
                              TextSpan(
                                  text: "Terms & Conditions".tr(),
                                  style: TextStyles.fontPrivacyPolicy,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap=(){
                                    navigateTo( TermsConditionsScreen());
                                    }),
                              TextSpan(
                                  text: " & ",
                                  style: TextStyles.fontPrivacyPolicy),
                              TextSpan(
                                  text: "Privacy policy".tr(),
                                  style: TextStyles.fontPrivacyPolicy,
                                  recognizer: TapGestureRecognizer() ..onTap=(){
                                    print('zayan');
                                    navigateTo( PrivacyPolicyScreen());
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
