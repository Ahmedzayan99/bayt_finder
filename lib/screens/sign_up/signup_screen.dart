import 'package:bayt_finder/components/buttons/master_button.dart';
import 'package:bayt_finder/screens/sign_up/cubit/register_cubit.dart';
import 'package:bayt_finder/screens/sign_up/ubdet_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../extensions/extension_util/string_extensions.dart';
import '../../../extensions/common.dart';
import '../../../extensions/extension_util/int_extensions.dart';
import '../../../extensions/extension_util/widget_extensions.dart';
import '../../../extensions/text_styles.dart';
import '../../../main.dart';
import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../../utils/images.dart';
import '../../components/appbar/custom_appbar.dart';
import '../../components/auth_text_form_field/auth_text_form_field.dart';
import '../../local_storage/shared_preferences_manager.dart';
import '../../nav.dart';
import '../layout/layout_screen.dart';
import '../login/login_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key, required this.phoneNumber});

  final String? phoneNumber;

  @override
  Widget build(BuildContext context) {
    RegisterCubit registerCubit = RegisterCubit.get(context);
    registerCubit.phoneController.text = phoneNumber!;
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            appStore.isDarkModeOn ? Brightness.light : Brightness.light,
        systemNavigationBarIconBrightness:
            appStore.isDarkModeOn ? Brightness.light : Brightness.light,
      ),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) async {
          if(state is RegisterUserSuccessState){
            appStore.setToken(registerCubit.registerModel.data!.apiToken.validate());
            navigateFinish(context, UpdateStata());
           // navigateFinish(context, LayoutScreen());
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor:AppColors.colorWhite,
            appBar: CustomAppBar(
                title: "Sign Up",
                typeAppBar: TypeAppBar.textOnly,
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Form(
                key: registerCubit.signUpFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  spacing: 15.h,
                  children: [
                    SizedBox(height: 10.h,),
                    Expanded(
                      child: Image.asset(
                        AppImage.login,
                        fit: BoxFit.fill,
                      ),
                    ),
                    AuthTextFormField(
                      focusNode: registerCubit.firstNameFocus,
                        hintText: 'First Name'.tr(),
                        prefixIcon: Padding(
                          padding: EdgeInsetsDirectional.only(
                              bottom: 14.h, top: 14.h, start: 17.w, end: 10.w),
                          child: Image.asset(
                            AppImage.icProfile,
                            width: 28.w,
                            height: 28.h,
                          ),
                        ),
                        suffixIcon: SizedBox.shrink(),
                        textInputType: TextInputType.text,
                        validator: (name) {
                          if (name ==null) {
                            return "Required".tr();
                          }
                          if (name.isEmpty) {
                            return "Required".tr();
                          }
                          // ٠، ١، ٢، ٣، ٤، ، ٦، ٧، ٨، ٩
                          if (name.length < 2) {
                            return "should be at least 2 alphabetic characters".tr();
                          }
                          if (name.contains(RegExp(r'[0-9]')) ||
                              name.contains("٠") ||
                              name.contains("١") ||
                              name.contains("٢") ||
                              name.contains("٣") ||
                              name.contains("٤") ||
                              name.contains("٥") ||
                              name.contains("٦") ||
                              name.contains("٧") ||
                              name.contains("٨") ||
                              name.contains("٩")) {
                            return "should be alphabetic characters".tr();
                          }
                          if (name.length > 44) {
                            return "the number of characters must be less than 44".tr();
                          }
                          Pattern pattern4 = r'[!@#$%^&*(),.?":{}|<>]';
                          RegExp regex4 = RegExp(pattern4.toString());
                          if (regex4.hasMatch(name)) {
                            return "please don't enter special characters".tr();
                          }
                          return null;
                        },
                        controller: registerCubit.firstNameController,
                        obscureText: false),
                    AuthTextFormField(
                        focusNode:registerCubit.lastNameFocus,
                        hintText: 'Last Name'.tr(),
                        prefixIcon: Padding(
                          padding: EdgeInsetsDirectional.only(
                              bottom: 14.h, top: 14.h, start: 17.w, end: 10.w),
                          child: Image.asset(
                            AppImage.icProfile,
                            width: 28.w,
                            height: 28.h,
                          ),
                        ),
                        suffixIcon: SizedBox.shrink(),
                        textInputType: TextInputType.text,
                        validator: (name) {
                          if (name ==null) {
                            return "Required".tr();
                          }
                          if (name.isEmpty) {
                            return "Required".tr();
                          }
                          // ٠، ١، ٢، ٣، ٤، ، ٦، ٧، ٨، ٩
                          if (name.length < 2) {
                            return "should be at least 2 alphabetic characters".tr();
                          }
                          if (name.contains(RegExp(r'[0-9]')) ||
                              name.contains("٠") ||
                              name.contains("١") ||
                              name.contains("٢") ||
                              name.contains("٣") ||
                              name.contains("٤") ||
                              name.contains("٥") ||
                              name.contains("٦") ||
                              name.contains("٧") ||
                              name.contains("٨") ||
                              name.contains("٩")) {
                            return "should be alphabetic characters".tr();
                          }
                          if (name.length > 44) {
                            return "the number of characters must be less than 44".tr();
                          }
                          Pattern pattern4 = r'[!@#$%^&*(),.?":{}|<>]';
                          RegExp regex4 = RegExp(pattern4.toString());
                          if (regex4.hasMatch(name)) {
                            return "please don't enter special characters".tr();
                          }
                          return null;
                        },
                        controller: registerCubit.lastNameController,
                        obscureText: false),
                    AuthTextFormField(
                        focusNode:registerCubit.emailFocus,
                        hintText: 'Email'.tr(),
                        prefixIcon: Padding(
                          padding: EdgeInsetsDirectional.only(
                              bottom: 14.h,
                              top: 14.h,
                              start: 17.w,
                              end: 10.w),
                          child: Image.asset(
                            AppImage.icMail,
                            width: 28.w,
                            height: 28.h,
                          ),
                        ),
                        suffixIcon: SizedBox.shrink(),
                        textInputType: TextInputType.emailAddress,
                        validator: (mail) {
                          if (mail == null) {
                            return "Required";
                          }
                          if (mail.isEmpty) {
                            return "Required";
                          }
                          Pattern pattern =
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          RegExp regex = RegExp(pattern.toString());
                          if (!regex.hasMatch(mail)) {
                            return "Please enter valid mail".tr();
                          }
                          return null;
                        },
                        controller: registerCubit.emailController,
                        obscureText: false),
                    AuthTextFormField(
                        hintText: 'phone'.tr(),
                        readOnly:true,
                        prefixIcon: Padding(
                          padding: EdgeInsetsDirectional.only(
                              bottom: 14.h,
                              top: 14.h,
                              start: 17.w,
                              end: 10.w),
                          child: Image.asset(
                            AppImage.icCallOutline,
                            width: 28.w,
                            height: 28.h,
                          ),
                        ),
                        suffixIcon: SizedBox.shrink(),
                        textInputType: TextInputType.name,
                        controller: registerCubit.phoneController,
                        obscureText: false),
                    SizedBox(height: 20.h,),
                    MasterButton(
                      onPressed: () {
                        if(registerCubit.signUpFormKey.currentState!.validate()){
                          hideKeyboard(context);
                          registerCubit.registerUser();
                        }
                    },
                      text: "sign Up",
                    ),
                   Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already Have Account",
                            style:
                                primaryTextStyle(color: darkGrayTextColor)),
                        5.width,
                        Ink(
                          child: Text("sign In",
                                  style: boldTextStyle(
                                      color: primaryColor, size: 16))
                              .onTap(() {
                            LoginScreen().launch(context);
                          }),
                        )
                      ],
                    ),
                    SizedBox(height: 40.h,),
                  ],
                )
              ),
            ),
          );
        },
      ),
    );
  }
}
