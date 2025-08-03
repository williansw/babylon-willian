import '../../../base/base_model.dart';
import '../../../base/route_service.dart';
import '../../../core/common/service/notify/notify_service.dart';
import '../../../core/model/user_model.dart';
import '../../../core/services/local_storage_service.dart';
import '../../../data/user/use_case/user_use_case.dart';

/// ViewModel para a feature 'Splash'.
class SplashViewModel extends BaseModel {
  final UserUseCase userUseCase;
  final LocalStorageService localStorageService;

  SplashViewModel({
    required this.userUseCase,
    required this.localStorageService,
  }) : super();

  @override
  void notify({List<NotifyTypeEnum>? viewModels}) {
    NotifyService.notify([NotifyTypeEnum.splash, ...?viewModels]);
  }

  Future<void> loadData() async {
    await localStorageService.init();
    await Future.delayed(Duration(seconds: 3));
    var userId = localStorageService.getString(LocalStorageKeys.userId);
    if (userId.isNotEmpty) {
      if (await getUser(userId) != null) Nav.goToHome();
    } else {
      Nav.goToLogin();
    }
  }

  Future<UserModel?> getUser(String userId) async {
    return await userUseCase.getUser(userId: userId).then((result) {
      return result.when(
        (success) {
          userUseCase.setUser(success);
          return success;
        },
        (error) {
          setError(error.error ?? '');
          return null;
        },
      );
    });
  }

  @override
  void clean() {}
}
