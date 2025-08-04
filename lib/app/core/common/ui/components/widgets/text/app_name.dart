import 'package:flutter/material.dart';

import '../../../../../constants/languages/languages.dart';
import '../../../../../style/styte.dart';

class AppName extends StatelessWidget {
  final double fontSize;
  final Color color;
  final TextAlign textAlign;

  const AppName({
    super.key,
    this.fontSize = 40,
    this.color = AppColor.logoGreen,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      R.appName.toUpperCase(),
      style: AppTextStyle.displayLarge
          .copyWith(
            fontWeight: FontWeight.w900,
            fontSize: fontSize,
            color: color,
            letterSpacing: 1.5,
          )
          .style,
      textAlign: textAlign,
    );
  }
}
