import 'package:flutter/material.dart';
import '../../../base/app_widget.dart';
import '../../../core/constants/languages/languages.dart';
import '../service/log_service.dart';

class AppException {
  /// Initializes the error handling for the application.
  /// This method sets up a global error handler that logs errors
  /// using the `LogService`.
  /// It should be called in the `main` function
  /// before running the app.
  static void onError() {
    FlutterError.onError = (FlutterErrorDetails details) {
      _logError(
        details,
        scaffoldMessengerKey: scaffoldMessengerKey,
        errorType: R.flutterError,
      );
    };
  }

  /// Safely extracts the widget tree from the context
  static String? _getWidgetTree(DiagnosticsNode? context) {
    if (context == null) return null;

    try {
      final element = context as Element;
      return element.toStringDeep();
    } catch (e) {
      return '${R.failedToGetWidgetTree}: $e';
    }
  }

  /// Logs the error with additional context information
  static void _logError(
    FlutterErrorDetails details, {
    required GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey,
    required String errorType,
  }) {
    try {
      String currentRoute = R.unknownRoute;
      if (scaffoldMessengerKey?.currentContext != null) {
        final route = ModalRoute.of(scaffoldMessengerKey!.currentContext!);
        currentRoute = route?.settings.name ?? R.unnamedRoute;
      }

      final String? information = details.informationCollector != null
          ? details.informationCollector!().map((e) => e.toString()).join('\n')
          : null;

      String? contextDescription;
      try {
        contextDescription = details.context?.toStringDeep();
      } catch (e) {
        contextDescription = '${R.failedToDescribeContext}: $e';
      }

      LogService.console(
        message: '[$errorType] ${details.exceptionAsString()}',
        local: 'AppException.onError',
        logLevel: LogLevel.error,
        error: details.exception,
        stackTrace: details.stack,
        data: {
          'library': details.library,
          'context': contextDescription,
          'current_route': currentRoute,
          'error_type': errorType,
          'information': information,
          'widget_tree': _getWidgetTree(details.context),
        },
      );
    } catch (e) {
      LogService.console(
        message: '${R.failedToLogError}: $e',
        local: 'AppException._logError',
        logLevel: LogLevel.error,
      );
    }
  }
}
