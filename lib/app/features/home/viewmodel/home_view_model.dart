import 'package:babylon/app/base/base_model.dart';
import 'package:babylon/app/core/common/service/notify/notify_service.dart';

/// ViewModel for the feature 'Home'.
class HomeViewModel extends BaseModel {
  @override
  void notify({List<NotifyTypeEnum>? viewModels}) {
    NotifyService.notify([NotifyTypeEnum.home, ...?viewModels]);
  }

  @override
  void clean() {}
}
