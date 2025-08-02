import 'package:flutter/material.dart';

abstract class Languages {
  Languages._();

  static Languages? of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }

  //AppRoutes
  String get routePopped;
  String get routePushed;
  String get routeReplaced;
  String get popupRouteLabel;
  String get dialogRouteLabel;
  String get screenRouteLabel;
  String notify(String name);
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
  //Screen
  String hi(String name);
  String get appName;
  String get apply;
  String get portuguese;
  String get english;
}
