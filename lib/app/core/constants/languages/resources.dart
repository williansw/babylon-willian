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
}
