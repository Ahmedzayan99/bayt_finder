import 'package:flutter/material.dart';

import 'appcontext.dart';

void navigateTo( widget) => Navigator.push(
  AppContext.context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
void navigateBack( [Object? result]) {
  if (Navigator.canPop(AppContext.context)) Navigator.pop(AppContext.context, result);
}
void navigateReplacementTo(widget) => Navigator.pushReplacement(
  AppContext.context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateNamedTo( widget) => Navigator.pushNamed(AppContext.context, widget);

void navigateFinish(widget) => Navigator.pushAndRemoveUntil(
    AppContext.context,
        MaterialPageRoute(
          builder: (context) => widget,
        ), (route) {
      return false;
    });
