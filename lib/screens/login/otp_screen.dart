import 'package:bayt_finder/components/buttons/master_button.dart';
import 'package:bayt_finder/nav.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/appbar/custom_appbar.dart';
import '../../local_storage/shared_preferences_manager.dart';
import '../../utils/styles.dart';
import '../layout/cubit/layout_cubit.dart';
import '../layout/layout_screen.dart';
import 'cubit/login_cubit.dart';
import '../sign_up/signup_screen.dart';
import '../../utils/images.dart';
import '../../extensions/common.dart';
import '../../main.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginCubit loginCubit = LoginCubit.get(context);
    loginCubit.otpController=TextEditingController();
    loginCubit.startResendTimer();
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            Brightness.light,
        systemNavigationBarIconBrightness:
            Brightness.light,
      ),
      child: WillPopScope(
        onWillPop: () async {
          navigateBack(context);
          return true;
        },
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) async {
            if (state is LoginSuccessState) {
              if (loginCubit.isUserExist) {
                loginCubit.stopTimer();
                await SharedPreferencesManager.saveData(AppConstants.token, loginCubit.loginModel.data!.apiToken!);
                await SharedPreferencesManager.saveData(AppConstants.isLogin, true);
                await SharedPreferencesManager.saveData(AppConstants.userId, loginCubit.loginModel.data!.id!);
                isLogin=true;
                // appStore.setToken(loginCubit.loginModel.data!.apiToken!);
                loginCubit.clearData();
                LayoutCubit.get(context).changeIndex(0);
                navigateFinish( LayoutScreen());


             /*   await getUSerDetail(context, loginCubit.loginModel.data!.id!).whenComplete(() {

                });*/
              } else {
                loginCubit.stopTimer();
                navigateFinish( SignUpScreen(phoneNumber: loginCubit.mobileNumberController.text, countryCode: loginCubit.phoneNumber.dialCode.toString(),));
                loginCubit.clearData();
                 }
            }
          },
          builder: (context, state) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor:AppColors.colorWhite,
              appBar: CustomAppBar(
                title: "OTP".tr(),
              ),
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 60.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  spacing: 20.h,
                  children: [
                    SizedBox.shrink(),
                    Image.asset(
                      AppImage.otp,
                      fit: BoxFit.fill,
                      height: 186.h,
                      width: 186.w,
                    ),
                    Text(
                      'We’ve sent you a confirmation code to'.tr(),
                      style: TextStyles.font16MediumGrayTextMedium,
                    ),
                    Text(
                      loginCubit.phoneNumber.phoneNumber.toString(),
                      style: TextStyles.font16BlackBold,
                    ),
                    Form(
                      key: loginCubit.otpFormKey,
                      child: PinCodeTextField(
                        appContext: context,
                        textStyle: TextStyles.font28WhiteMedium,
                        animationType: AnimationType.fade,
                        length: 6,
                        controller: loginCubit.otpController,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.number,
                        enableActiveFill: true,
                        validator: (String? value) {
                          if (value == null) {
                            return 'Required'.tr();
                          }
                          if (value.isEmpty) {
                            return 'Required'.tr();
                          }

                          return null;
                        },
                        pinTheme: PinTheme(
                          selectedBorderWidth: 0.0,
                          inactiveColor:
                              AppColors.colorMediumGrayTextForm,
                          inactiveFillColor:
                              AppColors.colorMediumGrayTextForm,
                          activeColor: AppColors.colorMaster,
                          activeFillColor: AppColors.colorMaster,
                          disabledColor: AppColors.colorMaster,
                          selectedFillColor:
                              AppColors.colorMediumGrayTextForm,
                          selectedColor:
                              AppColors.colorMediumGrayTextForm,
                          borderWidth: 0.0,
                          inactiveBorderWidth: .5.sp,
                          activeBorderWidth: .5.sp,
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(14.r),
                          fieldHeight: 50.h,
                          fieldWidth: 50.w,
                        ),
                      ),
                    ),
                    Text(
                      loginCubit.formatTime(),
                      style: TextStyles.font20BlackBold,
                    ),
                    MasterButton(
                      onPressed: () {
                        if (loginCubit.otpFormKey.currentState!.validate()) {
                          loginCubit.otpFormKey.currentState!.save();
                          hideKeyboard(context);
                          loginCubit.login();
                        }
                      },
                      text: "Submit".tr(),
                    ),
                    InkWell(
                      onTap: () {
                        if (loginCubit.isResendEnabled) {
                          hideKeyboard(context);
                          /* loginCubit.sendMobileOtp(phone: widget.number, countryCode: widget.dialCode);
                     */
                        }
                      },
                      child: Text(
                        "Resend code".tr(),
                        style: TextStyles.font16BlackBold.copyWith( decoration: TextDecoration.underline,),
                      ),
                    ),
                    SizedBox(height:40.h ,),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
