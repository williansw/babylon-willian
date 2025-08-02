import 'package:babylon/app/core/constants/languages/languages.dart';

class R {
  static late Languages _lang;
  static void load({Languages? language}) {
    _lang = language ?? LanguageEn();
  }

  //AppRoutes
  static String get routePopped => _lang.routePopped;
  static String get routePushed => _lang.routePushed;
  static String get routeReplaced => _lang.routeReplaced;
  static String get popupRouteLabel => _lang.popupRouteLabel;
  static String get dialogRouteLabel => _lang.dialogRouteLabel;
  static String get screenRouteLabel => _lang.screenRouteLabel;
  // AppException
  static String get flutterError => _lang.flutterError;
  static String get unnamedRoute => _lang.unnamedRoute;
  static String get unknownRoute => _lang.unknownRoute;
  static String get failedToDescribeContext => _lang.failedToDescribeContext;
  static String get failedToGetWidgetTree => _lang.failedToGetWidgetTree;
  static String get failedToLogError => _lang.failedToLogError;
  // Log categories
  static String get cache => _lang.cache;
  static String get navigation => _lang.navigation;
  static String get security => _lang.security;
  static String get request => _lang.request;
  static String get functionLabel => _lang.functionLabel;
  static String get logLocalLabel => _lang.logLocalLabel;
  static String get logBodyLabel => _lang.logBodyLabel;
  //Screen
  static String get appName => _lang.appName;
  static String hi(name) => _lang.hi(name);
  static String get apply => _lang.apply;
  static String get portuguese => _lang.portuguese;
  static String get english => _lang.english;
  static String get welcomeToBabylon => _lang.welcomeToBabylon;
  static String get emailLabel => _lang.emailLabel;
  static String get passwordLabel => _lang.passwordLabel;
  static String get loginButton => _lang.loginButton;
  static String get fullNameRequired => _lang.fullNameRequired;
  static String get emailRequired => _lang.emailRequired;
  static String get invalidEmail => _lang.invalidEmail;
  static String get passwordRequired => _lang.passwordRequired;
  static String get passwordInvalidFormat => _lang.passwordInvalidFormat;
  static String get loginError => _lang.loginError;
  static String get errorLoadingData => _lang.errorLoadingData;
  static String get createAccount => _lang.createAccount;
}
