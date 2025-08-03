import 'package:babylon/app/core/common/extension/widget_extensions.dart';
import 'package:babylon/app/core/common/ui/components/widgets/text_fields/full_name_text_field.dart';
import 'package:flutter/material.dart';
import '../../../core/common/ui/components/components.dart';
import '../../../core/common/ui/components/widgets/text_fields/email_text_field.dart';
import '../../../core/common/ui/components/widgets/text_fields/password_text_field.dart';
import '../../../core/constants/languages/resources.dart';
import '../../../core/style/styte.dart';
import '../viewmodel/signup_view_model.dart';

class SignupView extends StatelessWidget {
  final SignupViewModel viewModel;

  const SignupView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      viewModel: viewModel,
      body: _SingUpForm(viewModel: viewModel).padAll(Spacing.x4),
    );
  }
}

class _SingUpForm extends StatelessWidget {
  final SignupViewModel viewModel;
  const _SingUpForm({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: Spacing.x3),
      child: Form(
        key: viewModel.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [title, textFields, singUpButton],
        ),
      ).centered,
    );
  }

  Widget get title => Text(
    R.createAccount,
    style: AppTextStyle.styleBase.copyWith(fontSize: 25).style,
  );

  Widget get textFields => Column(
    children: [
      FullNameTextField(
        controller: viewModel.passwordController,
        validator: viewModel.validateFullName,
      ),
      SizedBox(height: Spacing.x3),
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

  Widget get singUpButton => Column(
    children: [
      CustomButton(
        text: R.registerButton,
        width: double.infinity,
        margin: EdgeInsets.zero,
        isLoading: viewModel.isLoading,
        onPressed: () => viewModel.submit(),
      ),
      SizedBox(height: Spacing.x4),
      loginButton,
    ],
  );

  Widget get loginButton => TextButton(
    child: CustomText(R.backToLogin, style: AppTextStyle.labelLarge),
    onPressed: () => viewModel.goToLogin(),
  );
}
