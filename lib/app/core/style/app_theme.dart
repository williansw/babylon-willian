import 'package:flutter/material.dart';
import 'app_color.dart';
import 'app_text_style.dart';

/// Defines the default app-wide theme, including text styles.
/// This configuration avoids GoogleFonts and uses system-registered font family.
class AppTheme {
  static TextTheme get textTheme => TextTheme(
    displayLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: AppColor.text,
      fontFamily: kAppFontFamily,
    ),
    displayMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColor.text,
      fontFamily: kAppFontFamily,
    ),
    displaySmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: AppColor.text,
      fontFamily: kAppFontFamily,
    ),
    headlineLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: AppColor.text,
      fontFamily: kAppFontFamily,
    ),
    headlineMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: AppColor.text,
      fontFamily: kAppFontFamily,
    ),
    headlineSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: AppColor.text,
      fontFamily: kAppFontFamily,
    ),
    titleLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: AppColor.text,
      fontFamily: kAppFontFamily,
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: AppColor.text,
      fontFamily: kAppFontFamily,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: AppColor.text,
      fontFamily: kAppFontFamily,
    ),
    bodyLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: AppColor.text,
      fontFamily: kAppFontFamily,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColor.text,
      fontFamily: kAppFontFamily,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColor.textContrast,
      fontFamily: kAppFontFamily,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColor.text,
      fontFamily: kAppFontFamily,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColor.text,
      fontFamily: kAppFontFamily,
    ),
    labelSmall: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: AppColor.textContrast,
      fontFamily: kAppFontFamily,
    ),
  );
}
