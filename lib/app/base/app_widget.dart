import 'package:babylon/app/base/app_routes.dart';
import 'package:babylon/app/base/dependences.dart';
import 'package:babylon/app/core/style/styte.dart';
import 'package:babylon/app/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/constants/languages/languages.dart';
import '../core/services/locate_service.dart';
import '../features/login/viewmodel/login_view_model.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final locateService = getIt<LocateService>();
    return ChangeNotifierProvider.value(
      value: locateService,
      child: Consumer<LocateService>(
        builder: (context, locateService, _) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => getIt<LoginViewModel>()),
            ],
            child: MaterialApp.router(
              scaffoldMessengerKey: scaffoldMessengerKey,
              builder: (context, child) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                    textScaler: AppSize.isLargerThanMaxWith(context)
                        ? const TextScaler.linear(1.1)
                        : const TextScaler.linear(0.85),
                  ),
                  child: child ?? const SizedBox.shrink(),
                );
              },
              title: R.appName,
              routerConfig: appRouter,
              debugShowCheckedModeBanner: false,
              locale: locateService.locale,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(
                  seedColor: AppColor.secondary,
                ),
                textTheme: AppTheme.textTheme,
                pageTransitionsTheme: const PageTransitionsTheme(
                  builders: {
                    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
                    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
