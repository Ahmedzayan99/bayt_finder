import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class ToastWidget extends StatelessWidget {
  final String message;
  final Color color;
  final FToast fToast = FToast();

  ToastWidget({super.key, required this.message, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      alignment: Alignment.center,
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  showToast(BuildContext context) {
    Widget toast = ToastWidget(
      message: message,
      color: color,
    );
    fToast.init(context);
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.TOP,
      toastDuration: const Duration(seconds: 3),
    );
  }
}