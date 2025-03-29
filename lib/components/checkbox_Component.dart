import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../extensions/animatedList/animated_wrap.dart';
import '../utils/colors.dart';
import '../utils/styles.dart';

class CheckBoxComponent<T> extends StatefulWidget {
  final int? amenityId;
  final int? propertyId;
  final int? pId;
  final List<dynamic>? checkboxValues;
  final List<dynamic>? newCheckboxValues;

  final bool? isUpdateProperty;

  final Function(List<String>?, int? id) onUpdate;

  const CheckBoxComponent(
      {super.key,
      this.checkboxValues,
      this.amenityId,
      required this.onUpdate,
      this.propertyId,
      this.pId,
      this.newCheckboxValues,
      this.isUpdateProperty = false});

  @override
  State<CheckBoxComponent> createState() => _CheckBoxComponentState();
}

class _CheckBoxComponentState<T> extends State<CheckBoxComponent<T>> {
  int? finalCheckBoxId;
  List<dynamic> selectedIndexes = [];
  List<String> checkBoxQuotedStrings = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    if (widget.isUpdateProperty! &&
        widget.newCheckboxValues!.isNotEmpty) {
      selectedIndexes = widget.newCheckboxValues!;
    }
    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  void sendRadioData(List<String>? data, int? cId) {
    widget.onUpdate(data!, finalCheckBoxId!);
  }

  void checkBoxSelection(String value) {
    if (selectedIndexes.contains(value)) {
      selectedIndexes.remove(value);
    } else {
      selectedIndexes.add(value);
    }
    checkBoxQuotedStrings = selectedIndexes.map((str) => '"$str"').toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AnimatedWrap(
            //  runSpacing: 8,
            //   spacing: 8,
            crossAxisAlignment: WrapCrossAlignment.start,
            alignment: WrapAlignment.spaceBetween,
            runAlignment: WrapAlignment.spaceBetween,
            /*  itemBuilder: (p0, p1) {
            return Container(
              padding:
                  EdgeInsetsDirectional.only(bottom: 16.h, top: 0, start: 20.w),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
              selectedIndexes.contains(widget.checkboxValues![p1].toString())
                          ? Icons.check_box_rounded
                          : Icons.check_box_outline_blank,
                      color: selectedIndexes.contains(widget.checkboxValues![p1].toString())
                          ? Colors.black
                          : grayColor),
                  SizedBox(width: 10.w,),
                  Text(p1.toString(),
                      style: secondaryTextStyle(
                          size: 16,
                          color: selectedIndexes.contains(p1)
                              ? Colors.white
                              : grayColor)),
                ],
              ),
            ).onTap(() {
              checkBoxSelection(widget.checkboxValues![p1].toString());
              finalCheckBoxId = widget.amenityId;
              sendRadioData((checkBoxQuotedStrings), finalCheckBoxId);
              setState(() {});
            });
          },*/
            children: widget.checkboxValues!.map((e) {
              return InkWell(
               onTap: () {
                 checkBoxSelection(e);
                 finalCheckBoxId = widget.amenityId;
                 sendRadioData((checkBoxQuotedStrings), finalCheckBoxId);
                 setState(() {});
               },
                child: Container(
                  padding: EdgeInsetsDirectional.only(
                      bottom: 16.h, top: 0, start: 20.w),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                          selectedIndexes.contains(e)
                              ? Icons.check_box_rounded
                              : Icons.check_box_outline_blank,
                          color: selectedIndexes.contains(e)
                              ? AppColors.colorMaster
                              : AppColors.colorMediumBlack),
                      SizedBox(width: 10.w,),
                      Text(e.toString(),
                          style:  TextStyles.font15MediumBlackRegular),
                    ],
                  ),
                ),
              );
            }).toList()),
      ],
    );
  }
}
