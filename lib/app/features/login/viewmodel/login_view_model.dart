import 'package:babylon/app/base/route_service.dart';
import 'package:babylon/app/core/common/extension/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:babylon/app/base/base_model.dart';
import 'package:babylon/app/core/common/service/notify/notify_service.dart';

import '../../../core/constants/languages/languages.dart';
import '../../../core/services/firebase_service.dart';
import '../../../core/services/local_storage_service.dart';
import '../../../data/auth/use_case/auth_use_case.dart';
import '../../../data/user/use_case/user_use_case.dart';

class LoginViewModel extends BaseModel {
  final UserUseCase userUseCase;
  final AuthUseCase authUseCase;
  final FirebaseService firebaseService;
  final LocalStorageService localStorageService;
  LoginViewModel({
    required this.userUseCase,
    required this.authUseCase,
    required this.firebaseService,
    required this.localStorageService,
  });

  final formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void notify({List<NotifyTypeEnum>? viewModels}) {
    NotifyService.notify([NotifyTypeEnum.login, ...?viewModels]);
  }

  void goToSingUp() => Nav.goToSingUp();

  Future<void> signInWithEmailAndPassword() async {
    if (!formKey.currentState!.validate()) return;
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      setError(R.signupMissingEmailOrPassword);
      return;
    }
    setLoading();
    try {
      await authUseCase
          .auth(
            email: emailController.text.toLowerCase(),
            password: passwordController.text,
          )
          .then((result) {
            return result.when(
              (success) async {
                if (success.userCredential.user?.uid != null) {
                  await localStorageService.setString(
                    LocalStorageKeys.userId,
                    success.userCredential.user?.uid ?? '',
                  );
                  localStorageService.setString(
                    LocalStorageKeys.email,
                    emailController.text.toLowerCase(),
                  );
                  _getUser(success.userCredential.user!.uid);
                }
              },
              (error) {
                setError(firebaseService.mapAuthError(error.error ?? ''));
              },
            );
          });
    } catch (e) {
      setError(R.genericErrorWithDetail('$e'));
    }
  }

  Future<bool> _getUser(String userId) async {
    try {
      return userUseCase.getUser(userId: userId).then((result) {
        return result.when(
          (success) {
            setSuccess();
            userUseCase.setUser(success);
            Nav.goToHome();
            return true;
          },
          (error) {
            setError(error.error ?? R.genericError);
            return false;
          },
        );
      });
    } catch (e) {
      setError(R.genericErrorWithDetail('$e'));
      return false;
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
