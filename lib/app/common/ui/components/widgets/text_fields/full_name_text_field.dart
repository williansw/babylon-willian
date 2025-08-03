import 'package:babylon/app/common/ui/components/components.dart';
import 'package:flutter/material.dart';
import '../../../../../core/constants/languages/languages.dart';
import '../../../../../core/style/styte.dart';

class FullNameTextField extends StatelessWidget {
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final void Function(String)? onChanged;

  const FullNameTextField({
    super.key,
    required this.controller,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      labelText: R.fullNameLabel,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      filled: true,
      fillColor: AppColor.white,
    );
  }
}
