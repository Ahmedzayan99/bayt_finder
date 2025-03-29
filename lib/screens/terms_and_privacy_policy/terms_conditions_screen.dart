import 'package:bayt_finder/components/appbar/custom_appbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../components/HtmlWidget.dart';
import '../../main.dart';

class TermsConditionsScreen extends StatefulWidget {
  const TermsConditionsScreen({super.key});

  @override
  State<TermsConditionsScreen> createState() => _TermsConditionsScreenState();
}

class _TermsConditionsScreenState extends State<TermsConditionsScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        appBar: CustomAppBar(title: "Terms Condition".tr(),showBack: true),
        body: SingleChildScrollView(child: CustomHtmlWidget(postContent: appSettingMain.privacyPolicy!.value)),
      ),
    );
  }
}
