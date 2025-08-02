import '../languages.dart';

class LanguagePt implements Languages {
  //AppRoutes
  @override
  String get routePopped => 'Route popped';
  @override
  String get routePushed => 'Route pushed';
  @override
  String get routeReplaced => 'Route replaced';
  @override
  String get popupRouteLabel => 'PopUp';
  @override
  String get dialogRouteLabel => 'Dialog';
  @override
  String get screenRouteLabel => 'Screen';
  // AppException
  @override
  String get flutterError => 'Flutter Error';
  @override
  String get unnamedRoute => 'unnamed route';
  @override
  String get unknownRoute => 'unknown';
  @override
  String get failedToDescribeContext => 'Failed to describe context';
  @override
  String get failedToGetWidgetTree => 'Failed to get widget tree';
  @override
  String get failedToLogError => 'Failed to log error';
  // Log categories
  @override
  String get cache => 'Cache';
  @override
  String get navigation => 'Navigation';
  @override
  String get security => 'Security';
  @override
  String get request => 'Request';
  @override
  String get functionLabel => 'Function';
  @override
  String get logLocalLabel => 'Local';
  @override
  String get logBodyLabel => 'Body';
  //Screen
  @override
  String get appName => 'Babylon - WILLIAN';
  @override
  String hi(name) => 'Hi $name';
  @override
  String get apply => 'Aplicar';
  @override
  String get english => 'Inglês';
  @override
  String get portuguese => 'Português (BR)';
}
