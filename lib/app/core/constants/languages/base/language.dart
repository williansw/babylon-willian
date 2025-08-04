import 'package:flutter/material.dart';

abstract class Languages {
  Languages._();

  static Languages? of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }

  String hiUser(String name);
  String notify(String name);
  String genericErrorWithDetail(String detail);
  String get devName;
  String get devBio;
  String get genericError;
  //AppRoutes
  String get routePopped;
  String get routePushed;
  String get routeReplaced;
  String get popupRouteLabel;
  String get dialogRouteLabel;
  String get screenRouteLabel;
  // AppException
  String get flutterError;
  String get unnamedRoute;
  String get unknownRoute;
  String get failedToDescribeContext;
  String get failedToGetWidgetTree;
  String get failedToLogError;
  // Log categories
  String get cache;
  String get navigation;
  String get security;
  String get request;
  String get functionLabel;
  String get logLocalLabel;
  String get logBodyLabel;
  // Firebase Auth Errors
  String get signupEmailAlreadyInUse;
  String get signupInvalidEmail;
  String get signupWeakPassword;
  String get signupUserNotFound;
  String get signupWrongPassword;
  String get signupGenericError;
  //Screen
  String hi(String name);
  String get appName;
  String get apply;
  String get portuguese;
  String get english;
  String get welcomeToBabylon;
  String get emailLabel;
  String get passwordLabel;
  String get loginButton;
  String get nameRequired;
  String get emailRequired;
  String get invalidEmail;
  String get passwordRequired;
  String get passwordInvalidFormat;
  String get loginError;
  String get errorLoadingData;
  String get createAccount;
  String get registerButton;
  String get backToLogin;
  String get fullNameLabel;
  String get signupMissingEmailOrPassword;
  String get logout;
}
