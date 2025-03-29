import 'package:bayt_finder/nav.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/HtmlWidget.dart';
import '../../components/appbar/custom_appbar.dart';
import '../../utils/colors.dart';
import '../../extensions/text_styles.dart';
import '../../models/dashBoard_response.dart';
import '../../utils/app_common.dart';
import '../property/property_detail_screen.dart';

class SliderDetailsScreen extends StatefulWidget {
  final MSlider slider;

  const SliderDetailsScreen({super.key, required this.slider});

  @override
  State<SliderDetailsScreen> createState() => _SliderDetailsScreenState();
}

class _SliderDetailsScreenState extends State<SliderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        appBar: CustomAppBar(
            title: widget.slider.propertyName.toString(), showBack: true),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.sp),
            child: Column(
                spacing: 10.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: cachedImage(widget.slider.sliderImage,
                          height:  0.3.sh,
                          width: double.infinity,
                          fit: BoxFit.fill)),
                  InkWell(
                    onTap: () {
                      navigateTo( PropertyDetailScreen(
                        propertyId: widget.slider.propertyId,
                      ));
                    },
                    child: Container(
                        padding: EdgeInsets.all(16.sp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: AppColors.colorMasterNotActive
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Tap To View".tr(),
                                      style: primaryTextStyle(color: Colors.black)),
                                  SizedBox(height: 4.w,),

                                  Text(widget.slider.propertyName!,
                                      style: boldTextStyle(
                                          size: 18, color: Colors.black)),
                                ],
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios,
                                size: 20.sp,)
                          ],
                        )),
                  ),
                  CustomHtmlWidget(
                          postContent: widget.slider.description)

                ]),
          ),
        ),
      ),
    );
  }
}
