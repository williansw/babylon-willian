import 'package:babylon/app/core/common/extension/widget_extensions.dart';
import 'package:babylon/app/core/style/styte.dart';
import 'package:flutter/material.dart';
import '../../../core/common/ui/components/components.dart';

import '../../../core/common/ui/components/widgets/text_fields/email_text_field.dart';
import '../../../core/common/ui/components/widgets/text_fields/password_text_field.dart';
import '../../../core/constants/languages/languages.dart';
import '../viewmodel/login_view_model.dart';

class LoginView extends StatelessWidget {
  final LoginViewModel viewModel;

  const LoginView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      viewModel: viewModel,
      body: _LoginForm(viewModel: viewModel).padAll(Spacing.x4),
    );
  }
}

class _LoginForm extends StatelessWidget {
  final LoginViewModel viewModel;
  const _LoginForm({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: Spacing.x3),
      child: Form(
        key: viewModel.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [title, textFields, loginButton],
        ),
      ).centered,
    );
  }

  Widget get title => Text(
    R.welcomeToBabylon,
    style: AppTextStyle.styleBase.copyWith(fontSize: 25).style,
  );

  Widget get textFields => Column(
    children: [
      SizedBox(height: Spacing.x4),
      EmailTextField(
        controller: viewModel.emailController,
        validator: viewModel.validateEmail,
      ),
      Spacing.x3.spaceV,
      PasswordTextField(
        controller: viewModel.passwordController,
        obscureText: true,
        validator: viewModel.validatePassword,
      ),
      SizedBox(height: Spacing.x4),
    ],
  );

  Widget get loginButton => Column(
    children: [
      CustomButton(
        text: R.loginButton,
        width: double.infinity,
        margin: EdgeInsets.zero,
        isLoading: viewModel.isLoading,
        onPressed: () => viewModel.submit(),
      ),
      SizedBox(height: Spacing.x4),
      signUpButton,
    ],
  );

  Widget get signUpButton => TextButton(
    child: CustomText(R.createAccount, style: AppTextStyle.labelLarge),
    onPressed: () => viewModel.goToSingUp(),
  );
}
