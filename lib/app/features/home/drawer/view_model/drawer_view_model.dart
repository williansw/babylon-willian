import '../../../../base/base_model.dart';
import '../../../../base/route_service.dart';
import '../../../../core/common/service/notify/notify_service.dart';
import '../../../../core/services/local_storage_service.dart';
import '../../../../data/user/use_case/user_use_case.dart';

class DrawerViewModel extends BaseModel {
  final UserUseCase userUseCase;
  final LocalStorageService localStorageService;
  DrawerViewModel({
    required this.userUseCase,
    required this.localStorageService,
  });

  @override
  void notify({List<NotifyTypeEnum>? viewModels}) {
    NotifyService.notify([NotifyTypeEnum.drawer, ...?viewModels]);
  }

  void onLogout() {
    localStorageService.remove(LocalStorageKeys.userId);
    localStorageService.remove(LocalStorageKeys.email);
    userUseCase.setUser(null);
    Nav.back();
    Nav.goToLogin();
  }

  @override
  void clean() {}
}
