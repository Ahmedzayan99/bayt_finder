import 'package:bayt_finder/components/buttons/master_button.dart';
import 'package:bayt_finder/screens/sign_up/cubit/register_cubit.dart';
import 'package:bayt_finder/screens/sign_up/ubdet_state_screen.dart';
import 'package:bayt_finder/utils/decorations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../../../extensions/text_styles.dart';
import '../../../main.dart';
import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../../utils/images.dart';
import '../../components/appbar/custom_appbar.dart';
import '../../components/auth_text_form_field/auth_text_form_field.dart';
import '../../components/auth_text_form_field/phone_number_text_field.dart';
import '../../local_storage/shared_preferences_manager.dart';
import '../../nav.dart';
import '../../utils/custom_bottom_sheet.dart';
import '../../utils/pick_image_bottom_sheet.dart';
import '../../utils/styles.dart';
import '../login/login_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen(
      {super.key, required this.phoneNumber, required this.countryCode});

  final String? phoneNumber;
  final String countryCode;

  @override
  Widget build(BuildContext context) {
    RegisterCubit registerCubit = RegisterCubit.get(context);
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            Brightness.light,
        systemNavigationBarIconBrightness:
            Brightness.light,
      ),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) async {
          if (state is RegisterIndividualSuccessState ||
              state is RegisterCompanySuccessState) {
            await SharedPreferencesManager.saveData(AppConstants.token,
                registerCubit.registerModel.data!.apiToken!);
            await SharedPreferencesManager.saveData(AppConstants.isLogin, true);
            await SharedPreferencesManager.saveData(AppConstants.userId,
                registerCubit.registerModel.data!.id!);
            isLogin = true;
            navigateFinish( UpdateStataScreen());
            registerCubit.clearDataCompany();
            registerCubit.clearDataCompany();
            // navigateFinish( LayoutScreen());
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.colorWhite,
            appBar: CustomAppBar(
              title: "Register".tr(),
            ),
            body: Padding(
              padding: EdgeInsets.only(top: 37.h, right: 15.w, left: 15.w),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(8.sp),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.h),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 15.h,
                      children: [
                        ProfileTabSelector(),
                        registerCubit.selectedUserType == UserType.company
                            ? CompanyProfileForm(
                                phoneNumber: phoneNumber.toString(),
                                countryCode: countryCode,
                              )
                            : IndividualForm(
                                phoneNumber: phoneNumber.toString(),
                                countryCode: countryCode,
                              ),
                        SizedBox.shrink()
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProfileTabSelector extends StatelessWidget {
  const ProfileTabSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    RegisterCubit registerCubit = RegisterCubit.get(context);

    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return Container(
          height: 53.sp,
          decoration: BoxDecoration(
            color: AppColors.lightGrey,
            borderRadius: BorderRadius.circular(8.sp),
          ),
          child: Row(
            children: [
              _buildTab(
                context,
                "User".tr(),
                registerCubit.selectedUserType == UserType.individual,
                () {
                  if (state is! RegisterCompanyLoadingState &&
                      state is! RegisterIndividualLoadingState) {
                    if (registerCubit.selectedUserType != UserType.individual) {
                      registerCubit.setUserType(UserType.individual);
                      registerCubit.clearDataCompany();
                    }
                  }
                },
              ),
              _buildTab(
                context,
                "Agent".tr(),
                registerCubit.selectedUserType == UserType.company,
                () {
                  if (state is! RegisterCompanyLoadingState &&
                      state is! RegisterIndividualLoadingState) {
                    if (registerCubit.selectedUserType != UserType.company) {
                      registerCubit.setUserType(UserType.company);
                      registerCubit.clearDataIndividual();
                    }
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTab(
      BuildContext context, String title, bool isActive, VoidCallback onTap) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          decoration: AppBoxDecoration.tabDecoration(isActive),
          child: Text(
            title,
            style: TextStyles.font20WhiteRegular.copyWith(
              color: isActive ? AppColors.white : AppColors.colorExtraGray,
            ),
          ),
        ),
      ),
    );
  }
}

// Company profile form
class CompanyProfileForm extends StatelessWidget {
  const CompanyProfileForm(
      {super.key, required this.phoneNumber, required this.countryCode});

  final String phoneNumber;
  final String countryCode;

  @override
  Widget build(BuildContext context) {
    RegisterCubit registerCubit = RegisterCubit.get(context);
    registerCubit.companyPhoneController.text = phoneNumber;
    registerCubit.companyPhoneNumber = PhoneNumber(isoCode: "IQ", phoneNumber: phoneNumber, dialCode: countryCode);
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return Form(
          key: registerCubit.companyFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 7.h,
            children: [
              SizedBox.shrink(),
              Center(
                child: Column(
                  children: [
                    registerCubit.companyImage != null
                        ? Container(
                            width: 100.sp,
                            height: 100.sp,
                            decoration: BoxDecoration(
                              color: AppColors.black,
                              shape: BoxShape.circle,
                            ),
                            child: ClipOval(
                              child: Image.file(
                                registerCubit.companyImage!,
                                fit: BoxFit.fill,
                              ),
                            ),
                          )
                        : SvgPicture.asset(
                            AppImage.uploadPicture,
                          ),
                    SizedBox(height: 8.sp),
                    InkWell(
                      onTap: () {
                        if (state is! RegisterCompanyLoadingState) {
                          NewCustomBottomSheet.showModalBottom(context,
                              initialChildSize: 0.32,
                              child: PickImageModalBottomSheet(
                                onPressedPhotos: () async {
                                  registerCubit.companyImage =
                                      await registerCubit.pickImage(
                                    imageSource: ImageSource.gallery,
                                  );
                                  Navigator.of(context).pop();
                                },
                                onPressedCamera: () async {
                                  registerCubit.companyImage =
                                      await registerCubit.pickImage(
                                    imageSource: ImageSource.camera,
                                  );
                                  Navigator.of(context).pop();
                                },
                              ),
                            );
                        }
                      },
                      child: Text("Upload picture".tr(),
                          style: TextStyles.font16MasterBoldUnderline),
                    ),
                  ],
                ),
              ),
              SizedBox.shrink(),
              AuthTextFormField(
                controller: registerCubit.companyNameController,
                hintText: "Company Name".tr(),
                validator: (name) {
                  if (name == null) {
                    return "Required".tr();
                  }
                  if (name.isEmpty) {
                    return "Required".tr();
                  }
                  // ٠، ١، ٢، ٣، ٤، ، ٦، ٧، ٨، ٩
                  // if (name.length < 5) {
                  //   return "should be at least 5 alphabetic characters".tr();
                  // }
           /*       if (name.contains(RegExp(r'[0-9]')) ||
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
                  }*/
                  Pattern pattern4 = r'[!@#$%^&*(),.?":{}|<>]';
                  RegExp regex4 = RegExp(pattern4.toString());
                  if (regex4.hasMatch(name)) {
                    return "please don't enter special characters".tr();
                  }
                  return null;
                },
                textInputType: TextInputType.name,
                readOnly: state is RegisterCompanyLoadingState,
              ),
              Row(
                children: [
                  Expanded(
                    child: AuthTextFormField(
                      textInputType: TextInputType.name,
                      controller: registerCubit.companyFirstNameController,
                      hintText: "First Name".tr(),
                      validator: (name) {
                        if (name == null) {
                          return "Required".tr();
                        }
                        if (name.isEmpty) {
                          return "Required".tr();
                        }
                        // ٠، ١، ٢، ٣، ٤، ، ٦، ٧، ٨، ٩
                        if (name.length < 2) {
                          return "should be at least 2 alphabetic characters"
                              .tr();
                        }
                  /*      if (name.contains(RegExp(r'[0-9]')) ||
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
                        }*/
                        Pattern pattern4 = r'[!@#$%^&*(),.?":{}|<>]';
                        RegExp regex4 = RegExp(pattern4.toString());
                        if (regex4.hasMatch(name)) {
                          return "please don't enter special characters".tr();
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 16.sp),
                  Expanded(
                    child: AuthTextFormField(
                      textInputType: TextInputType.name,
                      controller: registerCubit.companyLastNameController,
                      hintText: "Last Name".tr(),
                      validator: (name) {
                        if (name == null) {
                          return "Required".tr();
                        }
                        if (name.isEmpty) {
                          return "Required".tr();
                        }
                        // ٠، ١، ٢، ٣، ٤، ، ٦، ٧، ٨، ٩
                        if (name.length < 2) {
                          return "should be at least 2 alphabetic characters"
                              .tr();
                        }
                        // if (name.contains(RegExp(r'[0-9]')) ||
                        //     name.contains("٠") ||
                        //     name.contains("١") ||
                        //     name.contains("٢") ||
                        //     name.contains("٣") ||
                        //     name.contains("٤") ||
                        //     name.contains("٥") ||
                        //     name.contains("٦") ||
                        //     name.contains("٧") ||
                        //     name.contains("٨") ||
                        //     name.contains("٩")) {
                        //   return "should be alphabetic characters".tr();
                        // }
                        Pattern pattern4 = r'[!@#$%^&*(),.?":{}|<>]';
                        RegExp regex4 = RegExp(pattern4.toString());
                        if (regex4.hasMatch(name)) {
                          return "please don't enter special characters".tr();
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              AuthTextFormField(
                controller: registerCubit.companyEmailController,
                hintText: "Email".tr(),
                textInputType: TextInputType.emailAddress,
                validator: (mail) {
                  if (mail == null) {
                    return "Required".tr();
                  }
                  if (mail.isEmpty) {
                    return "Required".tr();
                  }
                  Pattern pattern =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regex = RegExp(pattern.toString());
                  if (!regex.hasMatch(mail)) {
                    return "Please enter valid mail".tr();
                  }
                  return null;
                },
                readOnly: state is RegisterCompanyLoadingState,
              ),
              Row(
                spacing: 15.w,
                children: [
                  Expanded(
                    child: CustomInternationalPhoneNumberInput(
                      onInputValidated: (value) {},
                      onInputChanged: (value) {
                        registerCubit.companyPhoneNumber = value;
                      },
                      isSpace: false,
                      readOnly: true,
                      initialValue: registerCubit.companyPhoneNumber,
                      isEnabled: false,
                      textFieldController: registerCubit.companyPhoneController,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (!registerCubit.isBackupPhone) {
                        if (state is! RegisterCompanyLoadingState) {
                          registerCubit.setBackupPhone(true);
                        }
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(10.sp),
                      decoration: BoxDecoration(
                        color: AppColors.colorWhite,
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: AppColors.colorBlack),
                      ),
                      child: Icon(Icons.add),
                    ),
                  ),
                ],
              ),
              if (registerCubit.isBackupPhone)
                Row(
                  spacing: 15.w,
                  children: [
                    Expanded(
                      child: CustomInternationalPhoneNumberInput(
                        onInputValidated: (value) {},
                        onInputChanged: (value) {
                          registerCubit.companyBackupNumber = value;
                        },
                        isSpace: false,
                        readOnly: state is RegisterCompanyLoadingState,
                        initialValue: registerCubit.companyBackupNumber,
                        isEnabled: false,
                        textFieldController:
                            registerCubit.companyBackupPhoneController,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (state is! RegisterCompanyLoadingState) {
                          registerCubit.setBackupPhone(false);
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(10.sp),
                        decoration: BoxDecoration(
                          color: AppColors.colorWhite,
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(color: AppColors.colorBlack),
                        ),
                        child: Icon(Icons.remove),
                      ),
                    ),
                  ],
                ),
              CustomInternationalPhoneNumberInput(
                  onInputValidated: (value) {},
                  hintText: "Whatsapp Number".tr(),
                  onInputChanged: (value) {
                    registerCubit.companyWhatsappNumber = value;
                  },
                  isSpace: false,
                  initialValue: registerCubit.companyWhatsappNumber,
                  isEnabled: false,
                  textFieldController: registerCubit.companyWhatsappController,
                  readOnly: state is RegisterCompanyLoadingState,
                  suffixIcon: Padding(
                    padding: EdgeInsets.all(8.sp),
                    child: SvgPicture.asset(AppImage.whatsapp),
                  )),
              AuthTextFormField(
                controller: registerCubit.companyDescriptionController,
                hintText: "Description".tr(),
                maxLines: 4,
                readOnly: state is RegisterCompanyLoadingState,
              ),
              SizedBox.shrink(),
              MasterButton(
                //isLoading: state is RegisterCompanyLoadingState,
                onPressed: () {
                  if (registerCubit.companyFormKey.currentState!.validate()) {
                    registerCubit.registerCompany();
                  }
                },
                text: 'Done'.tr(),
              ),
              SizedBox.shrink(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already Have Account".tr(),
                      style: primaryTextStyle(color:  AppColors.colorMaster)),
                  
                  SizedBox(width: 5.h,),
                  InkWell(
                    onTap: () {
                      navigateTo(   LoginScreen());
                    },
                    child: Text("sign In".tr(),
                            style: boldTextStyle(color: AppColors.colorMaster, size: 16))

                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

// User profile form
class IndividualForm extends StatelessWidget {
  const IndividualForm(
      {super.key, required this.phoneNumber, required this.countryCode});

  final String phoneNumber;
  final String countryCode;

  @override
  Widget build(BuildContext context) {
    RegisterCubit registerCubit = RegisterCubit.get(context);
    registerCubit.individualPhoneController.text = phoneNumber;
    registerCubit.individualPhoneNumber = PhoneNumber(
        isoCode: "IQ", phoneNumber: phoneNumber, dialCode: countryCode);
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Form(
          key: registerCubit.individualFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 7.h,
            children: [
              SizedBox.shrink(),
              Center(
                child: Column(
                  children: [
                    Center(
                      child: registerCubit.individualImage != null
                          ? Container(
                              width: 100.sp,
                              height: 100.sp,
                              decoration: BoxDecoration(
                                color: AppColors.black,
                                shape: BoxShape.circle,
                              ),
                              child: ClipOval(
                                child: Image.file(
                                  registerCubit.individualImage!,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )
                          : SvgPicture.asset(
                              AppImage.uploadPicture,
                            ),
                    ),
                    SizedBox(height: 8.sp),
                    InkWell(
                      onTap: () {
                        if (state is! RegisterIndividualLoadingState) {
                          NewCustomBottomSheet.showModalBottom(context,
                              initialChildSize: 0.32,
                              child: PickImageModalBottomSheet(
                                onPressedPhotos: () async {
                                  registerCubit.individualImage =
                                      await registerCubit.pickImage(
                                    imageSource: ImageSource.gallery,
                                  );
                                  Navigator.of(context).pop();
                                },
                                onPressedCamera: () async {
                                  registerCubit.individualImage =
                                      await registerCubit.pickImage(
                                    imageSource: ImageSource.camera,
                                  );
                                  Navigator.of(context).pop();
                                },
                              ),
                            );
                        }
                      },
                      child: Text("Upload picture".tr(),
                          style: TextStyles.font16MasterBoldUnderline),
                    ),
                  ],
                ),
              ),
              SizedBox.shrink(),
              AuthTextFormField(
                controller: registerCubit.individualUsernameController,
                hintText: "User Name".tr(),
                readOnly: state is RegisterIndividualLoadingState,
                validator: (name) {
                  if (name == null) {
                    return "Required".tr();
                  }
                  if (name.isEmpty) {
                    return "Required".tr();
                  }
                  // ٠، ١، ٢، ٣، ٤، ، ٦، ٧، ٨، ٩
                  if (name.length < 2) {
                    return "should be at least 2 alphabetic characters".tr();
                  }
                  // if (name.contains(RegExp(r'[0-9]')) ||
                  //     name.contains("٠") ||
                  //     name.contains("١") ||
                  //     name.contains("٢") ||
                  //     name.contains("٣") ||
                  //     name.contains("٤") ||
                  //     name.contains("٥") ||
                  //     name.contains("٦") ||
                  //     name.contains("٧") ||
                  //     name.contains("٨") ||
                  //     name.contains("٩")) {
                  //   return "should be alphabetic characters".tr();
                  // }
                  Pattern pattern4 = r'[!@#$%^&*(),.?":{}|<>]';
                  RegExp regex4 = RegExp(pattern4.toString());
                  if (regex4.hasMatch(name)) {
                    return "please don't enter special characters".tr();
                  }
                  return null;
                },
              ),
              AuthTextFormField(
                controller: registerCubit.individualFirstNameController,
                hintText: "First Name".tr(),
                validator: (name) {
                  if (name == null) {
                    return "Required".tr();
                  }
                  if (name.isEmpty) {
                    return "Required".tr();
                  }
                  // ٠، ١، ٢، ٣، ٤، ، ٦، ٧، ٨، ٩
                  if (name.length < 2) {
                    return "should be at least 2 alphabetic characters".tr();
                  }
                  // if (name.contains(RegExp(r'[0-9]')) ||
                  //     name.contains("٠") ||
                  //     name.contains("١") ||
                  //     name.contains("٢") ||
                  //     name.contains("٣") ||
                  //     name.contains("٤") ||
                  //     name.contains("٥") ||
                  //     name.contains("٦") ||
                  //     name.contains("٧") ||
                  //     name.contains("٨") ||
                  //     name.contains("٩")) {
                  //   return "should be alphabetic characters".tr();
                  // }
                  Pattern pattern4 = r'[!@#$%^&*(),.?":{}|<>]';
                  RegExp regex4 = RegExp(pattern4.toString());
                  if (regex4.hasMatch(name)) {
                    return "please don't enter special characters".tr();
                  }
                  return null;
                },
                readOnly: state is RegisterIndividualLoadingState,
              ),
              AuthTextFormField(
                controller: registerCubit.individualLastNameController,
                hintText: "Last Name".tr(),
                validator: (name) {
                  if (name == null) {
                    return "Required".tr();
                  }
                  if (name.isEmpty) {
                    return "Required".tr();
                  }
                  // ٠، ١، ٢، ٣، ٤، ، ٦، ٧، ٨، ٩
                  if (name.length < 2) {
                    return "should be at least 2 alphabetic characters".tr();
                  }
                  // if (name.contains(RegExp(r'[0-9]')) ||
                  //     name.contains("٠") ||
                  //     name.contains("١") ||
                  //     name.contains("٢") ||
                  //     name.contains("٣") ||
                  //     name.contains("٤") ||
                  //     name.contains("٥") ||
                  //     name.contains("٦") ||
                  //     name.contains("٧") ||
                  //     name.contains("٨") ||
                  //     name.contains("٩")) {
                  //   return "should be alphabetic characters".tr();
                  // }
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
                readOnly: state is RegisterIndividualLoadingState,
              ),
              AuthTextFormField(
                controller: registerCubit.individualEmailController,
                hintText: "Email".tr(),
                textInputType: TextInputType.emailAddress,
                validator: (mail) {
                  if (mail == null) {
                    return "Required".tr();
                  }
                  if (mail.isEmpty) {
                    return "Required".tr();
                  }
                  Pattern pattern =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regex = RegExp(pattern.toString());
                  if (!regex.hasMatch(mail)) {
                    return "Please enter valid mail".tr();
                  }
                  return null;
                },
                readOnly: state is RegisterIndividualLoadingState,
              ),
              CustomInternationalPhoneNumberInput(
                onInputValidated: (value) {},
                onInputChanged: (value) {
                  registerCubit.individualPhoneNumber = value;
                },
                isSpace: false,
                readOnly: true,
                initialValue: registerCubit.individualPhoneNumber,
                isEnabled: false,
                textFieldController: registerCubit.individualPhoneController,
              ),
              SizedBox.shrink(),
              MasterButton(
                isLoading: state is RegisterIndividualLoadingState,
                onPressed: () {
                  if (registerCubit.individualFormKey.currentState!.validate()) {
                    registerCubit.registerIndividual();
                  }
                },
                text: 'Done'.tr(),
              ),
              SizedBox.shrink(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already Have Account".tr(),
                      style: primaryTextStyle(color:  AppColors.colorMaster)),
                  SizedBox(width: 5.h,),
                  InkWell(
                    onTap: () {
                      if (state is! RegisterIndividualLoadingState) {
                        navigateTo( LoginScreen());
                      }
                    },
                    child: Text("sign In".tr(),
                            style: boldTextStyle(color: AppColors.colorMaster, size: 16)),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
