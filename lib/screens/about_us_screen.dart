/*
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../components/app_bar_components.dart';
import '../extensions/extension_util/int_extensions.dart';
import '../extensions/extension_util/string_extensions.dart';
import '../extensions/extension_util/widget_extensions.dart';
import '../extensions/text_styles.dart';
import '../local_storage/shared_preferences_manager.dart';
import '../utils/colors.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../extensions/shared_pref.dart';
import '../utils/app_common.dart';
import '../utils/constants.dart';
import '../utils/images.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  Widget mSocialOption(var value, {var color}) {
    return Image.asset(value, height: 30, width: 30, color: color).paddingAll(8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget("aboutUs", context1: context, titleSpace: 0),
      bottomNavigationBar: SizedBox(
        height: 130,
        child: Column(
          children: [
            FutureBuilder<PackageInfo>(
              future: PackageInfo.fromPlatform(),
              builder: (_, snap) {
                if (snap.hasData) {
                  return Text('v${snap.data!.version.validate()}', style: secondaryTextStyle());
                }
                return SizedBox();
              },
            ),
            16.height,
            Text("followUs", style: primaryTextStyle(size: 14)),
            2.height,
            SizedBox(
              height: 50,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      mSocialOption(ic_facebook)
                          .onTap(() async {
                            launchUrls(await SharedPreferencesManager.getStringAsync(FACEBOOK_URL)??'');
                          })
                          .paddingOnly(left: 16, right: 16),
                      mSocialOption(ic_instagram)
                          .onTap(() async {
                            launchUrls(await  SharedPreferencesManager.getStringAsync(INSTAGRAM_URL)??'');
                          })
                          .paddingRight(16),
                      mSocialOption(ic_twitter)
                          .onTap(() async {
                            launchUrls(await  SharedPreferencesManager.getStringAsync(TWITTER_URL)??'');
                          })
                          .paddingRight(16),
                      mSocialOption(ic_linkedin)
                          .onTap(() async {
                            launchUrls(await SharedPreferencesManager.getStringAsync(LINKED_URL)??'');
                          })
                          .paddingRight(16)
                    ],
                  ),
                ],
              ),
            ),
            2.height,
            Text( SharedPreferencesManager.getStringAsync(SITE_COPYRIGHT).toString(), style: secondaryTextStyle(size: 12), maxLines: 1).visible( SharedPreferencesManager.getStringAsync(SITE_COPYRIGHT)==''?false:true),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            4.height,
            Text( SharedPreferencesManager.getStringAsync(SITE_NAME).toString(), style: boldTextStyle(color: primaryColor, size: 18)),
            10.height,
            Text( SharedPreferencesManager.getStringAsync(SITE_DESCRIPTION).toString(), style: primaryTextStyle()),
            16.height,
            Row(
              children: [
                Icon(MaterialIcons.mail_outline, color: textSecondaryColorGlobal),
                8.width,
                Text( SharedPreferencesManager.getStringAsync(CONTACT_EMAIL)??'', style: secondaryTextStyle()).onTap(() async {
                  commonLaunchUrl("mailto${await SharedPreferencesManager.getStringAsync(CONTACT_EMAIL)}");
                }),
              ],
            ),
            16.height,
            Row(
              children: [
                Icon(MaterialIcons.support_agent, color: textSecondaryColorGlobal),
                8.width,
                Text( SharedPreferencesManager.getStringAsync(HELP_SUPPORT)??'', style: secondaryTextStyle()),
              ],
            ).visible( SharedPreferencesManager.getStringAsync(HELP_SUPPORT)==''?false:true),
            16.height,
            Row(
              children: [
                Icon(Ionicons.md_call_outline, color: textSecondaryColorGlobal),
                8.width,
                Text( SharedPreferencesManager.getStringAsync(CONTACT_NUMBER)??'', style: secondaryTextStyle()),
              ],
            ).visible( SharedPreferencesManager.getStringAsync(CONTACT_NUMBER)==''?false:true),
          ],
        ),
      ).paddingSymmetric(horizontal: 16),
    );
  }
}
*/
