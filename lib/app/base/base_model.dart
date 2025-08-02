import 'package:flutter/material.dart';

import '../common/mixin/status_notifier.dart';
import '../common/service/notify/notify_service.dart';

abstract class BaseModel extends ChangeNotifier with StatusNotifier {
  void notify({List<NotifyTypeEnum>? viewModels});
  void clean();
}
