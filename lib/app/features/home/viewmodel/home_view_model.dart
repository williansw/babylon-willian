import 'package:babylon/app/base/base_model.dart';
import 'package:babylon/app/core/common/service/notify/notify_service.dart';
import 'package:flutter/material.dart';

import '../../../core/model/user_model.dart';
import '../../../data/user/use_case/user_use_case.dart';

/// ViewModel for the feature 'Home'.
class HomeViewModel extends BaseModel {
  final UserUseCase userUseCase;

  HomeViewModel({required this.userUseCase});
  @override
  void notify({List<NotifyTypeEnum>? viewModels}) {
    NotifyService.notify([NotifyTypeEnum.home, ...?viewModels]);
  }

  UserModel? get user => userUseCase.user;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawer() => scaffoldKey.currentState?.openDrawer();

  @override
  void clean() {}
}
