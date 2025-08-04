import 'package:babylon/app/core/common/extension/string_extensions.dart';
import 'package:babylon/app/core/common/service/notify/notify_service.dart';
import 'package:flutter/material.dart';

import '../../../base/base_model.dart';
import '../../../base/route_service.dart';
import '../../../core/constants/languages/resources.dart';
import '../../../core/model/user_model.dart';
import '../../../core/services/firebase_service.dart';
import '../../../core/services/local_storage_service.dart';
import '../../../data/auth/use_case/auth_use_case.dart';
import '../../../data/user/use_case/user_use_case.dart';

/// ViewModel for the feature 'Signup'.
class SignUpViewModel extends BaseModel {
  final AuthUseCase authUseCase;
  final UserUseCase userUseCase;
  final LocalStorageService localStorageService;
  final FirebaseService firebaseService;
  SignUpViewModel({
    required this.authUseCase,
    required this.userUseCase,
    required this.localStorageService,
    required this.firebaseService,
  }) : super();

  final formKey = GlobalKey<FormState>();

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void notify({List<NotifyTypeEnum>? viewModels}) {
    NotifyService.notify([NotifyTypeEnum.signup, ...?viewModels]);
  }

  void goToLogin() => Nav.goToLogin();

  Future<void> createUserWithEmailAndPassword() async {
    if (!formKey.currentState!.validate()) return;
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      setError(R.signupMissingEmailOrPassword);
      return;
    }
    setLoading();
    try {
      await authUseCase
          .create(
            email: emailController.text.toLowerCase(),
            password: passwordController.text,
          )
          .then((result) {
            return result.when(
              (success) async {
                setSuccess();
                if (success.userCredential.user?.uid != null) {
                  localStorageService.setString(
                    LocalStorageKeys.userId,
                    success.userCredential.user?.uid ?? '',
                  );
                  localStorageService.setString(
                    LocalStorageKeys.email,
                    emailController.text.toLowerCase(),
                  );
                  await _createUser(success.userCredential.user!.uid);
                }
              },
              (error) {
                setError(firebaseService.mapAuthError(error.error ?? ''));
                return null;
              },
            );
          });
    } catch (e) {
      setError(R.genericErrorWithDetail(e.toString()));
    }
  }

  Future<bool> _createUser(String userId) async {
    setLoading();
    var userModel = UserModel(
      id: userId,
      name: fullNameController.text.removeDiacritics.capitalized,
      email: emailController.text.toLowerCase().removeDiacritics,
      password: passwordController.text,
      createdAt: DateTime.now(),
    );
    try {
      await userUseCase.createUser(user: userModel).then((result) {
        return result.when(
          (sucess) {
            userUseCase.setUser(userModel);
            setSuccess();
            Nav.goToHome();
          },
          (error) {
            setError(R.genericErrorWithDetail(error.error));
          },
        );
      });
      setSuccess();
    } catch (e) {
      setError(R.genericErrorWithDetail(e.toString()));
    }
    return false;
  }

  String? validateFullName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return R.nameRequired;
    }
    if (!value.isValidName()) {
      return R.fullNameLabel;
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
