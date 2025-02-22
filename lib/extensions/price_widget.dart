import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../extensions/extension_util/int_extensions.dart';
import '../extensions/text_styles.dart';
import '../local_storage/shared_preferences_manager.dart';
import '../main.dart';
import '../utils/constants.dart';

class PriceWidget extends StatefulWidget {
  var price;
  final double? size;
  final Color? color;
  final TextStyle? textStyle;

  PriceWidget({super.key,  this.price, this.color, this.size = 22.0, this.textStyle});

  @override
  PriceWidgetState createState() => PriceWidgetState();
}

class PriceWidgetState extends State<PriceWidget> {
  var currency = '₹';

  @override
  void initState() {
    super.initState();
    get();
  }

  get() async {
    setState(() async {
      currency =SharedPreferencesManager.getStringAsync("CurrencySymbol")??'';
    });
  }

  @override
  Widget build(BuildContext context) {
    if (appStore.currencyPosition == "left") {
      return Row(
        children: [
          currencyWidget(),
          2.width,
          Text(widget.price.toString(), style: widget.textStyle ?? primaryTextStyle(color: widget.color ?? textPrimaryColorGlobal, size: widget.size!.toInt())),
        ],
      );
    } else {
      return Row(
        children: [
          Text(widget.price.toString(), style: widget.textStyle ?? primaryTextStyle(color: widget.color ?? textPrimaryColorGlobal, size: widget.size!.toInt())),
          2.width,
          currencyWidget(),
        ],
      );
    }
  }

  Widget currencyWidget() {
    return Text(currency,
        style: GoogleFonts.roboto(color: widget.textStyle!.color ?? textPrimaryColorGlobal, fontWeight: widget.textStyle!.fontWeight, fontSize: widget.textStyle!.fontSize ?? 18));
  }
}
