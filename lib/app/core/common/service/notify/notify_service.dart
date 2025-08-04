import 'package:babylon/app/features/login/viewmodel/login_view_model.dart';
import 'package:flutter/foundation.dart';

import '../../../../base/dependences.dart';
import '../../../../features/home/drawer/view_model/drawer_view_model.dart';
import '../../../../features/home/viewmodel/home_view_model.dart';
import '../../../../features/signup/viewmodel/signup_view_model.dart';
import '../../../../features/splash/viewmodel/splash_view_model.dart';
import '../../../exceptions/service/log_service.dart';
import '../../../services/locate_service.dart';

enum NotifyTypeEnum { splash, login, signup, home, drawer, language }

class NotifyService extends ChangeNotifier {
  NotifyService._();
  static notify(List<NotifyTypeEnum>? viewModels) {
    viewModels?.forEach(
      (view) => LogService.console(
        message: 'NotifyType | ${view.name} updated.',
        local: ' notify',
        logLevel: LogLevel.info,
      ),
    );

    if (viewModels == null) return;
    for (var type in viewModels) {
      switch (type) {
        case NotifyTypeEnum.splash:
          getIt<SplashViewModel>().notifyListeners();
          break;
        case NotifyTypeEnum.login:
          getIt<LoginViewModel>().notifyListeners();
          break;
        case NotifyTypeEnum.signup:
          getIt<SignUpViewModel>().notifyListeners();
          break;
        case NotifyTypeEnum.home:
          getIt<HomeViewModel>().notifyListeners();
          break;
        case NotifyTypeEnum.drawer:
          getIt<DrawerViewModel>().notifyListeners();
          break;
        case NotifyTypeEnum.language:
          getIt<LocateService>().notifyListeners();
          break;
      }
    }
  }
}
