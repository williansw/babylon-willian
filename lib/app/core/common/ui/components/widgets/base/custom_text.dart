import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../services/locate_service.dart';
import '../../../../../style/styte.dart';

/// Custom text widget that applies centralized styles through [AppTextStyle].

/// Use either [label] for static text or [translated] for localized content.
class CustomText extends StatelessWidget {
  final String? label;

  /// A function that returns the localized string (e.g., () => R.hiUser('Willian'))
  final String Function()? translated;

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
  }) : translated = null;

  const CustomText.translated(
    this.translated, {
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
  }) : label = null;

  @override
  Widget build(BuildContext context) {
    if (translated != null) {
      return Consumer<LocateService>(
        builder: (_, __, ___) {
          return _buildText(translated!());
        },
      );
    }
    return _buildText(label ?? '');
  }

  Widget _buildText(String content) {
    final textWidget = Text(
      content,
      style: style?.style,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      textDirection: textDirection,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
    );

    return onTap != null
        ? GestureDetector(onTap: onTap, child: textWidget)
        : textWidget;
  }
}
