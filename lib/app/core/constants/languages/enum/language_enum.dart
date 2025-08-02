import 'package:babylon/app/core/constants/languages/languages.dart';

enum LanguageEnum {
  portuguese(code: 'pt'),
  english(code: 'en');

  final String code;

  const LanguageEnum({required this.code});
  static List<LanguageEnum> get activeLanguages => [
    LanguageEnum.portuguese,
    LanguageEnum.english,
  ];

  static LanguageEnum fromCode(String code) {
    return LanguageEnum.values.firstWhere(
      (lang) => lang.code == code,
      orElse: () => LanguageEnum.portuguese,
    );
  }
}

extension LanguageNameExtensions on LanguageEnum {
  String get name {
    switch (this) {
      case LanguageEnum.portuguese:
        return R.portuguese;
      case LanguageEnum.english:
        return R.english;
    }
  }
}

extension LanguageEnumExtensions on LanguageEnum {
  String get flag {
    switch (this) {
      case LanguageEnum.portuguese:
        return 'flagBr';
      case LanguageEnum.english:
        return 'flagEn';
    }
  }
}
