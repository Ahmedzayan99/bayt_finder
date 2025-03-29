import 'package:bayt_finder/utils/constants.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../extensions/common.dart';
import '../../../local_storage/shared_preferences_manager.dart';
import '../../../models/auth/city_model.dart';
import '../../../models/auth/filter_configuration_price_model.dart';
import '../../../models/category_list_model.dart';
import '../../../models/filter_model.dart';
import '../../../models/my_properties_model.dart';
import '../../../models/property_details_model.dart';
import '../../../models/search_response_model.dart';
import '../../../network/dio_maneger.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterInitial());

  static FilterCubit get(context) => BlocProvider.of(context);
  DioManager dioManager = DioManager();
  String? errorMessage;
  CategoryListModel categoryListModel= CategoryListModel();
  Future<void> getCategory() async {
    emit(GetCategoryLoadingState());
    Either<String, CategoryListModel> response =
    await dioManager.getCategoryAsync();
    response.fold(
          (left) {
        errorMessage = left;
        toast(left.toString());
        emit(GetCategoryErrorState());
      },
          (right) async {
        categoryListModel = right;
        emit(GetCategorySuccessState());
      },
    );
  }
  int? categoryId;
  void selectCategory(id) {
    if(id==categoryId){
      categoryId =null;
    }else{
      categoryId=id;
    }
    emit(SetState());
  }

  int? propertyForId ;
  List<PropertyTypeList> propertyList = [
    PropertyTypeList(0.toInt(), "Rent", false),
    PropertyTypeList(1.toInt(), "Sell", false),
    PropertyTypeList(2.toInt(), "PG/Co-living", false),

  ];

  void selectProperty(index) {
    if(propertyList[index].select==true){
      propertyList[index].select = false;
      propertyForId=null;
    }
    else{
      for (int i = 0; i < propertyList.length; i++) {
          propertyList[i].select = i == index;
          propertyForId = propertyList[index].id!;}
    }

    print(propertyForId);
    emit(SetState());
  }

  TextEditingController mSearchCont = TextEditingController();
  String mSearchValue = '';
  FocusNode search = FocusNode();

  Future<void> searchAndUpdateList(String value) async {
    if (value.isNotEmpty && !mRecentSearchList.contains(value)) {
      mRecentSearchList = (SharedPreferencesManager.getStringListAsync(
            AppConstants.recentSearchList,
          )) ?? [];
      mRecentSearchList.remove(mSearchValue);
      mRecentSearchList.insert(0, mSearchValue);
      await SharedPreferencesManager.saveData(
          AppConstants.recentSearchList, mRecentSearchList);
    }
    mSearchCont.clear();
  }

  List<PropertyDetail> mergePropertyData = [];
  List<String> mRecentSearchList = [];

  Future<void> searchLocation({
    String? categoryId,
    String? city,
    String? titleScreen,
  }) async {
    emit(SearchLocationLoadingState());
    Either<String, SearchResponse> response =
        await dioManager.searchLocation(search: mSearchValue);
    response.fold(
      (left) {
        errorMessage = left;
        toast(left.toString());
        emit(SearchLocationErrorState());
      },
      (right) async {
        mergePropertyData = right.propertyData!;
        searchAndUpdateList(mSearchValue);
        emit(SearchLocationSuccessState());
      },
    );
  }

  List<CityListData> city = [];
  List<CityListData> citySelect = [];
  List<CityListData> searchCityList = [];
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

  void searchCity() {
    searchCityList = city
        .where((test) => test.title!
            .toLowerCase()
            .contains(searchCityController.text.toLowerCase()))
        .toList();

    emit(SetState());
  }

  void selectCity(
    city,
  ) {
    if (!citySelect.contains(city)) {
      citySelect.add(city);
    }
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
    emit(SetState());
  }

  void removeAtCity(
    index,
  ) {
    citySelect.removeAt(index);
    print(citySelect);
    print(citySelect.join(','));
    emit(SetState());
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
        rangeValues = RangeValues(configurationPriceModel.minPrice!,
            configurationPriceModel.maxPrice!);
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
      mixController.text = rangeValues.end.toStringAsFixed(2).toString();
    } else {
      mixController.clear();
    }
    emit(SetState());
  }

  List<String> bhkList = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
  ];
  String? selectedBhkValue;

  void selectPropertyBhk(value) {
    if (selectedBhkValue == value) {
      selectedBhkValue = null;
    } else {
      selectedBhkValue = value;
    }
    emit(SetState());
  }

  List<String> furnishedTypeList = [
    "All",
    "UnFurnished",
    'finished',
    "Semi-Finished",
  ];
  int? furnishedType;

  String? furnishedValue;

  void selectPropertyFurnished(value) {
    if (furnishedValue == value) {
      furnishedValue = null;
      furnishedType = null;
    } else {
      furnishedValue = value;
      switch (value) {
        case 'All':
          furnishedType = null;
        case 'UnFurnished':
          furnishedType = 0;
        case 'finished':
          furnishedType = 1;
        case 'Semi-Finished':
          furnishedType = 2;
      }
    }
    print(furnishedType);
    print(furnishedValue);
    emit(SetState());
  }

  TextEditingController minAgeController = TextEditingController();
  TextEditingController mixAgeController = TextEditingController();
  RangeValues rangeValuesAge = RangeValues(0, 50);

  void selectRangeAge(RangeValues values) {
    print(values);
    rangeValuesAge = values;
    if (rangeValuesAge.start > 0) {
      minAgeController.text = rangeValuesAge.start.toInt().toString();
    } else {
      minAgeController.clear();
    }
    if (rangeValuesAge.end != 50) {
      mixAgeController.text = rangeValuesAge.end.toInt().toString();
    } else {
      mixAgeController.clear();
    }
    emit(SetState());
  }

  List<PropertyDetail> property = [];

  Future<void> filterProperty() async {
    property = [];
  List<String>  city=[];
    for(var i in citySelect){
      city.add(i.selectVal!);
    }
    emit(FilterPropertyLoadingState());
    Either<String, FilterResponse> response = await dioManager.filterProperty(

        categoryId: categoryId,
        city: city.join(','),
        bhk: selectedBhkValue,
        endAgeOfProperty: mixAgeController.text,
        startAgeOfProperty: minAgeController.text,
        furnishedType: furnishedType,
        propertyFor: propertyForId,
        endPrice: mixController.text,
        startPrice: minController.text);
    response.fold(
      (left) {
        errorMessage = left;
        toast(left.toString());
        emit(FilterPropertyErrorState());
      },
      (right) {
        property = right.property!;
        emit(FilterPropertySuccessState());
      },
    );
  }
}
