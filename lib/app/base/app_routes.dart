import 'package:babylon/app/base/dependences.dart';
import 'package:babylon/app/base/navigator_service.dart';
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

  routes: <RouteBase>[
    GoRoute(
      name: Routers.splash,
      path: Routers.splash,
      builder: (context, state) => ChangeNotifierProvider<SplashViewModel>(
        create: (_) => getIt<SplashViewModel>(),
        child: Consumer<SplashViewModel>(
          builder: (context, viewModel, child) {
            return SplashView(viewModel: viewModel);
          },
        ),
      ),
    ),
    GoRoute(
      name: Routers.login,
      path: Routers.login,
      builder: (context, state) => ChangeNotifierProvider<LoginViewModel>(
        create: (_) => getIt<LoginViewModel>(),
        child: Consumer<LoginViewModel>(
          builder: (context, viewModel, child) {
            return LoginView(viewModel: viewModel);
          },
        ),
      ),
    ),
    GoRoute(
      name: Routers.singup,
      path: Routers.singup,
      builder: (context, state) => ChangeNotifierProvider<SignUpViewModel>(
        create: (_) => getIt<SignUpViewModel>(),
        child: Consumer<SignUpViewModel>(
          builder: (context, viewModel, child) {
            return SignupView(viewModel: viewModel);
          },
        ),
      ),
    ),
    GoRoute(
      name: Routers.home,
      path: Routers.home,
      builder: (context, state) => ChangeNotifierProvider<HomeViewModel>(
        create: (_) => getIt<HomeViewModel>(),
        child: Consumer<HomeViewModel>(
          builder: (context, viewModel, child) {
            return HomeView(viewModel: viewModel);
          },
        ),
      ),
    ),
  ],

  observers: [GlobalNavigatorObserver()],
);
