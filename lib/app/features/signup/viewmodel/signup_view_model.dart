import 'package:babylon/app/common/extension/string_extensions.dart';
import 'package:babylon/app/common/service/notify/notify_service.dart';
import 'package:flutter/material.dart';

import '../../../base/base_model.dart';
import '../../../base/route_service.dart';
import '../../../core/constants/languages/resources.dart';

/// ViewModel para a feature 'Signup'.
class SignupViewModel extends BaseModel {
  final formKey = GlobalKey<FormState>();

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void notify({List<NotifyTypeEnum>? viewModels}) {
    NotifyService.notify([NotifyTypeEnum.signup, ...?viewModels]);
  }

  void goToLogin() => Nav.goToLogin();

  Future<void> loadData() async {
    setLoading();
    try {
      // setSuccess();
    } catch (e) {
      setError('Erro ao carregar dados: $e');
    }
  }

  Future<void> submit() async {
    if (!formKey.currentState!.validate()) return;

    setLoading();

    try {
      await Future.delayed(const Duration(seconds: 2));
      setSuccess();
      Nav.goToHome();
    } catch (e) {
      //setError('${R.loginError}: $e');
    }
  }

  String? validateFullName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return R.nameRequired;
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return R.emailRequired;
    }
    if (!value.isValidEmail()) {
      return R.invalidEmail;
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return R.passwordRequired;
    }
    if (!value.isValidPassword()) {
      return R.passwordInvalidFormat;
    }
    return null;
  }

  @override
  void clean() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
