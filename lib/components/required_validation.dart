import 'package:bayt_finder/utils/colors.dart';
import 'package:flutter/material.dart';
import '../extensions/text_styles.dart';

class RequiredValidationText extends StatefulWidget {
  final String? titleText;
  final bool required;

  const RequiredValidationText({super.key, this.required = false, this.titleText});

  @override
  State<RequiredValidationText> createState() => _RequiredValidationTextState();
}

class _RequiredValidationTextState extends State<RequiredValidationText> {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: primaryTextStyle(size: 14),
        children: <TextSpan>[
          TextSpan(text: widget.titleText, style: primaryTextStyle(size: 14)),
          widget.required ? TextSpan(text: ' *', style: secondaryTextStyle(color: AppColors.colorError)) : TextSpan(),
        ],
      ),
    );
  }
}
