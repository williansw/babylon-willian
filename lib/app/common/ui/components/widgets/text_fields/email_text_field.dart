import 'package:babylon/app/common/ui/components/components.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/languages/resources.dart';
import '../../../../../core/style/styte.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final void Function(String)? onChanged;

  const EmailTextField({
    super.key,
    required this.controller,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomTextField(
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      keyboardType: TextInputType.emailAddress,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.medium),
        borderSide: BorderSide(color: theme.dividerColor, width: 1),
      ),
      labelText: R.emailLabel,
    );
  }
}
