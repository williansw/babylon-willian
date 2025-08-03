import 'package:babylon/app/core/common/ui/components/components.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/languages/resources.dart';
import '../../../../../style/styte.dart';

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
    return CustomTextField(
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      keyboardType: TextInputType.emailAddress,
      labelText: R.emailLabel,
      style: TextStyle(fontSize: 18),
      filled: true,
      fillColor: AppColor.white,
    );
  }
}
