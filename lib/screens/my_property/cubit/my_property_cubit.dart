import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:image_picker/image_picker.dart';
import '../../../extensions/common.dart';
import '../../../models/category_list_model.dart';
import '../../../models/dynamic_model.dart';
import '../../../models/my_properties_model.dart';
import '../../../models/place_address_model.dart';
import '../../../models/property_details_model.dart';
import '../../../network/dio_maneger.dart';
import '../../../utils/helper/image_picker_helper.dart';

part 'my_property_state.dart';

enum ListingType { rent, sell }

enum PremiumProperty { yes, no }

class MyPropertyCubit extends Cubit<MyPropertyState> {
  MyPropertyCubit() : super(MyPropertyInitial());

  static MyPropertyCubit get(context) => BlocProvider.of(context);
  DioManager dioManager = DioManager();
  String? errorMessage;
  List<PropertyDetail> myProperties = [];
  Future<void> getMyProperty() async {
    myProperties = [];
    emit(GetMyPropertyLoadingState());
    Either<String, MyPropertiesResponseModel> response =
        await dioManager.getMyProperty();
    response.fold(
      (left) {
        errorMessage = left;
        toast(left.toString());
        emit(GetMyPropertyErrorState());
      },
      (right) async {
        myProperties = right.data!;
        emit(GetMyPropertySuccessState());
      },
    );
  }
  Future<bool> propertyDelete({
    required int id,
  }) async {
  bool  isDone=false;
    emit(PropertyDeleteLoadingState());
    Either<String, String> response =
        await dioManager.propertyDelete(id:id );
    response.fold(
      (left) {
        errorMessage = left;
        toast(left.toString());
        isDone=false;
        emit(PropertyDeleteErrorState());
      },
      (right) async {
        isDone=true;
        emit(PropertyDeleteSuccessState());
      },
    );
    return isDone;
  }
  CategoryListModel categoryListModel = CategoryListModel();
  List<String> category = [];
  String? selectedCategoryType;
  int? indexOfCategoryType;
  bool isCategoryChanged = false;
  PropertyDetailsModel? updatePropertyData;
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
        implementListOfCategory();
      },
    );
  }

  void implementListOfCategory() {
    selectedCategoryType = null;
    indexOfCategoryType = null;
    category = [];
    amenityValueData = [];
    for (var i in categoryListModel.data!) {
      category.add(i.name!);
    }
  }

  void selectCategory({required String categoryType,updateProperty}) {
    selectedCategoryType = categoryType;
   // emit(ChangeCategoryState());
    getCategoryId(updateProperty);
  }

  void getCategoryId(updateProperty) {
    for (int i = 0; i < categoryListModel.data!.length; i++) {
      if (selectedCategoryType == categoryListModel.data![i].name) {
        indexOfCategoryType = categoryListModel.data![i].id!;
        amenityValueData=categoryListModel.data![i].amenityName!;
      }
    }
    dynamicAmenityList.clear();
    if (updateProperty !=true) {
      isCategoryChanged = false;
      for (var element in amenityValueData) {
        AmenityDynamicModel dynamicModel = AmenityDynamicModel();
        dynamicModel.dynamicAmenityId = element.id;
        dynamicAmenityList.add(dynamicModel);
      }
    } else {
      if (indexOfCategoryType == updatePropertyData!.data!.categoryId) {
        isCategoryChanged = false;
        if (newAmenityValueData == [] && newAmenityValueData!.isEmpty) {
          newAmenityValueData = updatePropertyData!.propertyAmenityValue!;
        }
    for (var element in newAmenityValueData!) {
    AmenityDynamicModel dynamicModel = AmenityDynamicModel();
    dynamicModel.dynamicAmenityId = element.amenityId;
    dynamicModel.dynamicAmenityValue = element.value;
    dynamicAmenityList.add(dynamicModel);
    }
      }
      else {
        isCategoryChanged = true;
        for (var element in amenityValueData) {
          AmenityDynamicModel dynamicModel = AmenityDynamicModel();
          dynamicModel.dynamicAmenityId = element.id;
          dynamicAmenityList.add(dynamicModel);
        }
      }
    }
    for (var element in dynamicAmenityList) {
      log("=======Dynamic Amenity List ${element.toJson().toString()}");
    }
    emit(ChangeCategoryState());
  }
  // List<AmenityNameCategory> amenityName = [];
  List<AmenityNameCategory> amenityValueData = [];
  List<AmenityNameCategory>? newAmenityValueData;
  List<AmenityDynamicModel> dynamicAmenityList = [];

  void updateRadioBtnData(id, value) {
    dynamicAmenityList.removeWhere((element) => element.dynamicAmenityId == id);
    AmenityDynamicModel a = AmenityDynamicModel();
    a.dynamicAmenityId = id;
    a.dynamicAmenityValue = value;
    log('================${a.toJson()}');
    dynamicAmenityList.add(a);
    if (value !=null) {
    //  toast("please Add Amenities");
    }
  }

  void updateCheckBoxData(List<String>? checkboxList, int? id) {
    if (checkboxList!.isNotEmpty) {
      for (int i = 0; i < checkboxList.length; i++) {
        AmenityDynamicModel a = AmenityDynamicModel();
        a.dynamicAmenityId = id;
        a.dynamicAmenityValue = checkboxList;
        dynamicAmenityList
            .removeWhere((element) => element.dynamicAmenityId == id);
        log('================${a.toJson()}');
        dynamicAmenityList.add(a);
     /*   if (checkboxList.isEmpty) {
          toast("please Add Amenities".tr());
        }*/
        emit(UpdateCheckBoxData());
      }
    } else {
     // toast("please Add Amenities".tr());
    }
    emit(UpdateCheckBoxData());
  }

  int? furnishedType = 0;
  List<String> furnishedTypeList = ["unfurnished", 'fully', "semi"];

  void selectPropertyFurnished(value) {
    furnishedType = value;
    emit(ChangeCategoryState());
  }

  int sellerType = 0;
  List<String> propertySellerType = ["owner", "broker", 'builder'];

  void selectPropertySeller(value) {
    sellerType = value;
    emit(ChangeCategoryState());
  }

  int propertyFor = 0;
  List<String> propertyForList = ["Rent", "Sell", "PG/Co-living"];

  void selectPropertyFor(value) {
    propertyFor = value;
    emit(ChangeCategoryState());
  }

  int? selectedBhkIndex;
  String? selectedBhkValue;
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

  void selectPropertyBhk(value) {
    selectedBhkValue = value;
    selectedBhkIndex = int.tryParse(selectedBhkValue.toString());
    emit(ChangeCategoryState());
  }

  String selectedStatusValue = "Active";
  int? selectedStatusValueIndex = 1;

  List<String> statusList = [
    "Active",
    "inActive",
  ];

  void selectPropertyStatus(value) {
    selectedStatusValue = value;
    switch (selectedStatusValue) {
      case 'Active':
        selectedStatusValueIndex = 1;
      case 'inActive':
        selectedStatusValueIndex = 0;
    }
    emit(ChangeCategoryState());
  }

  int? selectedPriceDurationIndex = 0;
  String? selectedPriceDurationValue = 'Daily';
  List<String> priceDurationList = ['Daily', 'Weekly', 'Monthly', 'Yearly'];

  void selectPropertyPriceDuration(value) {
    selectedPriceDurationValue = value;
    switch (selectedPriceDurationValue) {
      case 'Daily':
        selectedPriceDurationIndex = 0;
      case 'Weekly':
        selectedPriceDurationIndex = 1;
      case 'Monthly':
        selectedPriceDurationIndex = 2;
      case 'Yearly':
        selectedPriceDurationIndex = 3;
    }
    emit(ChangeCategoryState());
  }

  int selectedPremiumPropertyIndex = 1;

  List<String> premiumProperty = ["yes", "No"];

  void selectPropertyPremiumProperty(value) {
    selectedPremiumPropertyIndex = value;
    emit(ChangeCategoryState());
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController priceController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController securityDepositController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController maintenanceController = TextEditingController();
  TextEditingController brokerAgeController = TextEditingController();
  TextEditingController squareFeetAreaAgeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController cityArController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  String longitude = '';
  String latitude = '';
  String? photoReference;
  TextEditingController videoUrlController = TextEditingController();
  dynamic imageCover;
  List<dynamic> imageGallary=[];
  ImagePickerHelper imagePickerHelper = ImagePickerHelper();
  List<Placemark> placeMarksAR=[];
Future<void> addData(PlaceAddressModel result) async {
  countryController.text =
  result.country.toString();
  stateController.text =
  result.state.toString();
  cityController.text = result.city.toString();
  cityArController.text =
  result.cityAR.toString();
  addressController.text =
  result.placeAddress.toString();
  latitude =
      result.latitude.toString();
  longitude =
      result.longitude.toString();
  photoReference =
      result.photoReference;
  emit(ImagePicked());
}
  Future<void> pickImage({
    required ImageSource imageSource,
  }) async {
    final selectedImage =
        await imagePickerHelper.checkAndPickImage(imageSource: imageSource);
    imageCover = selectedImage;
    emit(ImagePicked());
  }

  Future<void> pickImageMultipleImage() async {
    final selectedImage =
        await imagePickerHelper.checkAndPickImageMultipleImages();
    imageGallary.addAll(selectedImage!);
    emit(ImagePicked());
  }
  Future<void> pickImageGallary({
    required ImageSource imageSource,
  }) async {
    final selectedImage =
    await imagePickerHelper.checkAndPickImage(imageSource: imageSource);
    imageGallary.add(selectedImage!);
    emit(ImagePicked());
  }
  void remove(index) {
    imageGallary.removeAt(index);
    emit(ImagePicked());
  }

  Future saveProperty(context, {bool updateProperty=false, int? propertyId,}) async {
    hideKeyboard(context);
    emit(SavePropertyLoadingState());
    Either<String, String> response = await dioManager.saveProperty(
      videoUrl: videoUrlController.text,
        propertyId:propertyId ,
        updateProperty:updateProperty ,
        name: nameController.text,
        categoryId: indexOfCategoryType.toString(),
        propertyFor: propertyFor,
        priceDuration: selectedPriceDurationIndex.toString(),
        price: priceController.text,
        furnishedType: furnishedType.toString(),
        sellerType: sellerType.toString(),
        ageOfProperty: ageController.text,
        maintenance: maintenanceController.text,
        securityDeposit: securityDepositController.text,
        brokerage: brokerAgeController.text,
        bhk: selectedBhkIndex.toString(),
        sqft: squareFeetAreaAgeController.text,
        description: descriptionController.text,
        country: countryController.text,
        state: stateController.text,
        city: cityController.text,
        cityAR: cityArController.text,
        cityImage: photoReference,
        latitude: latitude,
        longitude: longitude,
        address: addressController.text,
        status: selectedStatusValueIndex.toString(),
        premiumProperty: selectedPremiumPropertyIndex.toString(),
        propertyImage: imageCover!,
        propertyGallery: imageGallary,
        amenity:dynamicAmenityList);
    response.fold((left) {
      errorMessage = left;
      toast(left.toString());
      emit(SavePropertyErrorState());
    }, (data) {
      toast(data.toString());
      emit(SavePropertySuccessState());
  });
}
 void setUpdatePropertyData(PropertyDetailsModel updateProperty,) {
    updatePropertyData=updateProperty;
      nameController.text = updateProperty.data!.name.toString();
      selectedBhkIndex = updateProperty.data!.bhk;
      switch (updateProperty.data!.priceDuration) {
        case null:
          selectedPriceDurationIndex = 0;
          selectedPriceDurationValue = "Daily";
        case '0':
          selectedPriceDurationValue = "Daily";
          selectedPriceDurationIndex = 0;
        case '1':
          selectedPriceDurationValue = "Weekly";
          selectedPriceDurationIndex = 1;
        case '2':
          selectedPriceDurationValue = "Monthly";
          selectedPriceDurationIndex = 2;
        case '3':
          selectedPriceDurationValue = "Yearly";
          selectedPriceDurationIndex = 3;
      }
      squareFeetAreaAgeController.text = updateProperty.data!.sqft.toString();
      ageController.text = updateProperty.data!.ageOfProperty.toString();
      descriptionController.text = updateProperty.data!.description.toString();
      priceController.text = updateProperty.data!.price.toString();
      securityDepositController.text = updateProperty.data!.securityDeposit.toString();
      brokerAgeController.text = updateProperty.data!.brokerage.toString();
      maintenanceController.text = updateProperty.data!.maintenance.toString();
      addressController.text = updateProperty.data!.address.toString();
      countryController.text = updateProperty.data!.country.toString();
      stateController.text = updateProperty.data!.state.toString();
      cityController.text = updateProperty.data!.city.toString();
      cityArController.text = updateProperty.data!.cityAr.toString();
    imageCover = updateProperty.data!.propertyImage.toString();
      videoUrlController = updateProperty.data!.videoUrl==null ? TextEditingController() :TextEditingController(text:updateProperty.data!.videoUrl.toString() ) ;
      furnishedType = updateProperty.data!.furnishedType;
      sellerType = updateProperty.data!.sallerType!;
      propertyFor = updateProperty.data!.propertyFor!;
    newAmenityValueData = updateProperty.propertyAmenityValue!;
    selectCategory(categoryType: updateProperty.data!.category.toString(),updateProperty:true );
    selectedPremiumPropertyIndex = updateProperty.data!.premiumProperty!;
    imageGallary.clear();
      for (var element in updateProperty.data!.propertyGallary!) {
        imageGallary.add(element);
      }
      latitude = updateProperty.data!.latitude!;
      longitude = updateProperty.data!.longitude!;
    emit(SetUpdatePropertyData());

  }
void clear(){
   categoryListModel = CategoryListModel();
  category = [];
   selectedCategoryType=null;
   indexOfCategoryType=null;
   isCategoryChanged = false;
   updatePropertyData=null;
   amenityValueData = [];
   newAmenityValueData=null;
   dynamicAmenityList = [];
    furnishedType = 0;
   sellerType = 0;
   propertyFor = 0;
   selectedBhkIndex=null;
    selectedBhkValue=null;
    selectedStatusValue = "Active";
    selectedStatusValueIndex = 1;
   selectedPriceDurationIndex = 0;
  selectedPriceDurationValue = 'Daily';
   selectedPremiumPropertyIndex = 1;
   premiumProperty = ["yes", "No"];
   formKey = GlobalKey<FormState>();
    priceController = TextEditingController();
    nameController = TextEditingController();
    securityDepositController = TextEditingController();
    ageController = TextEditingController();
    maintenanceController = TextEditingController();
    brokerAgeController = TextEditingController();
    squareFeetAreaAgeController = TextEditingController();
    descriptionController = TextEditingController();
    countryController = TextEditingController();
    stateController = TextEditingController();
    cityController = TextEditingController();
    cityArController = TextEditingController();
    addressController = TextEditingController();
    longitude = '';
    latitude = '';
    videoUrlController = TextEditingController();
   imageCover=null;
   imageGallary=[];
   emit(SetUpdatePropertyData());

}
}
