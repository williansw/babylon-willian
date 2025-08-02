import 'package:babylon/app/base/navigator_service.dart';
import 'package:go_router/go_router.dart';

class Routers {
  static const String splash = '/splash';
  static const String singup = '/singup';
  static const String login = '/login';
  static const String home = '/home';
}

final GoRouter appRouter = GoRouter(
  initialLocation: Routers.splash,

  routes: <RouteBase>[],

  observers: [GlobalNavigatorObserver()],
);
