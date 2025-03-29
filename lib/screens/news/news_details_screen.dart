import 'package:bayt_finder/components/HtmlWidget.dart';
import 'package:bayt_finder/components/appbar/custom_appbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../../../extensions/text_styles.dart';
import '../../extensions/decorations.dart';
import '../../models/article_response.dart';
import '../../utils/app_common.dart';
import '../../utils/colors.dart';

class NewsDetailsScreen extends StatelessWidget {
  final Article articles;

  const NewsDetailsScreen({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "News Articles Details".tr(), showBack: true
            /*     actions: [
          Icon(Ionicons.share_social, size: 20, color: AppColors.colorMaster).paddingSymmetric(horizontal: 16).onTap(() {
            Share.share("${"checkoutNewsArticles"} ${articles.name!}", subject: articles.name!);
          })
        ]*/
            ),
        body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.all(16.sp),
            child: Column(
                spacing: 20.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                       borderRadius: BorderRadius.circular(16.r),
                        child: cachedImage(articles.articleImage.toString(),
                                height:  0.32,
                                width: double.infinity,
                                fit: BoxFit.fill),
                      ),
                      Positioned(
                        left: 30.w,
                        bottom: 12.h,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                          decoration: boxDecorationWithRoundedCorners(
                              borderRadius: radius(8)),
                          child: Row(
                            spacing: 4.w,
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(MaterialCommunityIcons.clock_time_five_outline,
                                  size: 18.sp, color: AppColors.colorMaster),
                              Text(
                                  parseDocumentDate(DateTime.parse(
                                      articles.createdAt!)),
                                  style: primaryTextStyle(
                                      color: AppColors.colorMaster, size: 14)),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Text(articles.name!,
                          style: boldTextStyle(size: 20)),
                  Wrap(
                    runSpacing: 8,
                    spacing: 8,
                    children: List.generate(articles.tags!.length, (index) {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: boxDecorationWithRoundedCorners(
                            borderRadius: radius(24),
                            border: Border.all(width: 0.3, color: AppColors.colorMaster)),
                        child: Text(articles.tags![index].name!,
                            style: secondaryTextStyle(color: AppColors.colorMaster),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis),
                      );
                    }),
                  ),
                    CustomHtmlWidget(postContent: articles.description.toString(), )  ]),
          ),
        ));
  }
}
