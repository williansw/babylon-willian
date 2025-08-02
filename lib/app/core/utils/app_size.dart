import 'package:flutter/material.dart';

class AppSize {
  AppSize._();

  static const maxWidth = 800;
  static const maxWidthPayment = 1100;

  static bool isLargerThanMaxWith(BuildContext context) {
    return MediaQuery.of(context).size.width > maxWidth;
  }

  static double? virtualKeyboardWidthForSidebar(BuildContext context) {
    return isLargerThanMaxWith(context)
        ? MediaQuery.of(context).size.width - 90
        : null;
  }

  static bool isLargerThanMaxForPayment(BuildContext context) {
    return MediaQuery.of(context).size.width > maxWidthPayment;
  }
}
