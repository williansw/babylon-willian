import 'package:flutter/material.dart';
import '../core/constants/languages/languages.dart';
import '../core/exceptions/service/log_service.dart';

class GlobalNavigatorObserver extends RouteObserver<ModalRoute<Object?>> {
  @override
  void didPop(Route route, Route? previousRoute) {
    LogService.console(
      message: '${R.routePopped} ${_routeLog(route)}',
      logLevel: LogLevel.info,
      local: LocalLogger.navigation,
    );

    super.didPop(route, previousRoute);
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    LogService.console(
      message: '${R.routePushed} ${_routeLog(route)}',
      logLevel: LogLevel.info,
      local: LocalLogger.navigation,
    );

    super.didPush(route, previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    LogService.console(
      message:
          '${R.routeReplaced} ${_routeLog(oldRoute)} - ${_routeLog(newRoute)}',
      logLevel: LogLevel.info,
      local: LocalLogger.navigation,
    );

    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  String _routeLog(Route? route) {
    String label;
    String name;

    if (route is PopupRoute) {
      label = R.popupRouteLabel;
      name = route.settings.name ?? R.popupRouteLabel;
    } else if (route is DialogRoute) {
      label = R.dialogRouteLabel;
      name = route.settings.name ?? R.dialogRouteLabel;
    } else {
      label = R.screenRouteLabel;
      name = route?.settings.name ?? R.screenRouteLabel;
    }
    return '$label: $name';
  }
}
