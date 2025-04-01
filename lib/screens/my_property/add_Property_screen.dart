import 'package:bayt_finder/components/appbar/custom_appbar.dart';
import 'package:bayt_finder/components/auth_text_form_field/auth_text_form_field.dart';
import 'package:bayt_finder/components/buttons/master_button.dart';
import 'package:bayt_finder/nav.dart';
import 'package:bayt_finder/screens/google_map/cubit/google_map_cubit.dart';
import 'package:bayt_finder/screens/google_map/cubit/google_map_cubit.dart';
import 'package:bayt_finder/screens/layout/layout_screen.dart';
import 'package:bayt_finder/screens/property/cubit/property_cubit.dart';
import 'package:bayt_finder/utils/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import '../../components/drop_down_component.dart';
import '../../components/radio_component.dart';
import '../../models/place_address_model.dart';
import '../../utils/colors.dart';
import '../../components/AmenityTextFiledComponent.dart';
import '../../components/checkbox_Component.dart';
import '../../extensions/common.dart';
import '../../extensions/loader_widget.dart';
import '../../utils/constants.dart';
import '../../utils/custom_bottom_sheet.dart';
import '../../utils/images.dart';
import '../../utils/pick_image_bottom_sheet.dart';
import '../google_map/google_map_screen.dart';
import 'cubit/my_property_cubit.dart';

class AddPropertyScreen extends StatefulWidget {
  const AddPropertyScreen({
    super.key,
    this.updateProperty,
    this.idProperty,
  });

  final bool? updateProperty;
  final int? idProperty;

  @override
  State<AddPropertyScreen> createState() => _AddPropertyScreenState();
}

