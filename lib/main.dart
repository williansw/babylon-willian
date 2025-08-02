import 'package:babylon/app/base/app_widget.dart';
import 'package:flutter/material.dart';
import 'app/base/dependences.dart';
import 'app/core/exceptions/exceptions.dart';

Future<void> main() async {
  AppException.onError();
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const App());
}
