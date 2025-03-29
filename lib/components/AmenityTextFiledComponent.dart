import 'package:bayt_finder/components/auth_text_form_field/auth_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../utils/colors.dart';

class AmenityTextFiledComponent extends StatefulWidget {
  final String? amenityValueData;
  final int? amenityID;
  final bool? isUpdate;
  final String? updatedValue;
  final String? amenityType;
  final Function(int?, String? id) onUpdate;

  const AmenityTextFiledComponent({super.key, this.amenityValueData, this.amenityID, this.isUpdate = false, this.updatedValue, this.amenityType, required this.onUpdate});

  @override
  State<AmenityTextFiledComponent> createState() => _AmenityTextFiledComponentState();
}

class _AmenityTextFiledComponentState extends State<AmenityTextFiledComponent> {
  TextEditingController textBoxController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.isUpdate!) {
      textBoxController.text = widget.updatedValue!;
    }
    setState(() {});
  }

  void sendRadioData(finalRadioId, finalRadioValue) {
    widget.onUpdate(finalRadioId, finalRadioValue);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(color: AppColors.colorMediumGrayText, height: 0),
        AuthTextFormField(
          controller: textBoxController,
          textInputType: widget.amenityType == AMENITY_TYPE_NUMBER
              ? TextInputType.phone
              : widget.amenityType == AMENITY_TYPE_TEXTAREA
                  ? TextInputType.multiline
                  : TextInputType.name,

          onFieldSubmitted: (value) {
            if (textBoxController.text.isNotEmpty) {
              sendRadioData(widget.amenityID, textBoxController.text);
              setState(() {});
            }
          },
          onChanged: (v) {
            sendRadioData(widget.amenityID, textBoxController.text);
            setState(() {});
          },
          hintText: "${"enter".tr()} ${widget.amenityValueData!}",
        )
      ],
    );
  }
}
