import 'dart:convert';
import 'dart:io';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import '../components/app_bar_components.dart';
import '../extensions/colors.dart';
import '../extensions/extension_util/context_extensions.dart';
import '../extensions/extension_util/string_extensions.dart';
import '../extensions/app_button.dart';
import '../extensions/app_text_field.dart';
import '../extensions/common.dart';
import '../extensions/decorations.dart';
import '../extensions/extension_util/int_extensions.dart';
import '../extensions/extension_util/widget_extensions.dart';
import '../extensions/system_utils.dart';
import '../extensions/text_styles.dart';
import '../main.dart';
import '../models/user_response.dart';
import '../network/network_utills.dart';
import '../utils/app_common.dart';
import '../utils/app_config.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';
import '../utils/images.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  FocusNode fNameFocus = FocusNode();
  FocusNode lNameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode phoneFocus = FocusNode();
  String? profileImg = '';
  XFile? image;

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    fNameController.text = appStore.fName;
    lNameController.text = appStore.lName;
    emailController.text = appStore.email;
    phoneController.text = appStore.phoneNo.replaceAll('+91', '');
    profileImg = appStore.profileImage;
    setState(() {});
  }

  Future getImage() async {
    image = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 100);
    setState(() {});
  }

  Future getImageFromCamera() async {
    image = await ImagePicker().pickImage(source: ImageSource.camera, imageQuality: 100);
    if (image != null) {
      setState(() {});
    }
  }

  Future save() async {
    hideKeyboard(context);
    appStore.setLoading(true);

    MultipartRequest multiPartRequest = await getMultiPartRequest('update-profile');
    multiPartRequest.fields['id'] = appStore.userId.toString();
    multiPartRequest.fields['first_name'] = fNameController.text;
    multiPartRequest.fields['last_name'] = lNameController.text;
    multiPartRequest.fields['display_name'] = "${fNameController.text} ${lNameController.text}";
    multiPartRequest.fields['email'] = emailController.text;
    multiPartRequest.fields['username'] = appStore.phoneNo.replaceAll('+', '');
    multiPartRequest.fields['contact_number'] = appStore.phoneNo;

    if (image != null) {
      multiPartRequest.files.add(await MultipartFile.fromPath('profile_image', image!.path.toString()));
    }

    multiPartRequest.headers.addAll(buildHeaderTokens());
    sendMultiPartRequest(
      multiPartRequest,
      onSuccess: (data) async {
        if ((data as String).isJson()) {
          UserResponse res = UserResponse.fromJson(jsonDecode(data));
          print(res.toJson().toString());
          appStore.setUserEmail(res.data!.email.validate());
          appStore.setFirstName(res.data!.firstName.validate());
          appStore.setUsername(res.data!.username.validate());
          appStore.setLastName(res.data!.lastName.validate());
          appStore.setUserImage(res.data!.profileImage.validate());

          appStore.setLoading(false);
          finish(context, true);
          setState(() {});
        }
      },
      onError: (error) {
        log(multiPartRequest.toString());
        toast(error.toString());
        appStore.setLoading(false);
      },
    ).catchError((e) {
      appStore.setLoading(false);
      toast(e.toString());
    });
  }

  Widget profileImage() {
    if (image != null) {
      return Container(
        padding: EdgeInsets.all(1),
        decoration: boxDecorationWithRoundedCorners(boxShape: BoxShape.circle, border: Border.all(width: 2, color: primaryColor.withOpacity(0.5))),
        child: Image.file(File(image!.path), height: 100, width: 100, fit: BoxFit.cover).cornerRadiusWithClipRRect(65),
      );
    } else if (!profileImg.isEmptyOrNull) {
      return Container(
        padding: EdgeInsets.all(1),
        decoration: boxDecorationWithRoundedCorners(boxShape: BoxShape.circle, border: Border.all(width: 2, color: primaryColor.withOpacity(0.5))),
        child: cachedImage(profileImg, width: 100, height: 100, fit: BoxFit.cover).cornerRadiusWithClipRRect(65),
      );
    } else {
      return Container(
        padding: EdgeInsets.all(1),
        decoration: boxDecorationWithRoundedCorners(boxShape: BoxShape.circle, border: Border.all(width: 2, color: primaryColor.withOpacity(0.5))),
        child: CircleAvatar(maxRadius: 50, backgroundColor: Colors.white, backgroundImage: AssetImage(ic_logo)),
      );
    }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarWidget("editProfile", context1: context, titleSpace: 0),
        bottomNavigationBar: Stack(children: [
          AppButton(
            text: "save",
            width: context.width(),
            color: primaryColor,
            elevation: 0,
            onTap: () {
              if (_formKey.currentState!.validate()) {
                save();
              }
            },
          ).paddingOnly(right: 16, bottom: 16, left: 16, top: 0),
        ]),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(decoration: boxDecorationWithRoundedCorners(boxShape: BoxShape.circle, border: Border.all(color: primaryLight, width: 3)), child: profileImage()),
                        Container(
                                padding: EdgeInsets.all(7),
                                decoration: boxDecorationWithRoundedCorners(borderRadius: radius(50), border: Border.all(color: Colors.white), backgroundColor: primaryLight),
                                child: Image.asset(ic_edit_profile, height: 16, width: 16, color: primaryColor))
                            .onTap(() {
                          openBottomSheet();
                        })
                      ],
                    ).onTap(() {
                      openBottomSheet();
                    }).center(),
                    20.height,
                    Text('firstName', style: primaryTextStyle(color: grayColor)),
                    10.height,
                    AppTextField(
                        textInputAction: TextInputAction.next,
                        controller: fNameController,
                        focus: fNameFocus,
                        textFieldType: TextFieldType.NAME,
                        keyboardType: TextInputType.name,
                        decoration: defaultInputDecoration(context, label: "enterFirstName"),
                        suffix: Image.asset(ic_profile, height: 16, width: 16, color: grayColor).paddingSymmetric(vertical: 12)),
                    10.height,
                    Text("lastName", style: primaryTextStyle(color: grayColor)),
                    10.height,
                    AppTextField(
                        textInputAction: TextInputAction.next,
                        controller: lNameController,
                        focus: lNameFocus,
                        textFieldType: TextFieldType.NAME,
                        keyboardType: TextInputType.name,
                        decoration: defaultInputDecoration(context, label: "enterLastName"),
                        suffix: Image.asset(ic_profile, height: 16, width: 16, color: grayColor).paddingSymmetric(vertical: 12)),
                    10.height,
                    Text("email", style: primaryTextStyle(color: grayColor)),
                    10.height,
                    AppTextField(
                        onFieldSubmitted: (p0) {
                          if (_formKey.currentState!.validate()) {
                            save();
                          }
                        },
                        textInputAction: TextInputAction.done,
                        controller: emailController,
                        focus: emailFocus,
                        textFieldType: TextFieldType.EMAIL,
                        keyboardType: TextInputType.emailAddress,
                        decoration: defaultInputDecoration(context, label: "enterEmail"),
                        suffix: Image.asset(ic_mail, height: 16, width: 16, color: grayColor).paddingSymmetric(vertical: 12)),
                    10.height,
                    Text("phoneNumber", style: primaryTextStyle(color: grayColor)),
                    10.height,
                    AppTextField(
                      controller: phoneController,
                      textFieldType: TextFieldType.PHONE,
                      focus: phoneFocus,
                      readOnly: true,
                      suffix: mSuffixTextFieldIconWidget(ic_call_outlined),
                      decoration: defaultInputDecoration(context,
                          label: "enterPhone",
                          mPrefix: IntrinsicHeight(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CountryCodePicker(
                                  enabled: false,
                                  initialSelection: countryCode,
                                  showCountryOnly: false,
                                  showFlag: false,
                                  boxDecoration: BoxDecoration(borderRadius: radius(defaultRadius), color: context.scaffoldBackgroundColor),
                                  showFlagDialog: true,
                                  showOnlyCountryWhenClosed: false,
                                  alignLeft: false,
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                  textStyle: primaryTextStyle(),
                                  onInit: (c) {},
                                  onChanged: (c) {},
                                ),
                                VerticalDivider(color: Colors.grey.withOpacity(0.5)),
                                16.width,
                              ],
                            ),
                          )),
                    ),
                    10.height,
                  ],
                ).paddingSymmetric(horizontal: 16),
              ),
            ),

          ],
        ));
  }

  openBottomSheet() {
    return showModalBottomSheet(
      context: context,
      backgroundColor: appStore.isDarkModeOn ? black : white,
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: radiusOnly(topLeft: 12, topRight: 12)),
      builder: (BuildContext context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Icon(Icons.close, size: 24).onTap(() {
                finish(context);
              }),
            ),
            10.height,
            SizedBox(
              width: context.width(),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Ionicons.camera_outline, color: appStore.isDarkModeOn ? white : primaryColor),
                  16.width,
                  Text("'camera'", style: primaryTextStyle(size: 18, color: appStore.isDarkModeOn ? white : black)),
                ],
              ),
            ).onTap(() {
              getImageFromCamera();
              finish(context);
            }),
            10.height,
            Divider(),
            10.height,
            SizedBox(
              width: context.width(),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(AntDesign.picture, color: appStore.isDarkModeOn ? white : primaryColor),
                  16.width,
                  Text("chooseImage", style: primaryTextStyle(size: 18)),
                ],
              ),
            ).onTap(() {
              getImage();
              finish(context);
            }),
            10.height,
          ],
        ).paddingSymmetric(horizontal: 16, vertical: 16);
      },
    );
  }
}
