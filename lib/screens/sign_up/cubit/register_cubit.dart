import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../extensions/common.dart';
import '../../../models/auth/city_model.dart';
import '../../../models/auth/filter_configuration_price_model.dart';
import '../../../models/auth/signUp_resonse.dart';
import '../../../models/my_properties_model.dart';
import '../../../network/dio_maneger.dart';
import '../../../utils/helper/image_picker_helper.dart';

part 'register_state.dart';

enum UserType { company, individual }

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);
  DioManager dioManager = DioManager();
  String? errorMessage;
  SignUpResponse registerModel = SignUpResponse();
  UserType selectedUserType = UserType.individual;

  void setUserType(UserType userType) {
    selectedUserType = userType;
    emit(SetUserTypeState());
  }

  bool isBackupPhone = false;

  void setBackupPhone(bool phone) {
    isBackupPhone = phone;
    emit(SetBackupPhoneState());
  }

  PhoneNumber companyPhoneNumber = PhoneNumber(isoCode: "IQ");
  PhoneNumber companyBackupNumber = PhoneNumber(isoCode: "IQ");
  PhoneNumber companyWhatsappNumber = PhoneNumber(isoCode: "IQ");
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

  Future<void> registerCompany() async {
    emit(RegisterCompanyLoadingState());
    Either<String, SignUpResponse> response =
    await dioManager.registerUserAsync(
        isAgent:true,
        firstName: companyFirstNameController.text,
      lastName: companyLastNameController.text,
       usernameOrCompany: companyNameController.text,
        contactNumber: companyPhoneController.text,
      phone: companyBackupPhoneController.text.isEmpty?null:companyBackupPhoneController.text,
      email: companyEmailController.text,
        countryCode: companyPhoneNumber.dialCode.toString(),
        profileImage: companyImage,
      description: companyDescriptionController.text,
      whatsapp: companyWhatsappController.text,
    );
    response.fold(
          (left) {
        errorMessage = left;
        toast(left.toString());
        emit(RegisterCompanyErrorState());
      },
          (right) {
        registerModel = right;
        emit(RegisterCompanySuccessState());
      },
    );
  }
  void clearDataCompany() {
    isBackupPhone = false;
    companyPhoneNumber = PhoneNumber(isoCode: "IQ");
    companyBackupNumber = PhoneNumber(isoCode: "IQ");
    companyWhatsappNumber = PhoneNumber(isoCode: "IQ");
    companyFormKey = GlobalKey<FormState>();
    companyNameController = TextEditingController();
    companyFirstNameController = TextEditingController();
    companyLastNameController = TextEditingController();
    companyEmailController = TextEditingController();
    companyPhoneController = TextEditingController();
    companyBackupPhoneController = TextEditingController();
    companyWhatsappController = TextEditingController();
    companyDescriptionController = TextEditingController();
    errorMessage = null;
    emit(ClearDataState());
  }

  GlobalKey<FormState> individualFormKey = GlobalKey<FormState>();
  PhoneNumber individualPhoneNumber = PhoneNumber(isoCode: "IQ");

  TextEditingController individualUsernameController = TextEditingController();
  TextEditingController individualPhoneController = TextEditingController();
  TextEditingController individualFirstNameController = TextEditingController();
  TextEditingController individualLastNameController = TextEditingController();
  TextEditingController individualEmailController = TextEditingController();
  File? individualImage;
  Future<void> registerIndividual() async {
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
      profileImage: individualImage,
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
  }
  void clearDataIndividual() {
    individualFormKey = GlobalKey<FormState>();
    individualPhoneNumber = PhoneNumber(isoCode: "IQ");
    individualUsernameController = TextEditingController();
    individualPhoneController = TextEditingController();
    individualFirstNameController = TextEditingController();
    individualLastNameController = TextEditingController();
    individualEmailController = TextEditingController();
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

  List<String> textStepList = [
    "Let’s get you Stared.first, what are you interested in?",
    "where in iraq are you looking to buy?"
        "What’s your budget"
  ];
  String propertyForString = 'Buy';
  List<PropertyTypeList> propertyList = [
    PropertyTypeList(0.toInt(), "Buy", true),
    PropertyTypeList(1.toInt(), "Rent", false)
  ];

  void selectProperty(index) {
    for (int i = 0; i < propertyList.length; i++) {
      propertyList[i].select = i == index;
      propertyForString = propertyList[index].title!.toLowerCase();
    }
    print(propertyForString);
    emit(SelectPropertyState());
  }

  List<CityListData> city = [];
  List<CityListData> searchCityList = [];
  List<String> citySelect = [];
  List<String> citySelectVal = [];
  TextEditingController showCityController = TextEditingController();
  TextEditingController searchCityController = TextEditingController();

  Future<void> getCity() async {
    emit(GetCityLoadingState());
    Either<String, CityModel> response = await dioManager.getCity();
    response.fold(
      (left) {
        errorMessage = left;
        toast(left.toString());
        emit(GetCityErrorState());
      },
      (right) {
        city = right.cityListData!;
        searchCityList = List.from(city);
        searchCityController.addListener(searchCity);
        emit(GetCitySuccessState());
      },
    );
  }

  void selectCity(
    city
  ,cityEn
  ) {
    if (citySelect.contains(city)) {
      citySelect.remove(city);
      citySelectVal.remove(cityEn);
    } else {
      citySelect.add(city);
      citySelectVal.add(cityEn);
    }
    showCityController.text = citySelect.join(',');
    /*   citySelect = [];
    city[index].isSelect = !city[index].isSelect!;
    for (var i in city) {
      if (i.isSelect!) {
        citySelect.add(i.name!);
      }
    }
;*/
    print(citySelect);
    print(citySelect.join(','));
    print(citySelectVal.join(','));
    emit(SelectPropertyState());
  }

  void searchCity() {
    searchCityList = city
        .where((test) => test.title!
            .toLowerCase()
            .contains(searchCityController.text.toLowerCase()))
        .toList();
    print(searchCityList.length);
    print(searchCityList);
    emit(SelectPropertyState());
  }

  FilterConfigurationPriceModel configurationPriceModel =
      FilterConfigurationPriceModel();

  Future<void> filterConfigurationPrice() async {
    emit(FilterConfigurationPriceLoadingState());
    Either<String, FilterConfigurationPriceModel> response =
        await dioManager.filterConfigurationPrice();
    response.fold(
      (left) {
        errorMessage = left;
        toast(left.toString());
        emit(FilterConfigurationPriceErrorState());
      },
      (right) {
        configurationPriceModel = right;
        rangeValues = RangeValues(configurationPriceModel.minPrice!.toDouble(),
            configurationPriceModel.maxPrice!.toDouble());
        emit(FilterConfigurationPriceSuccessState());
      },
    );
  }

  RangeValues rangeValues = RangeValues(0, 0);
  TextEditingController minController = TextEditingController();
  TextEditingController mixController = TextEditingController();

  void selectRangeValues(RangeValues values) {
    print(values);
    rangeValues = values;
    if (rangeValues.start > configurationPriceModel.minPrice!.toDouble()) {
      minController.text = rangeValues.start.toStringAsFixed(2).toString();
    } else {
      minController.clear();
    }
    if (rangeValues.end != configurationPriceModel.maxPrice!.toDouble()) {
      mixController.text =rangeValues.end.toStringAsFixed(2).toString();
    } else {
      mixController.clear();
    }
    emit(SelectRangeValuesState());
  }

  int intialStep = 0;

  void selectStep() {
    if (intialStep < 2) {
      intialStep = intialStep + 1;
      emit(SelectRangeValuesState());
    }
  }

  Future<void> updateUserStatus() async {
    emit(UpdateUserStatusLoadingState());
    Either<String, String> response = await dioManager.updateUserStatus(
      city: citySelectVal.isNotEmpty?citySelectVal.join(','):null,
      interestType: propertyForString.isNotEmpty?propertyForString:null,
      maxBudget: mixController.text.isNotEmpty?mixController.text:null,
      minBudget: minController.text.isNotEmpty?minController.text:null,
    );
    response.fold(
      (left) {
        errorMessage = left;
        toast(left.toString());
        emit(UpdateUserStatusErrorState());
      },
      (right) {
        emit(UpdateUserStatusSuccessState());
      },
    );
  }
  void clear(){
    intialStep = 0;
     minController = TextEditingController();
     mixController = TextEditingController();
    rangeValues = RangeValues(0, 0);
    configurationPriceModel =
        FilterConfigurationPriceModel();
     propertyForString = 'Buy';
  city = [];
   searchCityList = [];
     citySelect = [];
   showCityController = TextEditingController();
 searchCityController = TextEditingController();
    emit(ClearState());
  }
}
