import 'package:flutter/material.dart';

import '../core/common/mixin/status_notifier.dart';
import '../core/common/service/notify/notify_service.dart';

abstract class BaseModel extends ChangeNotifier with StatusNotifier {
  void notify({List<NotifyTypeEnum>? viewModels});
  void clean();
}
