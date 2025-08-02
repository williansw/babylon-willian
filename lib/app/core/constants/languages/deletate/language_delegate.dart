import 'package:babylon/app/core/constants/languages/languages.dart';
import 'package:flutter/material.dart';

class LanguageDelegate extends LocalizationsDelegate<Languages> {
  const LanguageDelegate();

  @override
  bool isSupported(Locale locale) => LanguageEnum.activeLanguages
      .map((l) => l.code)
      .contains(locale.languageCode);

  @override
  Future<Languages> load(Locale locale) => _load(locale);

  Future<Languages> _load(Locale locale) async {
    Languages language = LanguageEn();
    switch (LanguageEnum.fromCode(locale.languageCode)) {
      case LanguageEnum.portuguese:
        language = LanguagePt();
        break;
      case LanguageEnum.english:
        language = LanguageEn();
        break;
    }
    R.load(language: language);
    return language;
  }

  @override
  bool shouldReload(LocalizationsDelegate<Languages> old) => false;
}
