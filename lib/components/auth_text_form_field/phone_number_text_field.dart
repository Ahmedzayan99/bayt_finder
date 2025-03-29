import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:intl_phone_number_input/intl_phone_number_input_test.dart';
import 'package:intl_phone_number_input/src/models/country_model.dart';
import 'package:intl_phone_number_input/src/providers/country_provider.dart';
import 'package:intl_phone_number_input/src/utils/phone_number.dart';
import 'package:intl_phone_number_input/src/utils/phone_number/phone_number_util.dart';
import 'package:intl_phone_number_input/src/utils/util.dart';
import 'package:intl_phone_number_input/src/utils/widget_view.dart';
import '../../utils/colors.dart';
import 'auth_text_form_field.dart';
import 'package:intl_phone_number_input/src/widgets/countries_search_list_widget.dart';
import '../../utils/styles.dart';


class CustomInternationalPhoneNumberInput extends StatefulWidget {
  final ValueChanged<PhoneNumber>? onInputChanged;
  final Function()? onTap;
  final ValueChanged<bool>? onInputValidated;
  final VoidCallback? onSubmit;
  final Key? fieldKey;
  final ValueChanged<String>? onFieldSubmitted;
  final String? Function(String?)? validator;
  final ValueChanged<PhoneNumber>? onSaved;
  final TextEditingController? textFieldController;
  final PhoneNumber? initialValue;
  final String? hintText;

  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? errorMessage;
  final int maxLength;
  final String? locale;
  final List<String>? countries;
  final bool isSpace;
  final FocusNode? focusNode;
  final Decoration? decorationSelect;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final Color? fillColor;
  final double selectorButtonOnErrorPadding;
  final bool ignoreBlank;

  final TextInputType keyboardType;
  final TextInputAction? keyboardAction;

  /// Ignored if [setSelectorButtonAsPrefixIcon = true]
  final double spaceBetweenSelectorAndTextField;

  final bool isEnabled;
  final bool readOnly;
  final bool formatInput;
  final bool autoFocus;
  final bool autoFocusSearch;
  final AutovalidateMode autoValidateMode;
  final bool countrySelectorScrollControlled;
  final TextStyle? textStyle;
  final TextStyle? selectorTextStyle;
  final InputBorder? inputBorder;
  final InputDecoration? inputDecoration;
  final InputDecoration? searchBoxDecoration;
  final Color? cursorColor;
  final TextAlign textAlign;
  final TextAlignVertical textAlignVertical;
  final EdgeInsets scrollPadding;

  final Iterable<String>? autofillHints;

/*  BoxDecoration(
  color: AppColors.colorWhite,
  borderRadius: BorderRadius.circular(10.r),
  border: Border.all(
  color: AppColors.colorGreyMainBackGround4,
  width: 1,
  ),
  ),*/
  const CustomInternationalPhoneNumberInput({
    super.key,
    required this.onInputChanged,
    this.onInputValidated,
    this.onSubmit,
    this.onFieldSubmitted,
    this.validator,
    this.onSaved,
    this.textFieldController,
    this.initialValue,
    this.hintText,
    this.errorMessage = 'Invalid phone number',
    this.maxLength = 15,
    this.locale,
    this.countries,
    this.isSpace = false,
    this.readOnly = false,
    this.prefixIcon,
    this.focusNode,
    this.decorationSelect,
    this.border,
    this.focusedBorder,
    this.onTap,
    this.fillColor,
    this.selectorButtonOnErrorPadding = 24,
    this.ignoreBlank = false,
    this.fieldKey,
    this.keyboardAction,
    this.keyboardType = TextInputType.phone,
    this.spaceBetweenSelectorAndTextField = 12,
    this.isEnabled = true,
    this.formatInput = true,
    this.autoFocus = false,
    this.autoFocusSearch = false,
    this.autoValidateMode = AutovalidateMode.disabled,
    this.countrySelectorScrollControlled = true,
    this.textStyle,
    this.selectorTextStyle,
    this.inputBorder,
    this.inputDecoration,
    this.searchBoxDecoration,
    this.textAlign = TextAlign.start,
    this.textAlignVertical = TextAlignVertical.center,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.cursorColor,
    this.autofillHints, this.suffixIcon,
  });

