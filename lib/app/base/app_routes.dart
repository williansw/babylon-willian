import 'package:babylon/app/base/dependences.dart';
import 'package:babylon/app/base/navigator_service.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../features/login/view/login_view.dart';
import '../features/login/viewmodel/login_view_model.dart';

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
  ],

  observers: [GlobalNavigatorObserver()],
);
