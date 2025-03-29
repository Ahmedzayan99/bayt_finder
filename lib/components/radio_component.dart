import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/images.dart';
import '../utils/styles.dart';

class RadioComponent extends StatefulWidget {
  final List<dynamic>? radioValues;
  final int? amenityId;
  final Function(int?, String?) onUpdate;
  final String? selectedRadioValue;
  final bool? isUpdateProperty;

  const RadioComponent({super.key, this.radioValues, this.amenityId, required this.onUpdate, this.selectedRadioValue, this.isUpdateProperty = false});

  @override
  State<RadioComponent> createState() => _RadioComponentState();
}

class _RadioComponentState extends State<RadioComponent> {
  int? currentRIndex;
  int? finalRadioId;
  String? finalRadioValue;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    print(currentRIndex);
    print(widget.selectedRadioValue);
    for (var element in widget.radioValues!) {
      if (widget.selectedRadioValue == element) currentRIndex = widget.radioValues!.indexOf(element);
    }

    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  void sendRadioData() {
    widget.onUpdate(finalRadioId!, finalRadioValue!);
  }

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 40.h,
      child: ListView.separated(
        physics: AlwaysScrollableScrollPhysics(),
        primary: true,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsetsDirectional.only(bottom: 16.h, top: 0,start: 20.w),
        itemCount: widget.radioValues!.length,
        itemBuilder: (BuildContext context, int i) {
          return InkWell(
            onTap: () {
              currentRIndex = int.tryParse(widget.radioValues![i].toString());
              finalRadioId = widget.amenityId;
              finalRadioValue = widget.radioValues![i].toString().replaceAll('[', '').replaceAll(']', '');
              sendRadioData();
              setState(() {});
            },
            child: Row(
              spacing: 4.w,
              children: [
                currentRIndex== int.tryParse(widget.radioValues![i].toString())
                    ? SvgPicture.asset(AppImage.active)
                    : SvgPicture.asset(AppImage.inactive),
                Text(widget.radioValues![i].toString(), style: TextStyles.font15MediumBlackRegular),
              ],
            ),
          );
         /* return RadioListTile(
            dense: true,
            value: i,
            selected: true,
            fillColor: WidgetStateProperty.all(AppColors.colorMaster),
            activeColor: AppColors.colorMaster,
            groupValue: currentRIndex,
            title: Text(widget.radioValues![i].toString().capitalizeFirstLetter(), style: primaryTextStyle(size: 16)),
            onChanged: (dynamic val) {
              currentRIndex = val;
              finalRadioId = widget.amenityId;
              finalRadioValue = widget.radioValues![i].toString().replaceAll('[', '').replaceAll(']', '');
              sendRadioData();
              setState(() {});
            },
          );*/
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 50.h,);
        },
      ),
    );
  }
}
