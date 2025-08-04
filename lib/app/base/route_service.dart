import 'package:babylon/app/base/app_routes.dart';
import 'package:go_router/go_router.dart';

import 'dependences.dart';
import 'navigator_service.dart';

/// Public interface for navigation across the application.
///
/// Provides both simple and named route navigation, as well as utilities
/// for route management and query updates.
abstract class Nav {
  static final _core = _NavigationCore(
    getIt<GoRouter>(),
    getIt<GlobalNavigatorObserver>(),
  );

  // ────────────────────────────────────────
  // Basic Navigation
  // ────────────────────────────────────────

  static void to(
    String path, {
    Map<String, String>? params,
    Object? extra,
    bool clearStack = false,
  }) {
    final uri = _core._buildUri(path, params);
    clearStack
        ? _core.go(uri.toString(), extra: extra)
        : _core.push(uri.toString(), extra: extra);
  }

  static void pushTo(
    String path, {
    Map<String, String>? params,
    Object? extra,
  }) {
    final uri = _core._buildUri(path, params);
    _core.push(uri.toString(), extra: extra);
  }

  static void back() => _core.pop();

  // ────────────────────────────────────────
  // Named Navigation
  // ────────────────────────────────────────
  static void goToSingUp() => to(Routers.singup, clearStack: true);
  static void goToLogin() => to(Routers.login, clearStack: true);
  static void goToHome() => to(Routers.home, clearStack: true);

  // ────────────────────────────────────────
  // Navigation Utilities
  // ────────────────────────────────────────

  static void refresh() => _core.go(_core.currentPath);

  static void updateQueryParams(Map<String, String> newParams) {
    final current = _core.currentPath;
    final uri = Uri.parse(current).replace(queryParameters: newParams);
    _core.go(uri.toString());
  }

  // ────────────────────────────────────────
  // Route Information
  // ────────────────────────────────────────

  static String get currentPath => _core.currentPath;

  static Map<String, String> get currentQueryParams => _core.currentQueryParams;

  static bool get canPop => getIt<GoRouter>().canPop();
}

/// Internal navigation layer encapsulating router logic.
///
/// Keeps the actual router interaction separate from public API.
class _NavigationCore {
  final GoRouter _router;
  final GlobalNavigatorObserver observer;

  _NavigationCore(this._router, this.observer);

  Uri _buildUri(String path, Map<String, String>? queryParams) {
    assert(
      !path.contains('?'),
      'Use queryParams instead of embedding "?" in path',
    );
    return Uri(
      path: path.startsWith('/') ? path : '/$path',
      queryParameters: queryParams,
    );
  }

  void go(String location, {Object? extra}) =>
      _router.go(location, extra: extra);

  void push(String location, {Object? extra}) =>
      _router.push(location, extra: extra);

  void pop() => _router.pop();

  String get currentPath => _router.routeInformationProvider.value.uri.path;

  Map<String, String> get currentQueryParams =>
      _router.routeInformationProvider.value.uri.queryParameters;
}
