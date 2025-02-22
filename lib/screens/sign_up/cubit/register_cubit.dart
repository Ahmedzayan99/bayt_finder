import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../local_storage/shared_preferences_manager.dart';
import '../../../extensions/common.dart';
import '../../../models/auth/city_model.dart';
import '../../../models/auth/filter_configuration_price_model.dart';
import '../../../models/auth/signUp_resonse.dart';
import '../../../models/dashBoard_response.dart';
import '../../../models/my_properties_model.dart';
import '../../../network/dio_maneger.dart';

part 'register_state.dart';

enum Gender {
  male,
  female,
}

enum Steps { name, email, phone, password, gender }

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  FocusNode firstNameFocus = FocusNode();
  FocusNode lastNameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();

  /* bool isActiveButton = false;
  bool isNameValidate = false;
  bool isEmailValidate = false;
  bool isPasswordValidate = false;
  bool phoneNumberValidate = false;
  bool genderValidate = false;*/

/*  void validate(Steps step, isValidate) async {
    switch (step) {
      case Steps.name:
        isNameValidate = isValidate;
      case Steps.email:
        isEmailValidate = isValidate;
      case Steps.phone:
        phoneNumberValidate = isValidate;
      case Steps.password:
        isPasswordValidate = isValidate;
      case Steps.gender:
        genderValidate = isValidate;
    }
    activeButton();
  }*/

  /* void activeButton() {
    if (isNameValidate &&
        isEmailValidate &&
        isPasswordValidate &&
        phoneNumberValidate &&
        genderValidate) {
      isActiveButton = true;
    } else {
      isActiveButton = false;
    }
    emit(ActiveButtonState());
  }*/
  DioManager dioManager = DioManager();
  String? errorMessage;
  SignUpResponse registerModel = SignUpResponse();

  Future<void> registerUser() async {
    await SharedPreferencesManager.removeData('token');
    await SharedPreferencesManager.removeData('userId');
    emit(RegisterUserLoadingState());
    Either<String, SignUpResponse> response =
    await dioManager.registerUserAsync(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      phone: phoneController.text,
      email: emailController.text,
    );
    response.fold(
          (left) {
        errorMessage = left;
        toast(left.toString());
        emit(RegisterUserErrorState());
      },
          (right) {
        registerModel = right;
        emit(RegisterUserSuccessState());
      },
    );
  }

  void clearData() {
    firstNameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    errorMessage = null;
    emit(ClearDataState());
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

  void selectCity(city,) {
    if (citySelect.contains(city)) {
      citySelect.remove(city);
    } else {
      citySelect.add(city);
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
    emit(SelectPropertyState());
  }

  void searchCity() {
    searchCityList = city
        .where((test) =>
        test.name!
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
    if (rangeValues.start > 0.0) {
      minController.text = rangeValues.start.toStringAsFixed(2).toString();
    } else {
      minController.clear();
    }
    if (rangeValues.end > 0.0) {
      mixController.text = rangeValues.end.toStringAsFixed(2).toString();
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
    Either<String, String> response =
    await dioManager.updateUserStatus(
      city: citySelect.join(','),
      interestType: propertyForString,
      maxBudget: mixController.text,
      minBudget: minController.text,
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
}
