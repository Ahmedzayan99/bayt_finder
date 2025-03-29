import 'package:bayt_finder/nav.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../../components/appbar/custom_appbar.dart';
import '../../components/auth_text_form_field/auth_text_form_field.dart';
import '../../components/buttons/master_button.dart';

import '../../models/auth/user_response_model.dart';

import '../../utils/colors.dart';
import '../../utils/custom_bottom_sheet.dart';
import '../../utils/pick_image_bottom_sheet.dart';
import '../../utils/styles.dart';
import '../my_account/cubit/my_account_cubit.dart';
import 'cubit/edit_profile_cubit.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key, required this.userDetail});
 final UserResponseModel userDetail;
  @override
  Widget build(BuildContext context) {
    EditProfileCubit editProfileCubit = EditProfileCubit.get(context);
    editProfileCubit.clearDataCompany(userDetail);
    editProfileCubit.clearDataIndividual(userDetail);
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
        Brightness.light,
        systemNavigationBarIconBrightness:
        Brightness.light,
      ),
      child: BlocConsumer<EditProfileCubit, EditProfileState>(
        listener: (context, state) async {
          if (state is EditProfileIndividualSuccessState ||state is EditProfileCompanySuccessState) {
            navigateBack(context,);

            MyAccountCubit.get(context).getUserDetail();
/*            await SharedPreferencesManager.saveData(AppConstants.token,
                editProfileCubit.registerModel.data!.apiToken!);
            await SharedPreferencesManager.saveData(AppConstants.isLogin, true);
            isLogin = true;
            navigateFinish( UpdateStataScreen());*/
         /*   editProfileCubit.clearDataCompany();
            editProfileCubit.clearDataCompany();*/
            // navigateFinish( LayoutScreen());
          }

        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.colorWhite,
            appBar: CustomAppBar(
              title: "Edit Profile".tr(),
              showBack: true,
            ),
            body: Padding(
              padding: EdgeInsets.only(top: 37.h, right: 15.w, left: 15.w),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 15.h,
                  children: [
                    userDetail.data!.isAgent== 1
                        ? CompanyProfileForm(
                      userDetail: userDetail
                    )
                        : IndividualForm(
                      userDetail: userDetail,
                    ),
                    SizedBox.shrink()
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


// Company profile form
class CompanyProfileForm extends StatelessWidget {
  const CompanyProfileForm({super.key, required this.userDetail});

  final UserResponseModel userDetail;


  @override
  Widget build(BuildContext context) {
    EditProfileCubit editProfileCubit = EditProfileCubit.get(context);
    return BlocBuilder<EditProfileCubit, EditProfileState>(
      builder: (context, state) {
        return Form(
          key: editProfileCubit.companyFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 7.h,
            children: [
              SizedBox.shrink(),
              Center(
                child: Column(

                  children: [
                    editProfileCubit.companyImage !=null?  Container(
                      width: 100.sp,
                      height: 100.sp,
                      decoration: BoxDecoration(
                        color: AppColors.black,
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                        child:Image.file(editProfileCubit.companyImage!,fit:BoxFit.fill ,) ,
                      ),
                    ):SizedBox(
                      width: 100.sp,
                      height: 100.sp,
                      child: ClipOval(
                          child: Image.network(userDetail.data!.profileImage.toString())),
                    ),
                    SizedBox(height: 8.sp),
                    InkWell(
                      onTap: () {
                          NewCustomBottomSheet.showModalBottom(context,
                              child: PickImageModalBottomSheet(
                                onPressedPhotos: () async {
                                  editProfileCubit.companyImage= await editProfileCubit.pickImage(
                                    imageSource: ImageSource.gallery,
                                  );
                                  Navigator.of(context).pop();
                                },
                                onPressedCamera: () async {
                                  editProfileCubit.companyImage= await  editProfileCubit.pickImage(
                                    imageSource: ImageSource.camera,
                                  );
                                  Navigator.of(context).pop();
                                },
                              ),
                              initialChildSize: 0.32);
                      },
                      child: Text("Upload picture".tr(),
                          style: TextStyles.font16MasterBoldUnderline),
                    ),
                  ],
                ),
              ),
              SizedBox.shrink(),
              Text("Company Name".tr(),
                  style: TextStyles.font16BlackRegular),
              AuthTextFormField(
                controller: editProfileCubit.companyNameController,
                hintText: "Company Name".tr(),
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
                textInputType: TextInputType.name,
              ),
              Row(

                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("First Name".tr(),
                            style: TextStyles.font16BlackRegular),
                        AuthTextFormField(
                          textInputType: TextInputType.name,
                          controller: editProfileCubit.companyFirstNameController,
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
                      ],
                    ),
                  ),
                  SizedBox(width: 16.sp),
                  Expanded(
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Last Name".tr(),
                            style: TextStyles.font16BlackRegular),
                        AuthTextFormField(
                          textInputType: TextInputType.name,
                          controller: editProfileCubit.companyLastNameController,
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
                      ],
                    ),
                  ),
                ],
              ),
              Text("Email".tr(),
                  style: TextStyles.font16BlackRegular),
              AuthTextFormField(
                controller: editProfileCubit.companyEmailController,
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
              ),
              Text("Phone Number".tr(),
                  style: TextStyles.font16BlackRegular),
              AuthTextFormField(
                controller: editProfileCubit.companyPhoneController,
                readOnly: true,
                hintText: "Phone".tr(),
                textInputType: TextInputType.phone,
              ),
           /*   Row(
                spacing: 15.w,
                children: [
                  Expanded(
                    child: CustomInternationalPhoneNumberInput(
                      onInputValidated: (value) {},
                      onInputChanged: (value) {
                        editProfileCubit.companyPhoneNumber = value;
                      },
                      isSpace: false,
                      readOnly: true,

                      initialValue: editProfileCubit.companyPhoneNumber,
                      isEnabled: false,
                      textFieldController: editProfileCubit.companyPhoneController,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (!editProfileCubit.isBackupPhone) {
                        if( state is! RegisterCompanyLoadingState){
                          editProfileCubit.setBackupPhone(true);

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
              if (editProfileCubit.isBackupPhone)
                Row(
                  spacing: 15.w,

                  children: [
                    Expanded(
                      child: CustomInternationalPhoneNumberInput(
                        onInputValidated: (value) {},
                        onInputChanged: (value) {
                          editProfileCubit.companyBackupNumber = value;
                        },
                        isSpace: false,
                        readOnly:state is RegisterCompanyLoadingState,
                        initialValue: editProfileCubit.companyBackupNumber,
                        isEnabled: false,
                        textFieldController:
                        editProfileCubit.companyBackupPhoneController,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if( state is! RegisterCompanyLoadingState){
                          editProfileCubit.setBackupPhone(false);
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
                ),*/
          /*    CustomInternationalPhoneNumberInput(
                  onInputValidated: (value) {},
                  hintText: "Whatsapp Number".tr(),
                  onInputChanged: (value) {
                    editProfileCubit.companyWhatsappNumber = value;
                  },
                  isSpace: false,
                  initialValue: editProfileCubit.companyWhatsappNumber,
                  isEnabled: false,
                  textFieldController: editProfileCubit.companyWhatsappController,
                  readOnly:state is RegisterCompanyLoadingState,
                  suffixIcon:Padding(
                    padding:  EdgeInsets.all(8.sp),
                    child: SvgPicture.asset(AppImage.whatsapp),
                  )
              ),*/
              Text("Whatsapp Number".tr(),
                  style: TextStyles.font16BlackRegular),
              AuthTextFormField(
                controller: editProfileCubit.companyWhatsappController,
                readOnly: true,
                hintText: "Phone".tr(),
                textInputType: TextInputType.phone,
              ),
              Text("Description".tr(),
                  style: TextStyles.font16BlackRegular),
              AuthTextFormField(
                controller: editProfileCubit.companyDescriptionController,
                hintText: "Description".tr(),
                maxLines: 4,
                validator: (mail) {
                  if (mail == null) {
                    return "Required".tr();
                  }
                  if (mail.isEmpty) {
                    return "Required".tr();
                  }
                  return null;
                },
              ),
              SizedBox.shrink(),
              MasterButton(
                isLoading: state is EditProfileCompanyLoadingState,
                onPressed: () {
                  if (editProfileCubit.companyFormKey.currentState!.validate()) {
                     editProfileCubit.saveCompany(userDetail);
                    }
                },
                text: 'Save'.tr(),
              ),
              SizedBox.shrink(),
            ],
          ),
        );
      },
    );
  }
}