  @override
  State<StatefulWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<CustomInternationalPhoneNumberInput> {
  TextEditingController? controller;
  double selectorButtonBottomPadding = 0;

  Country? country;
  List<Country> countries = [];
  bool isNotValid = true;
  Decoration? decorationSelect;

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();
    loadCountries();
    controller = widget.textFieldController ?? TextEditingController();
    widget.decorationSelect != null
        ? decorationSelect = widget.decorationSelect
        : decorationSelect = BoxDecoration(
        color: AppColors.colorMediumGrayTextForm,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: AppColors.colorMediumGrayBorderTextForm,
          width: 1.w,
        )
    );
    initialiseWidget();
  }

  @override
  Widget build(BuildContext context) {
    return _InputWidgetView(
      state: this,
    );
  }

  @override
  void didUpdateWidget(CustomInternationalPhoneNumberInput oldWidget) {
    loadCountries(previouslySelectedCountry: country);
    if (oldWidget.initialValue?.hash != widget.initialValue?.hash) {
      if (country!.alpha2Code != widget.initialValue?.isoCode) {
        loadCountries();
      }
      initialiseWidget();
    }
    super.didUpdateWidget(oldWidget);
  }

  /// [initialiseWidget] sets initial values of the widget
  void initialiseWidget() async {
    if (widget.initialValue != null) {
      if (widget.initialValue!.phoneNumber != null &&
          widget.initialValue!.phoneNumber!.isNotEmpty &&
          (await PhoneNumberUtil.isValidNumber(
              phoneNumber: widget.initialValue!.phoneNumber!,
              isoCode: widget.initialValue!.isoCode!))!) {
        print('ahmed');
        print(widget.initialValue!.phoneNumber);
        String phoneNumber =
        await PhoneNumber.getParsableNumber(widget.initialValue!);
        if (widget.initialValue!.dialCode == "+20") {
          controller!.text =
          "0${phoneNumber.replaceAll(RegExp(r'[^\d+]'), '')}";
        } else {
          controller!.text = phoneNumber.replaceAll(RegExp(r'[^\d+]'), '');
        }

        phoneNumberControllerListener();
      }
    }
  }

  /// loads countries from [Countries.countryList] and selected Country
  void loadCountries({Country? previouslySelectedCountry}) {
    if (mounted) {
      List<Country> countries =
      CountryProvider.getCountriesData(countries: widget.countries);

      Country country = previouslySelectedCountry ??
          Utils.getInitialSelectedCountry(
            countries,
            widget.initialValue?.isoCode ?? '',
          );
      countries = countries.toSet().toList();
      setState(() {
        this.countries = countries;
        this.country = country;
      });
    }
  }

  /// Listener that validates changes from the widget, returns a bool to
  /// the `ValueCallback` [widget.onInputValidated]
  void phoneNumberControllerListener() {
    if (mounted) {
      String parsedPhoneNumberString =
      controller!.text.replaceAll(RegExp(r'[^\d+]'), '');

      getParsedPhoneNumber(parsedPhoneNumberString, country?.alpha2Code)
          .then((phoneNumber) {
        if (phoneNumber == null) {
          String phoneNumber =
              '${country?.dialCode}$parsedPhoneNumberString';

          if (widget.onInputChanged != null) {
            widget.onInputChanged!(PhoneNumber(
                phoneNumber: phoneNumber,
                isoCode: country?.alpha2Code,
                dialCode: country?.dialCode));
          }

          if (widget.onInputValidated != null) {
            widget.onInputValidated!(false);
          }
          isNotValid = true;
        } else {
          if (widget.onInputChanged != null) {
            widget.onInputChanged!(PhoneNumber(
                phoneNumber: phoneNumber,
                isoCode: country?.alpha2Code,
                dialCode: country?.dialCode));
          }

          if (widget.onInputValidated != null) {
            widget.onInputValidated!(true);
          }
          isNotValid = false;
        }
      });
    }
  }

  /// Returns a formatted String of [phoneNumber] with [isoCode], returns `null`
  /// if [phoneNumber] is not valid or if an [Exception] is caught.
  Future<String?> getParsedPhoneNumber(String phoneNumber,
      String? isoCode) async {
    if (phoneNumber.isNotEmpty && isoCode != null) {
      try {
        bool? isValidPhoneNumber = await PhoneNumberUtil.isValidNumber(
            phoneNumber: phoneNumber, isoCode: isoCode);

        if (isValidPhoneNumber!) {
          return await PhoneNumberUtil.normalizePhoneNumber(
              phoneNumber: phoneNumber, isoCode: isoCode);
        }
      } on Exception {
        return null;
      }
    }
    return null;
  }

  /// Creates or Select [InputDecoration]

  /// Validate the phone number when a change occurs
  void onChanged(String value) {
    phoneNumberControllerListener();
  }

  /// Validate and returns a validation error when [FormState] validate is called.
  ///
  /// Also updates [selectorButtonBottomPadding]
  String? validator(String? value) {
    bool isValid =
        isNotValid && (value!.isNotEmpty || widget.ignoreBlank == false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (isValid && widget.errorMessage != null) {
        setState(() {
          selectorButtonBottomPadding = 24.h;
        });
      } else {
        setState(() {
          selectorButtonBottomPadding = 0;
        });
      }
    });

    return isValid ? widget.errorMessage!.tr() : null;
  }

  /// Changes Selector Button Country and Validate Change.
  void onCountryChanged(Country? country) {
    setState(() {
      this.country = country;
    });
    phoneNumberControllerListener();
  }

  void _phoneNumberSaved() {
    if (mounted) {
      String parsedPhoneNumberString =
      controller!.text.replaceAll(RegExp(r'[^\d+]'), '');

      String phoneNumber =
          '${country?.dialCode ?? ''}$parsedPhoneNumberString';

      widget.onSaved?.call(
        PhoneNumber(
            phoneNumber: phoneNumber,
            isoCode: country?.alpha2Code,
            dialCode: country?.dialCode),
      );
    }
  }

  /// Saved the phone number when form is saved
  void onSaved(String? value) {
    _phoneNumberSaved();
  }

  /// Corrects duplicate locale
  String? get locale {
    if (widget.locale == null) return null;

    if (widget.locale!.toLowerCase() == 'nb' ||
        widget.locale!.toLowerCase() == 'nn') {
      return 'no';
    }
    return widget.locale;
  }
}

