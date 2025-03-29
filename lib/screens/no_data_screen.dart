import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/images.dart';
import '../extensions/text_styles.dart';

class NoDataScreen extends StatefulWidget {
  static String tag = '/NoDataScreen';

  final String? mTitle;

  const NoDataScreen({super.key, this.mTitle});

  @override
  NoDataScreenState createState() => NoDataScreenState();
}

class NoDataScreenState extends State<NoDataScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AppImage.noData,
              height: 200.h, width: double.infinity * 0.4),
          SizedBox(
            height: 16.h,
          ),
          Text(widget.mTitle ?? "no Found Data".tr(), style: boldTextStyle())
        ],
      ),
    );
  }
}
