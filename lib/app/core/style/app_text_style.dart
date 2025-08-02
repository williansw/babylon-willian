import 'package:flutter/material.dart';
import 'app_color.dart';

/// Global font family used throughout the app.
/// Modify this to change the app's font globally.
const kAppFontFamily = 'Nunito';

/// Custom text style class to enforce a unified text styling approach.
/// Wraps Flutter's TextStyle and provides shortcut methods.
@immutable
class AppTextStyle {
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final FontStyle? fontStyle;
  final double? letterSpacing;
  final double? wordSpacing;
  final double? height;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;
  final double? decorationThickness;
  final List<Shadow>? shadows;
  final String? fontFamily;

  /// Constructor for defining custom text style attributes.
  const AppTextStyle({
    this.fontSize,
    this.fontWeight,
    this.color,
    this.fontStyle,
    this.letterSpacing,
    this.wordSpacing,
    this.height,
    this.decoration,
    this.decorationColor,
    this.decorationStyle,
    this.decorationThickness,
    this.shadows,
    this.fontFamily = kAppFontFamily,
  });

  /// Returns a [TextStyle] object using the current configuration.
  TextStyle get style {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      height: height,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
      shadows: shadows,
      fontFamily: fontFamily,
    );
  }

  /// Returns a copy of the current style with overridden properties.
  AppTextStyle copyWith({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? wordSpacing,
    double? height,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    List<Shadow>? shadows,
    String? fontFamily,
  }) {
    return AppTextStyle(
      fontSize: fontSize ?? this.fontSize,
      fontWeight: fontWeight ?? this.fontWeight,
      color: color ?? this.color,
      fontStyle: fontStyle ?? this.fontStyle,
      letterSpacing: letterSpacing ?? this.letterSpacing,
      wordSpacing: wordSpacing ?? this.wordSpacing,
      height: height ?? this.height,
      decoration: decoration ?? this.decoration,
      decorationColor: decorationColor ?? this.decorationColor,
      decorationStyle: decorationStyle ?? this.decorationStyle,
      decorationThickness: decorationThickness ?? this.decorationThickness,
      shadows: shadows ?? this.shadows,
      fontFamily: fontFamily ?? this.fontFamily,
    );
  }

  /// Common shortcut modifiers
  AppTextStyle get regular => copyWith(fontWeight: FontWeight.w400);
  AppTextStyle get bold => copyWith(fontWeight: FontWeight.w700);
  AppTextStyle size(double sz) => copyWith(fontSize: sz);
  AppTextStyle colorize(Color c) => copyWith(color: c);
  AppTextStyle useFont(String family) => copyWith(fontFamily: family);
  AppTextStyle useGoogleFont(String fontName) => copyWith();
  AppTextStyle get italic => copyWith(fontStyle: FontStyle.italic);
  AppTextStyle get underline => copyWith(decoration: TextDecoration.underline);
  AppTextStyle get strikeThrough =>
      copyWith(decoration: TextDecoration.lineThrough);
  AppTextStyle get overline => copyWith(decoration: TextDecoration.overline);

  /// Predefined styles using Nunito font
  static AppTextStyle get bodySmall => AppTextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColor.textContrast,
  );
  static AppTextStyle get bodyMedium => AppTextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColor.text,
  );
  static AppTextStyle get bodyLarge => AppTextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: AppColor.text,
  );
  static AppTextStyle get labelSmall => AppTextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: AppColor.textContrast,
  );
  static AppTextStyle get labelMedium => AppTextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColor.text,
  );
  static AppTextStyle get labelLarge => AppTextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColor.text,
  );
  static AppTextStyle get button => AppTextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColor.text,
  );
  static AppTextStyle get caption => AppTextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColor.textContrast,
  );
  static AppTextStyle get headlineSmall => AppTextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColor.text,
  );
  static AppTextStyle get headlineMedium => AppTextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColor.text,
  );
  static AppTextStyle get headlineLarge => AppTextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColor.text,
  );
  static AppTextStyle get displaySmall => AppTextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColor.text,
  );
  static AppTextStyle get displayMedium => AppTextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColor.text,
  );
  static AppTextStyle get displayLarge => AppTextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: AppColor.text,
  );
  static AppTextStyle get titleSmall => AppTextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColor.text,
  );
  static AppTextStyle get titleMedium => AppTextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColor.text,
  );
  static AppTextStyle get titleLarge => AppTextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColor.text,
  );
}
