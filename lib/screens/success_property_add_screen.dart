import 'package:flutter/material.dart';
import '../extensions/extension_util/context_extensions.dart';
import '../extensions/extension_util/int_extensions.dart';
import '../extensions/extension_util/widget_extensions.dart';
import '../extensions/text_styles.dart';
import '../screens/property_detail_screen.dart';
import '../utils/images.dart';
import '../extensions/app_button.dart';
import '../utils/colors.dart';
import 'layout/layout_screen.dart';

class SuccessPropertyScreen extends StatefulWidget {
  final int? propertyId;

  const SuccessPropertyScreen({super.key, required this.propertyId});

  @override
  State<SuccessPropertyScreen> createState() => _SuccessPropertyScreenState();
}

class _SuccessPropertyScreenState extends State<SuccessPropertyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(
          ic_property_success,
          width: 200,
          height: 200,
        ),
        20.height,
        Text("congratulations", style: boldTextStyle(size: 30, color: primaryColor)),
        20.height,
        Text("yourPropertySubmittedSuccessfully", style: secondaryTextStyle(size: 16)),
        50.height,
        AppButton(
          text: "previewProperty",
          width: context.width(),
          color: primaryColor,
          textColor: Colors.white,
          onTap: () {
            PropertyDetailScreen(
                isSuccess: true,
                propertyId: widget.propertyId,
                onCall: () {
                  setState(() {});
                }).launch(context);
          },
        ),
        30.height,
        TextButton(
          onPressed: () {
            LayoutScreen().launch(context, isNewTask: true);
          },
          child: Text("backToHome", style: primaryTextStyle(color: primaryColor)),
        )
      ]).paddingSymmetric(horizontal: 16),
    );
  }
}