// User profile form
class IndividualForm extends StatelessWidget {
  const IndividualForm({super.key,  required this.userDetail});


  final UserResponseModel userDetail;
  @override
  Widget build(BuildContext context) {
    EditProfileCubit editProfileCubit = EditProfileCubit.get(context);
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Form(
          key: editProfileCubit.individualFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            spacing: 7.h,
            children: [
              SizedBox.shrink(),
              Center(
                child: Column(
                  children: [
                    Center(
                      child:  editProfileCubit.individualImage !=null?Container(
                        width: 100.sp,
                        height: 100.sp,
                        decoration: BoxDecoration(
                          color: AppColors.black,
                          shape: BoxShape.circle,
                        ),
                        child: ClipOval(
                          child:Image.file(editProfileCubit.individualImage!,fit:BoxFit.fill ,) ,

                        ),
                      ): SizedBox(
                        width: 100.sp,
                        height: 100.sp,
                        child: ClipOval(
                            child: Image.network(userDetail.data!.profileImage.toString())),
                      ),
                    ),
                    SizedBox(height: 8.sp),
                    InkWell(
                      onTap: () {

                          NewCustomBottomSheet.showModalBottom(context,
                              child: PickImageModalBottomSheet(
                                onPressedPhotos: () async {
                                  editProfileCubit.individualImage= await editProfileCubit.pickImage(
                                    imageSource: ImageSource.gallery,
                                  );
                                  Navigator.of(context).pop();
                                },
                                onPressedCamera: () async {
                                  editProfileCubit.individualImage= await  editProfileCubit.pickImage(
                                    imageSource: ImageSource.camera,
                                  );
                                  Navigator.of(context).pop();
                                },
                              ),
                              initialChildSize: 0.32
                            );


                      },
                      child: Text("Upload picture".tr(),
                          style: TextStyles.font16MasterBoldUnderline),
                    ),
                  ],
                ),
              ),
              SizedBox.shrink(),
              Text("First Name".tr(),
                  style: TextStyles.font16BlackRegular),
              AuthTextFormField(
                controller: editProfileCubit.individualFirstNameController,
                hintText: "First Name".tr(),
                textInputType: TextInputType.name,
                validator: (name) {
                  if (name == null) {
                    return "Required".tr();
                  }
                  if (name.isEmpty) {
                    return "Required".tr();
                  }
                  // ٠، ١، ٢، ٣، ٤، ، ٦، ٧، ٨، ٩
                  if (name.length < 5) {
                    return "should be at least 5 alphabetic characters".tr();
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
                  Pattern pattern4 = r'[!@#$%^&*(),.?":{}|<>]';
                  RegExp regex4 = RegExp(pattern4.toString());
                  if (regex4.hasMatch(name)) {
                    return "please don't enter special characters".tr();
                  }
                  return null;
                },
              ),
              Text("Last Name".tr(),
                  style: TextStyles.font16BlackRegular),
              AuthTextFormField(
                controller: editProfileCubit.individualLastNameController,
                hintText: "Last Name".tr(),
                  textInputType: TextInputType.name,

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
              ),
              Text("Email".tr(),
                  style: TextStyles.font16BlackRegular),
              AuthTextFormField(
                controller: editProfileCubit.individualEmailController,
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
              ),
              Text("Phone Number".tr(),
                  style: TextStyles.font16BlackRegular),
              AuthTextFormField(
                controller: editProfileCubit.individualPhoneController,
                readOnly: true,
                hintText: "Phone".tr(),
                textInputType: TextInputType.phone,
              ),
              SizedBox.shrink(),
              MasterButton(
                isLoading: state is EditProfileIndividualLoadingState,

                onPressed: () {
                  if (editProfileCubit.individualFormKey.currentState!.validate()) {
                    editProfileCubit.saveIndividual(userDetail);
                  }
                },
                text: 'Save'.tr(),
              ),
            ],
          ),
        );
      },
    );
  }
}


