import 'package:flutter/material.dart';
import '../extensions/common.dart';

DateTime? _currentBackPressTime;

/// DoublePressBackWidget
class DoublePressBackWidget extends StatelessWidget {
  final Widget child;
  final String? message;
  final WillPopCallback? onWillPop;

  const DoublePressBackWidget({
    super.key,
    required this.child,
    this.message,
    this.onWillPop,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: child,
      onWillPop: () {
        DateTime now = DateTime.now();

        onWillPop?.call();
        if (_currentBackPressTime == null || now.difference(_currentBackPressTime!) > Duration(seconds: 2)) {
          _currentBackPressTime = now;
          toast(message ?? "pressBackAgainToExit");

          return Future.value(false);
        }
        return Future.value(true);
      },
    );
  }
}
