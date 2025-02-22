import 'package:flutter/material.dart';
import '../components/app_bar_components.dart';
import '../extensions/extension_util/int_extensions.dart';
import '../extensions/extension_util/widget_extensions.dart';
import '../components/settings_components.dart';
import '../components/theme_selection_dialog_components.dart';
import '../extensions/decorations.dart';
import '../extensions/widgets.dart';
import '../utils/colors.dart';
import '../utils/images.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget("setting", context1: context, titleSpace: 0),
      body: Column(
        children: [
          SettingItemWidget(
            onTap: () {
            //   LanguageScreen2().launch(context);
            },
            title: 'lang',
            leading: Image.asset(ic_language, height: 20, width: 20, color: primaryColor),
            trailing: Icon(Icons.arrow_forward_ios_sharp, color: grayColor, size: 18),
          ),
          14.height,
          SettingItemWidget(
            onTap: () async {
              await showInDialog(context, shape: RoundedRectangleBorder(borderRadius: radius(12)), builder: (_) => ThemeSelectionDialog(), contentPadding: EdgeInsets.zero);
            },
            title: "appTheme",
            leading: Image.asset(ic_theme, height: 20, width: 20, color: primaryColor),
            trailing: Icon(Icons.arrow_forward_ios_sharp, color: grayColor, size: 18),
          ),
        ],
      ).paddingSymmetric(horizontal: 16),
    );
  }
}
