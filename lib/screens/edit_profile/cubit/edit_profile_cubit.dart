import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../extensions/common.dart';
import '../../../models/auth/user_response_model.dart';
import '../../../network/dio_maneger.dart';
import '../../../utils/helper/image_picker_helper.dart';

part 'edit_profile_state.dart';

enum UserType { company, individual }

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());

  static EditProfileCubit get(context) => BlocProvider.of(context);
  DioManager dioManager = DioManager();
  String? errorMessage;

  bool isBackupPhone = false;

  GlobalKey<FormState> companyFormKey = GlobalKey<FormState>();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController companyFirstNameController = TextEditingController();
  TextEditingController companyLastNameController = TextEditingController();
  TextEditingController companyEmailController = TextEditingController();
  TextEditingController companyPhoneController = TextEditingController();
  TextEditingController companyBackupPhoneController = TextEditingController();
  TextEditingController companyWhatsappController = TextEditingController();
  TextEditingController companyDescriptionController = TextEditingController();
  File? companyImage;

  Future saveCompany(UserResponseModel userResponse) async {
    emit(EditProfileCompanyLoadingState());
    Either<String, UserResponseModel>  res = await dioManager.updateProfileCompany(
        id: userResponse.data!.id.toString(),
        firstName: companyFirstNameController.text,
        lastName: companyLastNameController.text,
        displayName:"${companyFirstNameController.text} ${companyLastNameController.text}",
      email: companyEmailController.text,
      usernameOrCompany:companyNameController.text,
        whatsapp:  userResponse.data!.whatsapp.toString(),
        description:companyDescriptionController.text ,
        contactNumber: userResponse.data!.contactNumber.toString(),
        profileImage: companyImage,

    );
    res.fold((error) {
      toast(error.toString());
      emit(EditProfileCompanyErrorState());
    }, (r) {
      toast("Edit Profile successfully".tr());
      emit(EditProfileCompanySuccessState());
    },);
  }
  void clearDataCompany(UserResponseModel userResponse) {
    isBackupPhone = false;
    companyFormKey = GlobalKey<FormState>();
    companyNameController =
        TextEditingController(text: userResponse.data!.username);
    companyFirstNameController =
        TextEditingController(text: userResponse.data!.firstName);
    companyLastNameController =
        TextEditingController(text: userResponse.data!.lastName);
    companyEmailController =
        TextEditingController(text: userResponse.data!.email);
    companyPhoneController =
        TextEditingController(text: userResponse.data!.contactNumber);
    companyBackupPhoneController =
        TextEditingController(text: userResponse.data!.phone);
    companyWhatsappController =
        TextEditingController(text: userResponse.data!.whatsapp);
    companyDescriptionController =
        TextEditingController(text: userResponse.data!.description);
    if (userResponse.data!.phone != null) {
      isBackupPhone = true;
    }
    errorMessage = null;
    emit(ClearDataState());
  }

  GlobalKey<FormState> individualFormKey = GlobalKey<FormState>();
  TextEditingController individualPhoneController = TextEditingController();
  TextEditingController individualFirstNameController = TextEditingController();
  TextEditingController individualLastNameController = TextEditingController();
  TextEditingController individualEmailController = TextEditingController();
  File? individualImage;

/*  Future<void> registerIndividual() async {
    emit(RegisterIndividualLoadingState());
    Either<String, SignUpResponse> response =
    await dioManager.registerUserAsync(
      isAgent:false,
      firstName: individualFirstNameController.text,
      lastName: individualLastNameController.text,
      usernameOrCompany: individualUsernameController.text,
      contactNumber: individualPhoneController.text,
      email: individualEmailController.text,
      countryCode: individualPhoneNumber.dialCode.toString(),
      profileImage: individualImage!,
    );
    response.fold(
          (left) {
        errorMessage = left;

        toast(left.toString());
        emit(RegisterIndividualErrorState());
      },
          (right) {
        registerModel = right;
        emit(RegisterIndividualSuccessState());
      },
    );
  }*/
  void clearDataIndividual(UserResponseModel userResponse) {
    individualImage = null;
    individualFormKey = GlobalKey<FormState>();
    individualPhoneController =
        TextEditingController(text: userResponse.data!.contactNumber);
    individualFirstNameController =
        TextEditingController(text: userResponse.data!.firstName);
    individualLastNameController =
        TextEditingController(text: userResponse.data!.lastName);
    individualEmailController =
        TextEditingController(text: userResponse.data!.email);
    emit(ClearDataState());
  }


  ImagePickerHelper imagePickerHelper = ImagePickerHelper();

  Future<File?> pickImage({
    required ImageSource imageSource,
  }) async {
    final selectedImage =
    await imagePickerHelper.checkAndPickImage(imageSource: imageSource);
    emit(ImagePicked());
    return selectedImage;
  }

  Future saveIndividual(UserResponseModel userResponse) async {
    emit(EditProfileIndividualLoadingState());
    Either<String, UserResponseModel>  res = await dioManager.updateProfileUser(
        id: userResponse.data!.id.toString(),
        firstName: individualFirstNameController.text,
        lastName: individualLastNameController.text,
        displayName:  "${individualFirstNameController.text} ${individualLastNameController
            .text}",
        username:  userResponse.data!.username.toString(),
        email: individualEmailController.text,
        contactNumber: userResponse.data!.contactNumber.toString(),
      profileImage: individualImage
    );
    res.fold((error) {
      toast(error.toString());
      emit(EditProfileIndividualErrorState());
    }, (r) {
      toast("Edit Profile successfully".tr());
      emit(EditProfileIndividualSuccessState());
    },);
  }

}
