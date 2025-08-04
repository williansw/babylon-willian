import 'package:babylon/app/base/dependences.dart';
import 'package:babylon/app/base/navigator_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../features/home/view/home_view.dart';
import '../features/home/viewmodel/home_view_model.dart';
import '../features/login/view/login_view.dart';
import '../features/login/viewmodel/login_view_model.dart';
import '../features/signup/view/signup_view.dart';
import '../features/signup/viewmodel/signup_view_model.dart';
import '../features/splash/view/splash_view.dart';
import '../features/splash/viewmodel/splash_view_model.dart';

class Routers {
  static const String splash = '/splash';
  static const String singup = '/singup';
  static const String login = '/login';
  static const String home = '/home';
}

final GoRouter appRouter = GoRouter(
  initialLocation: Routers.splash,
  observers: [GlobalNavigatorObserver()],
  routes: <RouteBase>[
    _fadeTransitionRoute(
      name: Routers.splash,
      path: Routers.splash,
      child: () => ChangeNotifierProvider(
        create: (_) => getIt<SplashViewModel>(),
        child: Consumer<SplashViewModel>(
          builder: (context, viewModel, child) =>
              SplashView(viewModel: viewModel),
        ),
      ),
    ),
    _fadeTransitionRoute(
      name: Routers.login,
      path: Routers.login,
      child: () => ChangeNotifierProvider(
        create: (_) => getIt<LoginViewModel>(),
        child: Consumer<LoginViewModel>(
          builder: (context, viewModel, child) =>
              LoginView(viewModel: viewModel),
        ),
      ),
    ),
    _fadeTransitionRoute(
      name: Routers.singup,
      path: Routers.singup,
      child: () => ChangeNotifierProvider(
        create: (_) => getIt<SignUpViewModel>(),
        child: Consumer<SignUpViewModel>(
          builder: (context, viewModel, child) =>
              SignupView(viewModel: viewModel),
        ),
      ),
    ),
    _fadeTransitionRoute(
      name: Routers.home,
      path: Routers.home,
      child: () => ChangeNotifierProvider(
        create: (_) => getIt<HomeViewModel>(),
        child: Consumer<HomeViewModel>(
          builder: (context, viewModel, child) =>
              HomeView(viewModel: viewModel),
        ),
      ),
    ),
  ],
);

GoRoute _fadeTransitionRoute({
  required String name,
  required String path,
  required Widget Function() child,
}) {
  return GoRoute(
    name: name,
    path: path,
    pageBuilder: (context, state) {
      return CustomTransitionPage(
        key: state.pageKey,
        child: child(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final slide = Tween<Offset>(
            begin: const Offset(0.0, 0.05),
            end: Offset.zero,
          ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut));

          final fade = Tween<double>(begin: 0, end: 1).animate(animation);

          return SlideTransition(
            position: slide,
            child: FadeTransition(opacity: fade, child: child),
          );
        },
      );
    },
  );
}
