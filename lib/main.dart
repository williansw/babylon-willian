import 'package:babylon/app/base/app_widget.dart';
import 'package:babylon/app/base/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app/base/dependences.dart';
import 'app/core/constants/languages/resources.dart';
import 'app/core/exceptions/exceptions.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupLocator();
  R.load();
  AppException.onError();
  runApp(const App());
}
