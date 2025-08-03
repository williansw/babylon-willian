import 'package:babylon/app/base/navigator_service.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import '../core/services/locate_service.dart';
import '../features/home/viewmodel/home_view_model.dart';
import '../features/login/viewmodel/login_view_model.dart';
import '../features/signup/viewmodel/signup_view_model.dart';
import 'app_routes.dart';

final getIt = GetIt.instance;

void setupLocator() {
  // ========== Configuration project ==========
  getIt.registerSingleton<GoRouter>(appRouter);
  getIt.registerSingleton<GlobalNavigatorObserver>(GlobalNavigatorObserver());

  // ========== Data Sources ==========

  // ========== Repositórios ==========

  // ========== Use Cases ==========

  // ========== ViewModels ==========

  getIt.registerFactory<LoginViewModel>(() => LoginViewModel());
  getIt.registerFactory<SignupViewModel>(() => SignupViewModel());
  getIt.registerFactory<HomeViewModel>(() => HomeViewModel());

  // ========== Services ==========
  getIt.registerLazySingleton<LocateService>(() => LocateService());
}
