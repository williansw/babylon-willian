import 'package:flutter/material.dart';

import '../../../../core/style/styte.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool enabled;
  final bool isLoading;
  final double? width;
  final double? height;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.enabled = true,
    this.isLoading = false,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height ?? 42,

      margin: const EdgeInsets.symmetric(
        vertical: Spacing.x2,
        horizontal: Spacing.x2,
      ),
      child: ElevatedButton(
        onPressed: (enabled && !isLoading) ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: colorBackground,
          foregroundColor: colorText,
          elevation: enabled ? 2 : 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Spacing.x1),
          ),
          textStyle: AppTextStyle.button.style.copyWith(color: colorText),
        ),
        child: isLoading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  textWidget,
                  SizedBox(width: Spacing.x3),
                  circularWidget,
                ],
              )
            : textWidget,
      ),
    );
  }

  Widget get textWidget =>
      Text(text, style: AppTextStyle.button.style.copyWith(color: colorText));

  Widget get circularWidget => const SizedBox(
    width: 24,
    height: 24,
    child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
  );

  Color get colorBackground {
    if (!enabled) return AppColor.border;
    return AppColor.primary;
  }

  Color get colorText {
    if (!enabled) return AppColor.textContrast;
    return AppColor.white;
  }
}
