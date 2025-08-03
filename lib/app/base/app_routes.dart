import 'package:babylon/app/base/dependences.dart';
import 'package:babylon/app/base/navigator_service.dart';
import 'package:babylon/app/features/signup/viewmodel/signup_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../features/login/view/login_view.dart';
import '../features/login/viewmodel/login_view_model.dart';
import '../features/signup/view/signup_view.dart';

class Routers {
  static const String splash = '/splash';
  static const String singup = '/singup';
  static const String login = '/login';
  static const String home = '/home';
}

final GoRouter appRouter = GoRouter(
  initialLocation: Routers.login,

  routes: <RouteBase>[
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
      builder: (context, state) => ChangeNotifierProvider<SignupViewModel>(
        create: (_) => getIt<SignupViewModel>(),
        child: Consumer<SignupViewModel>(
          builder: (context, viewModel, child) {
            return SignupView(viewModel: viewModel);
          },
        ),
      ),
    ),
  ],

  observers: [GlobalNavigatorObserver()],
);
