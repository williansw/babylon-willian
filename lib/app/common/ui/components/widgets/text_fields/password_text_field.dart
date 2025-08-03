import 'package:babylon/app/common/ui/components/widgets/base/custom_text_field.dart';
import 'package:babylon/app/core/style/styte.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/languages/languages.dart';

class PasswordTextField extends StatelessWidget {
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final void Function(String)? onChanged;
  final bool obscureText;

  const PasswordTextField({
    super.key,
    required this.controller,
    this.validator,
    this.onChanged,
    this.obscureText = true,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      obscureText: obscureText,
      labelText: R.passwordLabel,
      filled: true,
      fillColor: AppColor.white,
    );
  }
}
