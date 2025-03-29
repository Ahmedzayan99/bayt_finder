import 'package:bayt_finder/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../components/buttons/master_button.dart';
import 'colors.dart';
import 'decorations.dart';

class NewCustomBottomSheet {
  const NewCustomBottomSheet._();

  static void showModalBottomSheetContainer({
    required BuildContext context,
    required Widget widget,
    Color? backgroundColor,
    VoidCallback? whenComplete,
  }) =>
      showModalBottomSheet<dynamic>(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        context: context,
        backgroundColor: backgroundColor ?? Colors.white,
        isScrollControlled: true,
        barrierColor: Colors.black.withOpacity(0.5),
        builder: (context) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: widget,
            ),
          );
        },
      ).whenComplete(whenComplete ?? () {});
  static void showModalBottomSheetInformationCar({
    required BuildContext context,
    required String image,
    required String type,
    required String information,
    required void Function() onPressed,
    VoidCallback? whenComplete,
  }) =>
      showModalBottomSheet<dynamic>(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        context: context,
        backgroundColor: AppColors.colorWhite,
        isScrollControlled: true,
        barrierColor: Colors.black.withOpacity(0.5),
        builder: (context) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical:29.h ,horizontal:21.w ),
                decoration: AppBoxDecoration.decorationWhiteRadius20,
                child: Column(
                  spacing: 11.h,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      image,
                      height: 40.h,
                      width: 60.h,
                    ),
                    Padding(
                      padding:  EdgeInsetsDirectional.only(start: 15.w),
                      child: Text(
                          type,
                          style:TextStyles.font15BlackBold
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsetsDirectional.only(start: 15.w),
                      child: Text(
                        information,
                          style:TextStyles.font18LightBlackRegular
                      ),
                    ),
                    MasterButton(onPressed:onPressed,
                      text: 'OK',
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ).whenComplete(whenComplete ?? () {});
  static void showModalBottom(context,
      {required Widget child, required double initialChildSize}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      transitionAnimationController: AnimationController(
          duration: Duration(seconds: 1), vsync: Navigator.of(context)),
      builder: (context) => CustomBottomSheet(
        initialChildSize: initialChildSize,
        child: child,
      ),
    );
  }
  static void showModalBottomCustom(context,
      {required Widget child}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      transitionAnimationController: AnimationController(
          duration: Duration(seconds: 1), vsync: Navigator.of(context)),
      builder: (context) => CustomBottomSheet2(
        child: child,
      ),
    );
  }

}

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet(
      {super.key, required this.child, required this.initialChildSize});

  final Widget child;
  final double initialChildSize;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: initialChildSize,
      builder: (context, scrollController) {
        return child;
      },
    );
  }
}
class CustomBottomSheet2 extends StatelessWidget {
  const CustomBottomSheet2(
      {super.key, required this.child,});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: true,
      snap: true,
      minChildSize: 0.25,
      initialChildSize: 0.41,
      maxChildSize: 0.87,
      snapSizes: [
        0.28,
        0.40,
        0.60,
      ],

      builder: (context, scrollController) {
        return Container(
          decoration:
          AppBoxDecoration.decorationWhiteRadius20,
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                child,
              ],
            ),
          ),
        );
      },
    );
  }
}
