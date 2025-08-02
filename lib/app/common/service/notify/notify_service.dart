import 'package:flutter/foundation.dart';

import '../../../core/exceptions/service/log_service.dart';

enum NotifyTypeEnum { splash, login, signup, home }

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
          //getIt<SplashViewModel>().notifyListeners();
          break;
        case NotifyTypeEnum.login:
          //getIt<SignUpViewModel>().notifyListeners();
          break;
        case NotifyTypeEnum.signup:
          //getIt<SignUpViewModel>().notifyListeners();
          break;
        case NotifyTypeEnum.home:
          //getIt<HomeViewModel>().notifyListeners();
          break;
      }
    }
  }
}
