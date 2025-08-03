import 'package:babylon/app/base/navigator_service.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../core/services/firebase_service.dart';
import '../core/services/local_storage_service.dart';
import '../core/services/locate_service.dart';
import '../data/auth/data/auth_data_source.dart';
import '../data/auth/data/auth_data_source_imp.dart';
import '../data/auth/repository/auth_repository.dart';
import '../data/auth/repository/auth_repository_imp.dart';
import '../data/auth/use_case/auth_use_case.dart';
import '../data/user/data/user_data_source.dart';
import '../data/user/data/user_data_source_imp.dart';
import '../data/user/repository/user_repository.dart';
import '../data/user/repository/user_repository_imp.dart';
import '../data/user/use_case/user_use_case.dart';
import '../features/home/viewmodel/home_view_model.dart';
import '../features/login/viewmodel/login_view_model.dart';
import '../features/signup/viewmodel/signup_view_model.dart';
import '../features/splash/viewmodel/splash_view_model.dart';
import 'app_routes.dart';

final getIt = GetIt.instance;

void setupLocator() {
  // ========== Configuration project ==========
  getIt.registerSingleton<GoRouter>(appRouter);
  getIt.registerSingleton<GlobalNavigatorObserver>(GlobalNavigatorObserver());

  // ========== Data Sources ==========

  getIt.registerLazySingleton<AuthDataSource>(() => AuthDataSourceImp());
  getIt.registerLazySingleton<UserDataSource>(() => UserDataSourceImp());

  // ========== Repositórios ==========

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImp(dataSource: getIt<AuthDataSource>()),
  );
  getIt.registerLazySingleton<UserRepository>(
    () => UserRepositoryImp(dataSource: getIt<UserDataSource>()),
  );
  // ========== Use Cases ==========
  getIt.registerLazySingleton<AuthUseCase>(
    () => AuthUseCase(repository: getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<UserUseCase>(
    () => UserUseCase(repository: getIt<UserRepository>()),
  );
  // ========== ViewModels ==========

  getIt.registerFactory<SplashViewModel>(
    () => SplashViewModel(
      userUseCase: getIt<UserUseCase>(),
      localStorageService: getIt<LocalStorageService>(),
    ),
  );

  getIt.registerFactory<LoginViewModel>(
    () => LoginViewModel(
      authUseCase: getIt<AuthUseCase>(),
      userUseCase: getIt<UserUseCase>(),
      firebaseService: getIt<FirebaseService>(),
      localStorageService: getIt<LocalStorageService>(),
    ),
  );
  getIt.registerFactory<SignUpViewModel>(
    () => SignUpViewModel(
      authUseCase: getIt<AuthUseCase>(),
      userUseCase: getIt<UserUseCase>(),
      firebaseService: getIt<FirebaseService>(),
      localStorageService: getIt<LocalStorageService>(),
    ),
  );
  getIt.registerFactory<HomeViewModel>(() => HomeViewModel());

  // ========== Services ==========
  getIt.registerLazySingleton<LocateService>(() => LocateService());
  getIt.registerLazySingleton<FirebaseService>(() => FirebaseService());
  getIt.registerSingleton<LocalStorageService>(LocalStorageService());
}