class _InputWidgetView
    extends WidgetView<CustomInternationalPhoneNumberInput, _InputWidgetState> {
  @override
  final _InputWidgetState state;

  const _InputWidgetView({Key? key, required this.state})
      : super(key: key, state: state);

  @override
  Widget build(BuildContext context) {
    /* final countryCode = state.country?.alpha2Code ?? '';
    final dialCode = state.country?.dialCode ?? '';*/
    if (widget.isSpace) {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomSelectorButton(
                  country: state.country,
                  countries: state.countries,
                  onCountryChanged: state.onCountryChanged,
                  locale: state.locale,
                  isEnabled: widget.isEnabled,
                  decorationSelect: state.decorationSelect!,
                ),
                SizedBox(
                  height: state.selectorButtonBottomPadding,
                ),
              ],
            ),
            SizedBox(
              width: 5.w,
            ),
            Flexible(
              child: AuthTextFormField(
                readOnly:widget.readOnly,
                key: widget.fieldKey ?? Key(TestHelper.TextInputKeyValue),
                onTap: widget.onTap,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(widget.maxLength),
                  FilteringTextInputFormatter.digitsOnly,
                ],
                fillColor: widget.fillColor,
                focusedBorder: widget.focusedBorder,
                border: widget.border,
                focusNode: widget.focusNode,
                controller: state.controller,
                validator: widget.validator ?? state.validator,
                onChanged: state.onChanged,
                textInputType: TextInputType.phone,
                hintText: widget.hintText ?? 'Mobile Number..'.tr(),
                prefixIcon: widget.prefixIcon,
                obscureText: false,
                suffixIcon: widget.suffixIcon ?? SizedBox.shrink(),
              ),
            )
          ],
        ),
      );
    } else {
      return AuthTextFormField(
        key: widget.fieldKey ?? Key(TestHelper.TextInputKeyValue),
        onTap: widget.onTap,
        inputFormatters: [
          LengthLimitingTextInputFormatter(widget.maxLength),
          FilteringTextInputFormatter.digitsOnly,
        ],
        fillColor: widget.fillColor,
        focusedBorder: widget.focusedBorder,
        border: widget.border,
        focusNode: widget.focusNode,
        controller: state.controller,
        validator: widget.validator ?? state.validator,
        onChanged: state.onChanged,
        textInputType: TextInputType.phone,
        hintText: widget.hintText ?? 'Mobile Number..'.tr(),
          suffixIcon: widget.suffixIcon ?? SizedBox.shrink(),
        prefixIcon: CustomSelectorButtonNoSpace(
          country: state.country,
          countries: state.countries,
          onCountryChanged: state.onCountryChanged,
          locale: state.locale,
          isEnabled: widget.isEnabled,
          decorationSelect: state.decorationSelect!,
        ),
        readOnly:widget.readOnly,
        obscureText: false,
      );
    }
  }
}

