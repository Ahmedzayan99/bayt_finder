import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../extensions/text_styles.dart';
import '../utils/colors.dart';
import '../utils/styles.dart';

class DropDownComponent extends StatefulWidget {
  final int? amenityId;
  final Function(int?, String?) onUpdate;
  final List<dynamic>? dropdownValues;
  final bool? isUpdateProperty;
  final dynamic selectedDropDownValue;

  const DropDownComponent({super.key, this.dropdownValues, this.amenityId, required this.onUpdate, this.selectedDropDownValue, this.isUpdateProperty});

  @override
  State<DropDownComponent> createState() => _DropDownComponentState();
}

class _DropDownComponentState extends State<DropDownComponent> {
  int? finalDropDownId;
  String? finalDropDownValue;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    setState(() {});

    widget.dropdownValues!.map((e) => print(e)).toList();
    if (widget.isUpdateProperty!) {
      finalDropDownValue = widget.selectedDropDownValue ?? widget.dropdownValues!.first;
    }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  void sendRadioData() {
    widget.onUpdate(finalDropDownId!, finalDropDownValue!);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
    decoration: BoxDecoration(
    color: AppColors.colorWhite,
    border: Border.all(color: AppColors.colorMediumGrayBorderTextForm),
    borderRadius: BorderRadius.circular(10.r),
    ), child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          DropdownButtonFormField<String>(
              style: TextStyles.font14BlackMedium,
              icon: Icon(Icons.keyboard_arrow_down, color: AppColors.colorBlack),
              decoration: InputDecoration(enabledBorder: InputBorder.none, focusedBorder: InputBorder.none),
              value: finalDropDownValue ?? widget.dropdownValues!.first,
              onChanged: (value) {
                finalDropDownId = widget.amenityId;
                finalDropDownValue = value;
                sendRadioData();
                setState(() {});
              },
              items: widget.dropdownValues!.map<DropdownMenuItem<String>>((value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: primaryTextStyle())
                );
              }).toList()),
        ],
      ),
    );
  }
}
