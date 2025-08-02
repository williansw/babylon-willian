import 'package:flutter/material.dart';

import '../../../../../core/style/styte.dart';

/// Custom text widget that applies centralized styles through [AppTextStyle].
///
/// This ensures consistent typography across the entire application.
class CustomText extends StatelessWidget {
  final String label;
  final AppTextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool? softWrap;
  final VoidCallback? onTap;
  final TextDirection? textDirection;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;

  const CustomText(
    this.label, {
    super.key,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.onTap,
    this.textDirection,
    this.textWidthBasis,
    this.textHeightBehavior,
  });

  @override
  Widget build(BuildContext context) {
    Widget text = Text(
      label,
      style: style?.style,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      textDirection: textDirection,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
    );

    if (onTap != null) {
      return GestureDetector(onTap: onTap, child: text);
    }

    return text;
  }
}