/// [CustomSelectorButton]
class CustomSelectorButton extends StatelessWidget {
  final List<Country> countries;
  final Country? country;
  final String? locale;
  final bool isEnabled;

  final ValueChanged<Country?> onCountryChanged;
  final Decoration decorationSelect;

  const CustomSelectorButton({
    super.key,
    required this.countries,
    required this.country,
    required this.locale,
    required this.onCountryChanged,
    required this.decorationSelect,
    required this.isEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 117.w,
      height: 53.h,
      margin: EdgeInsetsDirectional.only(end: 10.w),
      decoration: decorationSelect,
      child: InkWell(
        onTap: countries.isNotEmpty && countries.length > 1 && isEnabled
            ? () async {
          Country? selected;
          selected = await showCountrySelectorDialog(context, countries);
          if (selected != null) {
            onCountryChanged(selected);
          }
        }
            : null,
        child: Row(
          children: [
            SizedBox(
              width: 8.w,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20.sp),
              child: Image.asset(
                'assets/flags/${country!.alpha2Code!.toLowerCase()}.png',
                width: 32.h,
                height: 32.h,
                package: 'intl_phone_number_input',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
            Text(
              country!.dialCode.toString(),
              style: TextStyles.font21BlackRegular,
            )
          ],
        ),
      ),
    );
  }

  Future<Country?> showCountrySelectorDialog(BuildContext inheritedContext,
      List<Country> countries) {
    return showDialog(
      context: inheritedContext,
      barrierDismissible: true,
      builder: (BuildContext context) =>
          AlertDialog(
            content: Directionality(
              textDirection: Directionality.of(inheritedContext),
              child: SizedBox(
                width: double.maxFinite,
                child: CountrySearchListWidget(
                  countries,
                  locale,
                  searchBoxDecoration: InputDecoration(
                      labelText: 'Search by country name or dial code'.tr()),
                  showFlags: true,
                  useEmoji: true,
                  autoFocus: true,
                ),
              ),
            ),
          ),
    );
  }
}

class CustomSelectorButtonNoSpace extends StatelessWidget {
  final List<Country> countries;
  final Country? country;
  final String? locale;
  final bool isEnabled;
  final ValueChanged<Country?> onCountryChanged;
  final Decoration decorationSelect;

  const CustomSelectorButtonNoSpace({
    super.key,
    required this.countries,
    required this.country,
    required this.locale,
    required this.onCountryChanged,
    required this.decorationSelect,
    required this.isEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 117.w,
      height: 50.h,
      margin: EdgeInsetsDirectional.only(end: 10.w),
      child: InkWell(
        onTap: countries.isNotEmpty && countries.length > 1 && isEnabled
            ? () async {
          Country? selected;
          selected = await showCountrySelectorDialog(context, countries);
          if (selected != null) {
            onCountryChanged(selected);
          }
        }
            : null,
        child: Row(
          spacing: 5.w,
          children: [
            SizedBox(
              width: 8.w,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20.sp),
              child: Image.asset(
                'assets/flags/${country!.alpha2Code!.toLowerCase()}.png',
                width: 32.h,
                height: 32.h,
                package: 'intl_phone_number_input',
                fit: BoxFit.cover,
              ),
            ),
            Text(
              country!.dialCode.toString(),
              style: TextStyles.font21BlackRegular,
            ),
            Container(
              width: 2.w,
              height: 25.h,
              color: AppColors.colorMediumGray,
            ),
          ],
        ),
      ),
    );
  }

  Future<Country?> showCountrySelectorDialog(BuildContext inheritedContext,
      List<Country> countries) {
    return showDialog(
      context: inheritedContext,
      barrierDismissible: true,
      builder: (BuildContext context) =>
          AlertDialog(
            content: Directionality(
              textDirection: Directionality.of(inheritedContext),
              child: SizedBox(
                width: double.maxFinite,
                child: CountrySearchListWidget(
                  countries,
                  locale,
                  searchBoxDecoration: InputDecoration(
                      labelText: 'Search by country name or dial code'.tr()),
                  showFlags: true,
                  useEmoji: true,
                  autoFocus: true,
                ),
              ),
            ),
          ),
    );
  }
}
