import 'package:babylon/app/common/extension/widget_extensions.dart';
import 'package:babylon/app/core/style/styte.dart';
import 'package:flutter/material.dart';
import '../../../common/ui/components/components.dart';

import '../../../common/ui/components/widgets/text_fields/email_text_field.dart';
import '../../../common/ui/components/widgets/text_fields/password_text_field.dart';
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
      padding: EdgeInsets.symmetric(vertical: Spacing.x4),
      child: Form(
        key: viewModel.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [title, textFields, loginButton, signupButton],
        ),
      ).centered,
    );
  }

  Widget get title =>
      Text(R.welcomeToBabylon, style: AppTextStyle.displayMedium.style);

  Widget get textFields => Column(
    children: [
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
    ],
  );

  Widget get loginButton => CustomButton(
    text: R.loginButton,
    width: double.infinity,
    margin: EdgeInsets.zero,
    isLoading: viewModel.isLoading,
    onPressed: () => viewModel.submit(),
  );

  Widget get signupButton => Padding(
    padding: const EdgeInsets.only(top: Spacing.x2),
    child: TextButton(
      onPressed: () => {},
      child: CustomText(R.createAccount, style: AppTextStyle.labelLarge),
    ),
  );
}
