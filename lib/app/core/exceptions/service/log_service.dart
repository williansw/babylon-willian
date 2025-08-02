import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'dart:developer' as developer;

import '../../constants/languages/languages.dart';

class LocalLogger {
  static String get cache => R.cache;
  static String get navigation => R.navigation;
  static String get security => R.security;
  static String get request => R.request;
  static String get function => R.functionLabel;
}

class LogService {
  factory LogService() => _instance;
  static final LogService _instance = LogService._internal();
  LogService._internal();

  static final Logger _logger = Logger();

  static void console({
    required String? message,
    required String? local,
    LogLevel? logLevel,
    Object? error,
    StackTrace? stackTrace,
    dynamic data,
  }) {
    String bodyString = '';

    if (data != null) {
      if (data is String) {
        bodyString = data;
      } else {
        try {
          bodyString = jsonEncode(data);
        } catch (_) {
          bodyString = data.toString();
        }
      }
    }

    final formattedMessage =
        '${R.logLocalLabel}: $local - $message${bodyString.isNotEmpty ? '\n${R.logBodyLabel}: $bodyString' : ''}';

    if (kDebugMode) {
      switch (logLevel ?? LogLevel.info) {
        case LogLevel.verbose:
          _logger.trace(formattedMessage, error: error, stackTrace: stackTrace);
          break;
        case LogLevel.trace:
          _logger.trace(formattedMessage, error: error, stackTrace: stackTrace);
          break;
        case LogLevel.debug:
          _logger.debug(formattedMessage);
          break;
        case LogLevel.info:
          _logger.info(formattedMessage);
          break;
        case LogLevel.warning:
          _logger.warning(formattedMessage);
          break;
        case LogLevel.error:
          _logger.error(formattedMessage, error: error, stackTrace: stackTrace);
          break;
        case LogLevel.critical:
          _logger.error(formattedMessage, error: error, stackTrace: stackTrace);
          break;
      }
    }
  }
}

class Logger {
  void trace(String message, {Object? error, StackTrace? stackTrace}) {
    developer.log(
      _message(level: LogLevel.trace, message: message),
      name: LogLevel.trace.name,
      error: error,
      stackTrace: stackTrace,
    );
  }

  void debug(String message) {
    developer.log(
      _message(level: LogLevel.debug, message: message),
      name: LogLevel.debug.name,
    );
  }

  void info(String message) {
    developer.log(
      _message(level: LogLevel.info, message: message),
      name: LogLevel.info.name,
    );
  }

  void warning(String message) {
    developer.log(
      _message(level: LogLevel.warning, message: message),
      name: LogLevel.warning.name,
    );
  }

  void error(String message, {Object? error, StackTrace? stackTrace}) {
    developer.log(
      _message(level: LogLevel.error, message: message),
      name: LogLevel.error.name,
      error: error,
      stackTrace: stackTrace,
    );
  }

  String _message({required LogLevel level, required String message}) {
    final timestamp = DateTime.now();
    return ' ${_colorMessage(level: level)} $timestamp $message \n';
  }

  String _colorMessage({required LogLevel level}) {
    switch (level) {
      case LogLevel.critical:
        return '\x1B[31m';
      case LogLevel.trace:
        return '\x1B[31m';
      case LogLevel.debug:
        return '\x1B[34m';
      case LogLevel.info:
        return '\x1B[32m';
      case LogLevel.warning:
        return '\x1B[33m';
      case LogLevel.error:
        return '\x1B[31m';
      case LogLevel.verbose:
        return '\x1B[0m';
    }
  }
}

enum LogLevel { verbose, debug, info, warning, error, critical, trace }