class _AddPropertyScreenState extends State<AddPropertyScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.updateProperty != true) {
      MyPropertyCubit.get(context).clear();
    }
    if (widget.updateProperty == true) {
      PropertyCubit.get(context).propertyDetail(id: widget.idProperty!).then(
            (value) {
          MyPropertyCubit.get(context).setUpdatePropertyData(
              PropertyCubit
                  .get(context)
                  .propertyDetailsModel);
        },
      );
    }
  }

  @override
  void dispose() {
    MyPropertyCubit.get(context).clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MyPropertyCubit myPropertyCubit = MyPropertyCubit.get(context);
    PropertyCubit propertyCubit = PropertyCubit.get(context);
    return Form(
      key: myPropertyCubit.formKey,
      child: BlocConsumer<PropertyCubit, PropertyState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: CustomAppBar(
              title: widget.updateProperty == true
                  ? "Edit My Property".tr()
                  : 'Add My Property'.tr(),
              showBack: true,
              onBackButtonPressed: () {
                navigateFinish(LayoutScreen());
                MyPropertyCubit.get(context).clear();
              },
              // actions: [
              //   InkWell(
              //     onTap: () {
              //       navigateTo( SearchScreen());
              //     },
              //     child: Container(
              //         height: 43.h,
              //         width: 52.w,
              //         decoration: BoxDecoration(
              //             color: AppColors.colorBGSheet,
              //             borderRadius: BorderRadius.circular(7.r),
              //             border: Border.all(
              //               width: 1.w,
              //               color: AppColors.colorBorderMediumGray,
              //             )),
              //         child: Center(
              //             child: SvgPicture.asset(AppImage.search2))),
              //   ),
              // ],
            ),
            body: widget.updateProperty == true &&
                propertyCubit.propertyDetailsModel.data == null
                ? Loader()
                : BlocConsumer<MyPropertyCubit, MyPropertyState>(
              listener: (context, state) {
                if (state is SavePropertySuccessState) {
                  // SuccessPropertyScreen(propertyId: res.propertyId).launch(context);
                  // navigateFinish( LayoutScreen());
                  navigateBack(context);
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Material(
                              borderRadius: BorderRadius.circular(10.r),
                              child: Stack(
                                alignment: AlignmentDirectional.topEnd,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(60.sp),
                                    decoration: BoxDecoration(
                                      color: AppColors.colorWhite,
                                      borderRadius:
                                      BorderRadius.circular(10.r),
                                    ),
                                    child: Column(
                                      spacing: 25.h,
                                      children: [
                                        SvgPicture.asset(
                                            AppImage.whiteCheckMark),
                                        Text(
                                          'Congratulation'.tr(),
                                          style: TextStyle(
                                              color: AppColors
                                                  .colorLightBlack,
                                              fontSize: 25.sp,
                                              fontWeight:
                                              FontManger.medium),
                                        ),
                                        Text(
                                            'Your property has been added successfully!'
                                                .tr(),
                                            textAlign: TextAlign.center,
                                            style: TextStyles
                                                .font18BlackRegular),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.sp),
                                    child: InkWell(
                                        onTap: () {
                                          navigateBack(context);
                                        },
                                        child: Icon(Icons.cancel)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                  myPropertyCubit.getMyProperty();
                }
              },
              builder: (context, state) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 21.w, vertical: 35.h),
                    child: Column(
                      spacing: 15.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Property Details'.tr(),
                            style: TextStyles.font20BlackMedium),
                        _buildLabelWithAsterisk('Select Category'.tr()),
                        _buildDropdownField(
                            context: context,
                            hintText: 'Select Category'.tr(),
                            value: myPropertyCubit.selectedCategoryType,
                            onChanged: (value) {
                              myPropertyCubit.selectCategory(
                                  categoryType: value!,
                                  updateProperty: widget.updateProperty);
                            },
                            items: myPropertyCubit.category),
                        ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return Column(
                                spacing: 15.h,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                /*          initiallyExpanded: true,
                            onExpansionChanged: (bool isExpanded) {

                            },
                            tilePadding: EdgeInsets.all(0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r)
                            ),
                            backgroundColor: AppColors.colorBGSheet,
                            collapsedBackgroundColor: AppColors.colorBGSheet,
                            title: ,
                            collapsedShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r)
                            ),
                            collapsedIconColor:AppColors.colorBlack ,
                            iconColor: AppColors.colorBlack ,*/
                                children: [
                                  if (index == 0)
                                    Text('Facilities'.tr(),
                                        style:
                                        TextStyles.font20BlackMedium),
                                  if (myPropertyCubit
                                      .amenityValueData[index].type ==
                                      AMENITY_TYPE_TEXT_BOX)
                                    _buildLabelWithAsterisk(
                                        myPropertyCubit
                                            .amenityValueData[index].title
                                            .toString()),
                                  if (myPropertyCubit
                                      .amenityValueData[index].type ==
                                      AMENITY_TYPE_TEXT_BOX)
                                    AmenityTextFiledComponent(
                                      amenityID: myPropertyCubit
                                          .amenityValueData[index].id,
                                      amenityValueData: myPropertyCubit
                                          .amenityValueData[index].title,
                                      isUpdate: widget.updateProperty??false,
                                      amenityType: AMENITY_TYPE_TEXT_BOX,
                                      onUpdate: (p0, id) =>
                                          myPropertyCubit
                                              .updateRadioBtnData(p0, id),
                                      updatedValue: (myPropertyCubit
                                          .newAmenityValueData !=
                                          null &&
                                          myPropertyCubit
                                              .newAmenityValueData!
                                              .isNotEmpty) &&
                                          !myPropertyCubit
                                              .isCategoryChanged
                                          ? myPropertyCubit
                                          .newAmenityValueData![index]
                                          .value
                                          : '',
                                      // updatedValue: '',
                                    ),
                                  if (myPropertyCubit
                                      .amenityValueData[index].type ==
                                      AMENITY_TYPE_TEXTAREA)
                                    _buildLabelWithAsterisk(
                                        myPropertyCubit
                                            .amenityValueData[index].title
                                            .toString()),
                                  if (myPropertyCubit
                                      .amenityValueData[index].type ==
                                      AMENITY_TYPE_TEXTAREA)
                                    AmenityTextFiledComponent(
                                      amenityID: myPropertyCubit
                                          .amenityValueData[index].id,
                                      amenityType: AMENITY_TYPE_TEXTAREA,
                                      amenityValueData: myPropertyCubit
                                          .amenityValueData[index].title,
                                      isUpdate:widget.updateProperty??false,
                                      onUpdate: (p0, id) =>
                                          myPropertyCubit
                                              .updateRadioBtnData(p0, id),
                                      updatedValue: (myPropertyCubit
                                          .newAmenityValueData !=
                                          null &&
                                          myPropertyCubit
                                              .newAmenityValueData!
                                              .isNotEmpty) &&
                                          !myPropertyCubit
                                              .isCategoryChanged
                                          ? myPropertyCubit
                                          .newAmenityValueData![index]
                                          .value
                                          : '',
                                    ),
                                  if (myPropertyCubit
                                      .amenityValueData[index].type ==
                                      AMENITY_TYPE_DROPDOWN)
                                    _buildLabelWithAsterisk(
                                        myPropertyCubit
                                            .amenityValueData[index].title
                                            .toString()),
                                  if (myPropertyCubit
                                      .amenityValueData[index].type ==
                                      AMENITY_TYPE_DROPDOWN)
                                    DropDownComponent(
                                      dropdownValues: myPropertyCubit
                                          .amenityValueData[index].value,
                                      amenityId: myPropertyCubit
                                          .amenityValueData[index].id,
                                      onUpdate: (p0, id) =>
                                          myPropertyCubit
                                              .updateRadioBtnData(p0, id),
                                      isUpdateProperty:widget.updateProperty??false,
                                      selectedDropDownValue: (myPropertyCubit
                                          .newAmenityValueData !=
                                          null &&
                                          myPropertyCubit
                                              .newAmenityValueData!
                                              .isNotEmpty) &&
                                          !myPropertyCubit
                                              .isCategoryChanged
                                          ? myPropertyCubit
                                          .newAmenityValueData![index]
                                          .value
                                          : '',
                                    ),
                                  if (myPropertyCubit
                                      .amenityValueData[index].type ==
                                      AMENITY_TYPE_RADIO_BUTTON)
                                    _buildLabelWithAsterisk(
                                        myPropertyCubit
                                            .amenityValueData[index].title
                                            .toString()),
                                  if (myPropertyCubit
                                      .amenityValueData[index].type ==
                                      AMENITY_TYPE_RADIO_BUTTON)
                                    RadioComponent(
                                      radioValues: myPropertyCubit
                                          .amenityValueData[index].value,
                                      amenityId: myPropertyCubit
                                          .amenityValueData[index].id,
                                      onUpdate: (p0, id) =>
                                          myPropertyCubit
                                              .updateRadioBtnData(p0, id),
                                      isUpdateProperty:widget.updateProperty??false,
                                      selectedRadioValue: (myPropertyCubit
                                          .newAmenityValueData !=
                                          null &&
                                          myPropertyCubit
                                              .newAmenityValueData!
                                              .isNotEmpty) &&
                                          !myPropertyCubit
                                              .isCategoryChanged
                                          ? myPropertyCubit
                                          .newAmenityValueData![index]
                                          .value
                                          .toString()
                                          : '',
                                    ),
                                  if (myPropertyCubit
                                      .amenityValueData[index].type ==
                                      AMENITY_TYPE_CHECKBOX)
                                    _buildLabelWithAsterisk(
                                        myPropertyCubit
                                            .amenityValueData[index].title
                                            .toString()),
                                  if (myPropertyCubit
                                      .amenityValueData[index].type ==
                                      AMENITY_TYPE_CHECKBOX)
                                    CheckBoxComponent(
                                      //propertyId: idProperty,
                                      checkboxValues: myPropertyCubit
                                          .amenityValueData[index].value,
                                      amenityId: myPropertyCubit
                                          .amenityValueData[index].id,
                                      pId: widget.idProperty,
                                      onUpdate: (p0, id) =>
                                          myPropertyCubit
                                              .updateCheckBoxData(p0, id),
                                      isUpdateProperty:widget.updateProperty??false,
                                      newCheckboxValues: (myPropertyCubit
                                          .newAmenityValueData !=
                                          null &&
                                          myPropertyCubit
                                              .newAmenityValueData!
                                              .isNotEmpty) &&
                                          !myPropertyCubit
                                              .isCategoryChanged
                                          ? myPropertyCubit
                                          .newAmenityValueData![index]
                                          .value
                                          : [],
                                    ),
                                  if (myPropertyCubit
                                      .amenityValueData[index].type ==
                                      AMENITY_TYPE_NUMBER)
                                    _buildLabelWithAsterisk(
                                        myPropertyCubit
                                            .amenityValueData[index].title
                                            .toString()),
                                  if (myPropertyCubit
                                      .amenityValueData[index].type ==
                                      AMENITY_TYPE_NUMBER)
                                    AmenityTextFiledComponent(
                                      amenityID: myPropertyCubit
                                          .amenityValueData[index].id,
                                      amenityValueData: myPropertyCubit
                                          .amenityValueData[index].title,
                                      isUpdate: widget.updateProperty??false,
                                      onUpdate: (p0, id) =>
                                          myPropertyCubit
                                              .updateRadioBtnData(p0, id),
                                      amenityType: AMENITY_TYPE_NUMBER,
                                      updatedValue: (myPropertyCubit
                                          .newAmenityValueData !=
                                          null &&
                                          myPropertyCubit
                                              .newAmenityValueData!
                                              .isNotEmpty) &&
                                          !myPropertyCubit
                                              .isCategoryChanged
                                          ? myPropertyCubit
                                          .newAmenityValueData![index]
                                          .value
                                          : '',
                                    ),
                                ],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 10.h,
                              );
                            },
                            itemCount:
                            myPropertyCubit.amenityValueData.length),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  _buildLabelWithAsterisk('Price'.tr()),
                                  SizedBox(height: 8.h),
                                  AuthTextFormField(
                                      textInputType: TextInputType.number,
                                      hintText: 'Price'.tr(),
                                      controller:
                                      myPropertyCubit.priceController,
                                      validator: (p0) {
                                        if (p0 == null) {
                                          return "Required".tr();
                                        }
                                        if (p0.isEmpty) {
                                          return "Required".tr();
                                        }
                                        return null;
                                      }),
                                ],
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  _buildLabelWithAsterisk(
                                      'Property Name'.tr()),
                                  SizedBox(height: 8.h),
                                  AuthTextFormField(
                                      textInputType: TextInputType.text,
                                      hintText: 'Name'.tr(),
                                      controller:
                                      myPropertyCubit.nameController,
                                      validator: (p0) {
                                        if (p0 == null) {
                                          return "Required".tr();
                                        }
                                        if (p0.isEmpty) {
                                          return "Required".tr();
                                        }
                                        return null;
                                      }),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Text('Furnished Type'.tr(),
                            style: TextStyles.font15MediumBlackRegular),
                        Row(
                          children: [
                            _buildRadioOption(
                              isActive:
                              myPropertyCubit.furnishedType == 0,
                              label: myPropertyCubit.furnishedTypeList[0]
                                  .tr(),
                              onChanged: () =>
                                  myPropertyCubit
                                      .selectPropertyFurnished(0),
                            ),
                            _buildRadioOption(
                              isActive:
                              myPropertyCubit.furnishedType == 1,
                              label: myPropertyCubit.furnishedTypeList[1]
                                  .tr(),
                              onChanged: () =>
                                  myPropertyCubit
                                      .selectPropertyFurnished(1),
                            ),
                            _buildRadioOption(
                              isActive:
                              myPropertyCubit.furnishedType == 2,
                              label: myPropertyCubit.furnishedTypeList[2]
                                  .tr(),
                              onChanged: () =>
                                  myPropertyCubit
                                      .selectPropertyFurnished(2),
                            ),
                          ],
                        ),
                        Text('Seller Type'.tr(),
                            style: TextStyles.font15MediumBlackRegular),
                        Row(
                          children: [
                            _buildRadioOption(
                              isActive: myPropertyCubit.sellerType == 0,
                              label: myPropertyCubit.propertySellerType[0]
                                  .tr(),
                              onChanged: () =>
                                  myPropertyCubit.selectPropertySeller(0),
                            ),
                            _buildRadioOption(
                              isActive: myPropertyCubit.sellerType == 1,
                              label: myPropertyCubit.propertySellerType[1]
                                  .tr(),
                              onChanged: () =>
                                  myPropertyCubit.selectPropertySeller(1),
                            ),
                            _buildRadioOption(
                              isActive: myPropertyCubit.sellerType == 2,
                              label: myPropertyCubit.propertySellerType[2]
                                  .tr(),
                              onChanged: () =>
                                  myPropertyCubit.selectPropertySeller(2),
                            ),
                          ],
                        ),
                        Text('Property For'.tr(),
                            style: TextStyles.font15MediumBlackRegular),
                        Row(
                          children: [
                            _buildRadioOption(
                              isActive: myPropertyCubit.propertyFor == 0,
                              label:
                              myPropertyCubit.propertyForList[0].tr(),
                              onChanged: () =>
                                  myPropertyCubit.selectPropertyFor(0),
                            ),
                            _buildRadioOption(
                              isActive: myPropertyCubit.propertyFor == 1,
                              label:
                              myPropertyCubit.propertyForList[1].tr(),
                              onChanged: () =>
                                  myPropertyCubit.selectPropertyFor(1),
                            ),
                            _buildRadioOption(
                              isActive: myPropertyCubit.propertyFor == 2,
                              label:
                              myPropertyCubit.propertyForList[2].tr(),
                              onChanged: () =>
                                  myPropertyCubit.selectPropertyFor(2),
                            ),
                          ],
                        ),
                        if (myPropertyCubit.propertyFor != 1)
                          Text('Price Duration'.tr(),
                              style: TextStyles.font15MediumBlackRegular),
                        if (myPropertyCubit.propertyFor != 1)
                          _buildDropdownField(
                            context: context,
                            hintText: 'Price Duration'.tr(),
                            value: myPropertyCubit
                                .selectedPriceDurationValue,
                            onChanged: (value) {
                              myPropertyCubit
                                  .selectPropertyPriceDuration(value!);
                            },
                            items: myPropertyCubit.priceDurationList,
                          ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  _buildLabelWithAsterisk(
                                      'Age of Property(Year)'.tr()),
                                  SizedBox(height: 8.h),
                                  AuthTextFormField(
                                      textInputType: TextInputType.number,
                                      hintText: 'Age'.tr(),
                                      controller:
                                      myPropertyCubit.ageController,
                                      validator: (p0) {
                                        if (p0 == null) {
                                          return "Required".tr();
                                        }
                                        if (p0.isEmpty) {
                                          return "Required".tr();
                                        }
                                        return null;
                                      }),
                                ],
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  _buildLabelWithAsterisk(
                                      'Maintenance Charges'.tr()),
                                  SizedBox(height: 8.h),
                                  AuthTextFormField(
                                      textInputType: TextInputType.number,
                                      hintText:
                                      'Maintenance Charges'.tr(),
                                      maxLines: 1,
                                      controller: myPropertyCubit
                                          .maintenanceController,
                                      validator: (p0) {
                                        if (p0 == null) {
                                          return "Required".tr();
                                        }
                                        if (p0.isEmpty) {
                                          return "Required".tr();
                                        }
                                        return null;
                                      }),
                                ],
                              ),
                            ),
                          ],
                        ),
                        _buildLabelWithAsterisk('Security Deposit'.tr()),
                        AuthTextFormField(
                            textInputType: TextInputType.number,
                            hintText: 'Security Deposit'.tr(),
                            maxLines: 1,
                            controller:
                            myPropertyCubit.securityDepositController,
                            validator: (p0) {
                              if (p0 == null) {
                                return "Required".tr();
                              }
                              if (p0.isEmpty) {
                                return "Required".tr();
                              }
                              return null;
                            }),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  _buildLabelWithAsterisk(
                                      'Brokerage'.tr()),
                                  SizedBox(height: 8.h),
                                  AuthTextFormField(
                                      maxLines: 1,
                                      textInputType: TextInputType.number,
                                      hintText: 'Brokerage'.tr(),
                                      controller: myPropertyCubit
                                          .brokerAgeController,
                                      validator: (p0) {
                                        if (p0 == null) {
                                          return "Required".tr();
                                        }
                                        if (p0.isEmpty) {
                                          return "Required".tr();
                                        }
                                        return null;
                                      }),
                                ],
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  _buildLabelWithAsterisk('BHK'.tr()),
                                  SizedBox(height: 8.h),
                                  _buildDropdownField(
                                      context: context,
                                      hintText: 'None'.tr(),
                                      value: myPropertyCubit
                                          .selectedBhkValue,
                                      onChanged: (value) {
                                        myPropertyCubit
                                            .selectPropertyBhk(value!);
                                      },
                                      items: myPropertyCubit.bhkList),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  _buildLabelWithAsterisk(
                                      'Square Feet Area'.tr()),
                                  SizedBox(height: 8.h),
                                  AuthTextFormField(
                                      textInputType: TextInputType.number,
                                      maxLines: 1,
                                      hintText: 'Square Feet Area'.tr(),
                                      controller: myPropertyCubit
                                          .squareFeetAreaAgeController,
                                      validator: (p0) {
                                        if (p0 == null) {
                                          return "Required".tr();
                                        }
                                        if (p0.isEmpty) {
                                          return "Required".tr();
                                        }
                                        return null;
                                      }),
                                ],
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  _buildLabelWithAsterisk('Status'.tr()),
                                  SizedBox(height: 8.h),
                                  _buildDropdownField(
                                    context: context,
                                    hintText: 'Status'.tr(),
                                    value: myPropertyCubit
                                        .selectedStatusValue,
                                    onChanged: (value) {
                                      myPropertyCubit
                                          .selectPropertyStatus(value);
                                    },
                                    items: myPropertyCubit.statusList,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Text('Premium Property'.tr(),
                            style: TextStyles.font15MediumBlackRegular),
                        Row(
                          children: [
                            _buildRadioOption(
                              isActive: myPropertyCubit
                                  .selectedPremiumPropertyIndex ==
                                  1,
                              label:
                              myPropertyCubit.premiumProperty[0].tr(),
                              onChanged: () =>
                                  myPropertyCubit
                                      .selectPropertyPremiumProperty(1),
                            ),
                            SizedBox(width: 16.w),
                            _buildRadioOption(
                              isActive: myPropertyCubit
                                  .selectedPremiumPropertyIndex ==
                                  0,
                              label:
                              myPropertyCubit.premiumProperty[1].tr(),
                              onChanged: () =>
                                  myPropertyCubit
                                      .selectPropertyPremiumProperty(0),
                            ),
                          ],
                        ),
                        _buildLabelWithAsterisk('Description'.tr()),
                        AuthTextFormField(
                            textInputType: TextInputType.multiline,
                            hintText: 'Description'.tr(),
                            maxLines: 5,
                            controller:
                            myPropertyCubit.descriptionController,
                            validator: (p0) {
                              if (p0 == null) {
                                return "Required".tr();
                              }
                              if (p0.isEmpty) {
                                return "Required".tr();
                              }
                              return null;
                            }),
                        // Location Section
                        BlocConsumer<GoogleMapCubit, GoogleMapState>(
                          listener: (context, state) {
                            if (state is AddData) {
                              if (GoogleMapCubit
                                  .get(context)
                                  .selectedModel != null) {
                                myPropertyCubit.addData(GoogleMapCubit
                                    .get(context)
                                    .selectedModel!);
                              }
                            }
                          },
                          builder: (context, state) {
                            return Stack(
                              alignment: AlignmentDirectional.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: 15.h,
                                  children: [
                                    Text('Select Location'.tr(),
                                        style: TextStyles.font20BlackMedium),
                                    InkWell(
                                      onTap: () {
                                        navigateTo(GoogleMapScreen());
                                      },
                                      child: Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                            BorderRadius.circular(8.r),
                                            child: Image.asset(
                                              AppImage.map,
                                              fit: BoxFit.cover,
                                              width: double.infinity,
                                              height: 180.h,
                                            ),
                                          ),
                                          Positioned(
                                            right: 16.w,
                                            bottom: 16.h,
                                            child: Container(
                                              padding: EdgeInsets.all(8.r),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.colorBlack,
                                              ),
                                              child: Icon(
                                                Icons.location_on_outlined,
                                                size: 24.sp,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              _buildLabelWithAsterisk(
                                                  'Country'.tr()),
                                              SizedBox(height: 8.h),
                                              AuthTextFormField(
                                                  textInputType:
                                                  TextInputType.text,
                                                  hintText: 'Country'.tr(),
                                                  controller: myPropertyCubit
                                                      .countryController,
                                                  readOnly: true,
                                                  validator: (p0) {
                                                    if (p0 == null) {
                                                      return "Required".tr();
                                                    }
                                                    if (p0.isEmpty) {
                                                      return "Required".tr();
                                                    }
                                                    return null;
                                                  }),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 12.w),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              _buildLabelWithAsterisk(
                                                  'State'.tr()),
                                              SizedBox(height: 8.h),
                                              AuthTextFormField(
                                                  textInputType:
                                                  TextInputType.text,
                                                  hintText: 'State'.tr(),
                                                  controller: myPropertyCubit
                                                      .stateController,
                                                  readOnly: true,
                                                  validator: (p0) {
                                                    if (p0 == null) {
                                                      return "Required".tr();
                                                    }
                                                    if (p0.isEmpty) {
                                                      return "Required".tr();
                                                    }
                                                    return null;
                                                  }),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    // City and City Area
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              _buildLabelWithAsterisk(
                                                  'City'.tr()),
                                              SizedBox(height: 8.h),
                                              AuthTextFormField(
                                                  textInputType:
                                                  TextInputType.text,
                                                  hintText: 'City'.tr(),
                                                  controller: myPropertyCubit
                                                      .cityController,
                                                  readOnly: true,
                                                  validator: (p0) {
                                                    if (p0 == null) {
                                                      return "Required".tr();
                                                    }
                                                    if (p0.isEmpty) {
                                                      return "Required".tr();
                                                    }
                                                    return null;
                                                  }),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 12.w),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              _buildLabelWithAsterisk(
                                                  'City Ar'.tr()),
                                              SizedBox(height: 8.h),
                                              AuthTextFormField(
                                                  textInputType:
                                                  TextInputType.text,
                                                  hintText: 'City Ar'.tr(),
                                                  controller: myPropertyCubit
                                                      .cityArController,
                                                  readOnly: true,
                                                  validator: (p0) {
                                                    if (p0 == null) {
                                                      return "Required".tr();
                                                    }
                                                    if (p0.isEmpty) {
                                                      return "Required".tr();
                                                    }
                                                    return null;
                                                  }),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    _buildLabelWithAsterisk('Address'.tr()),
                                    AuthTextFormField(
                                        textInputType: TextInputType.text,
                                        hintText: 'Address'.tr(),
                                        controller:
                                        myPropertyCubit.addressController,
                                        readOnly: true,
                                        validator: (p0) {
                                          if (p0 == null) {
                                            return "Required".tr();
                                          }
                                          if (p0.isEmpty) {
                                            return "Required".tr();
                                          }
                                          return null;
                                        }),
                                  ],
                                ),
                                if(GoogleMapCubit
                                    .get(context)
                                    .loading)Loader(),
                              ],
                            );
                          },
                        ),
                        Text('Images'.tr(),
                            style: TextStyles.font20BlackMedium),
                        InkWell(
                          onTap: () {
                            NewCustomBottomSheet.showModalBottom(context,
                                initialChildSize: 0.32,
                              child: PickImageModalBottomSheet(
                                onPressedPhotos: () async {
                                  await myPropertyCubit.pickImage(
                                    imageSource: ImageSource.gallery,
                                  );
                                  Navigator.of(context).pop();
                                },
                                onPressedCamera: () async {
                                  await myPropertyCubit.pickImage(
                                    imageSource: ImageSource.camera,
                                  );
                                  Navigator.of(context).pop();
                                },
                              ),
                            );
                          },
                          child: Container(
                            height: 110.h,
                            padding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 14.w),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.colorWhite,
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(
                                  color: AppColors
                                      .colorMediumGrayBorderTextForm),
                            ),
                            child: Row(
                              children: [
                                if (myPropertyCubit.imageCover != null)
                                  Container(
                                      width: 90.w,
                                      height: 90.h,
                                      decoration: BoxDecoration(
                                          color: AppColors
                                              .colorVeryLightGrayishPink,
                                          borderRadius:
                                          BorderRadius.circular(8.r)),
                                      child: ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(8.r),
                                        child: myPropertyCubit.imageCover
                                        is String
                                            ? Image.network(
                                          myPropertyCubit
                                              .imageCover,
                                          fit: BoxFit.fill,
                                        )
                                            : Image.file(
                                          myPropertyCubit
                                              .imageCover!,
                                          fit: BoxFit.fill,
                                        ),
                                      )),
                                if (myPropertyCubit.imageCover == null)
                                  Container(
                                    width: 90.w,
                                    height: 90.h,
                                    decoration: BoxDecoration(
                                        color: AppColors
                                            .colorVeryLightGrayishPink,
                                        borderRadius:
                                        BorderRadius.circular(8.r)),
                                    child: Icon(
                                      Icons.cloud_upload,
                                      size: 32.sp,
                                      color: AppColors
                                          .colorMediumGrayBorderTextForm,
                                    ),
                                  ),
                                SizedBox(width: 12.w),
                                Text('Choose Cover'.tr(),
                                    style: TextStyles
                                        .font15MediumBlackRegular),
                              ],
                            ),
                          ),
                        ),
                        if (myPropertyCubit.imageGallary.isEmpty)
                          InkWell(
                            onTap: () async {
                              NewCustomBottomSheet.showModalBottom(
                                context,
                                  initialChildSize: 0.32,
                                child: PickImageModalBottomSheet(
                                  onPressedPhotos: () async {
                                    await myPropertyCubit
                                        .pickImageMultipleImage();
                                   // Navigator.of(context).pop();
                                  },
                                  onPressedCamera: () async {
                                    await myPropertyCubit
                                        .pickImageGallary(
                                      imageSource: ImageSource.camera,
                                    );
                               //     Navigator.of(context).pop();
                                  },
                                ),
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              height: 110.h,
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.h, horizontal: 14.w),
                              decoration: BoxDecoration(
                                color: AppColors.colorWhite,
                                borderRadius: BorderRadius.circular(8.r),
                                border: Border.all(
                                    color: AppColors
                                        .colorMediumGrayBorderTextForm),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 90.w,
                                    height: 90.h,
                                    decoration: BoxDecoration(
                                        color: AppColors
                                            .colorVeryLightGrayishPink,
                                        borderRadius:
                                        BorderRadius.circular(8.r)),
                                    child: Icon(
                                      Icons.cloud_upload,
                                      size: 32.sp,
                                      color: AppColors
                                          .colorMediumGrayBorderTextForm,
                                    ),
                                  ),
                                  SizedBox(width: 12.w),
                                  Text('Choose Property'.tr(),
                                      style: TextStyles
                                          .font15MediumBlackRegular),
                                ],
                              ),
                            ),
                          ),
                        if (myPropertyCubit.imageGallary.isNotEmpty)
                          Container(
                            width: double.infinity,
                            height: 110.h,
                            padding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 14.w),
                            decoration: BoxDecoration(
                              color: AppColors.colorWhite,
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(
                                  color: AppColors
                                      .colorMediumGrayBorderTextForm),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return Row(
                                          children: [
                                            Stack(
                                              alignment:
                                              AlignmentDirectional
                                                  .topEnd,
                                              children: [
                                                Container(
                                                    width: 90.w,
                                                    height: 90.h,
                                                    decoration: BoxDecoration(
                                                        color: AppColors
                                                            .colorVeryLightGrayishPink,
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            8.r)),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          8.r),
                                                      child: myPropertyCubit
                                                          .imageGallary[
                                                      index] is String
                                                          ? Image.network(
                                                        myPropertyCubit
                                                            .imageGallary[
                                                        index],
                                                        fit: BoxFit
                                                            .fill,
                                                      )
                                                          : Image.file(
                                                        myPropertyCubit
                                                            .imageGallary[
                                                        index],
                                                        fit: BoxFit
                                                            .fill,
                                                      ),
                                                    )),
                                                InkWell(
                                                  onTap: () {
                                                    myPropertyCubit
                                                        .remove(index);
                                                  },
                                                  child: Icon(
                                                    Icons.cancel,
                                                    color: AppColors
                                                        .colorBlack,
                                                    size: 30.sp,
                                                  ),
                                                )
                                              ],
                                            ),
                                            if (index ==
                                                myPropertyCubit
                                                    .imageGallary
                                                    .length -
                                                    1)
                                              SizedBox(width: 12.w),
                                            if (index ==
                                                myPropertyCubit
                                                    .imageGallary
                                                    .length -
                                                    1)
                                              InkWell(
                                                onTap: () async {
                                                  NewCustomBottomSheet
                                                      .showModalBottom(
                                                    initialChildSize: 0.32,
                                                    context,
                                                    child:
                                                    PickImageModalBottomSheet(
                                                      onPressedPhotos:
                                                          () async {
                                                        await myPropertyCubit
                                                            .pickImageMultipleImage();
                                                        Navigator.of(
                                                            context)
                                                            .pop();
                                                      },
                                                      onPressedCamera:
                                                          () async {
                                                        await myPropertyCubit
                                                            .pickImageGallary(
                                                          imageSource:
                                                          ImageSource
                                                              .camera,
                                                        );
                                                        Navigator.of(
                                                            context)
                                                            .pop();
                                                      },
                                                    ),
                                                  );
                                                },
                                                child: Container(
                                                  width: 30.w,
                                                  height: 30.h,
                                                  decoration:
                                                  BoxDecoration(
                                                    color: AppColors
                                                        .colorWhite,
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        8.r),
                                                    border: Border.all(
                                                        color: AppColors
                                                            .colorMediumGrayBorderTextForm),
                                                  ),
                                                  child: Icon(Icons.add),
                                                ),
                                              )
                                          ],
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return SizedBox(width: 12.w);
                                      },
                                      itemCount: myPropertyCubit
                                          .imageGallary.length),
                                ),
                              ],
                            ),
                          ),
                        Text('Video URL'.tr(),
                            style: TextStyles.font15MediumBlackRegular),
                        AuthTextFormField(
                            textInputType: TextInputType.url,
                            hintText: 'Video URL'.tr(),
                            controller:
                            myPropertyCubit.videoUrlController,
                            validator: (p0) {
                              if (p0 == null) {
                                return null;
                              }
                              if (p0.isEmpty) {
                                return null;
                              }
                              if (p0.isNotEmpty &&
                                  !p0.contains('https')) {
                                return "Must contain https".tr();
                              }
                              if (p0.isNotEmpty &&
                                  !p0.contains('youtube')) {
                                return "Must be a YouTube video".tr();
                              }
                              return null;
                            }),
                        /*   Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(vertical: 10.h, horizontal: 14.w),
                      decoration: BoxDecoration(
                        color: AppColors.colorWhite,
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(
                            color: AppColors.colorMediumGrayBorderTextForm),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 70.w,
                            height: 70.h,
                            decoration: BoxDecoration(
                                color: AppColors.colorVeryLightGrayishPink,
                                borderRadius: BorderRadius.circular(8.r)),
                            child: Icon(
                              Icons.video_camera_back_sharp,
                              size: 32.sp,
                              color: AppColors.colorMediumGrayBorderTextForm,
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Text('Video URL'.tr(),
                              style: TextStyles.font15MediumBlackRegular),
                        ],
                      ),
                    ),*/

                        MasterButton(
                          isLoading: state is SavePropertyLoadingState,
                          onPressed: () {
                            if (myPropertyCubit.formKey.currentState!
                                .validate()) {
                              if (myPropertyCubit.selectedBhkIndex !=
                                  null) {
                                if (myPropertyCubit.indexOfCategoryType !=
                                    null) {
                                  if (myPropertyCubit.imageCover !=
                                      null) {
                                    if (myPropertyCubit
                                        .imageGallary.isNotEmpty) {
                                      bool isDone = true;
                                      for (var i in myPropertyCubit
                                          .dynamicAmenityList) {
                                        print(i.dynamicAmenityValue
                                            .toString());
                                        if (i.dynamicAmenityValue ==
                                            null) {
                                          isDone = false;
                                        }
                                      }
                                      if (isDone) {
                                        if (widget.updateProperty ==
                                            true) {
                                          myPropertyCubit.saveProperty(
                                              context,
                                              propertyId:
                                              widget.idProperty,
                                              updateProperty: true);
                                        } else {
                                          myPropertyCubit
                                              .saveProperty(context);
                                        }
                                      } else {
                                        toast(
                                            "please Select amenity".tr());
                                      }
                                    } else {
                                      toast(
                                          "please Select Gallery Picture"
                                              .tr());
                                    }
                                  } else {
                                    toast("please Select Cover Picture"
                                        .tr());
                                  }
                                } else {
                                  toast("Please choose Select Category"
                                      .tr());
                                }
                              } else {
                                toast("Please choose Bhk".tr());
                              }
                            }
                          },
                          text: 'save'.tr(),
                        ),
                        SizedBox(height: 50.h),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildLabelWithAsterisk(String label) {
    return Row(
      children: [
        Text(label, style: TextStyles.font15MediumBlackRegular),
        SizedBox(width: 4.w),
        Text('*', style: TextStyle(color: Colors.red, fontSize: 14.sp)),
      ],
    );
  }

  Widget _buildRadioOption<T>({
    required bool isActive,
    required String label,
    required void Function() onChanged,
  }) {
    return InkWell(
      onTap: onChanged,
      child: SizedBox(
        width: 120.w,
        child: Row(
          spacing: 4.w,
          children: [
            isActive
                ? SvgPicture.asset(AppImage.active)
                : SvgPicture.asset(AppImage.inactive),
            Text(label.tr(), style: TextStyles.font15MediumBlackRegular),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownField({
    required BuildContext context,
    required String hintText,
    required String? value,
    required ValueChanged<String?> onChanged,
    required List<String> items,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: AppColors.colorWhite,
        border: Border.all(color: AppColors.colorMediumGrayBorderTextForm),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          hint: Text(hintText, style: TextStyles.font14ExtraGrayRegular),
          isExpanded: true,
          icon: Icon(Icons.keyboard_arrow_down, color: AppColors.colorBlack),
          style: TextStyles.font14BlackMedium,
          onChanged: onChanged,
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value.tr()),
            );
          }).toList(),
        ),
      ),
    );
  }
}
