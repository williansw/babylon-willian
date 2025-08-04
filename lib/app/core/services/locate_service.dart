import 'package:babylon/app/base/base_model.dart';
import 'package:babylon/app/core/common/service/notify/notify_service.dart';
import 'package:babylon/app/core/services/local_storage_service.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart' show kIsWeb, PlatformDispatcher;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/languages/languages.dart';

class LanguageOption {
  final String code;
  const LanguageOption({required this.code});
}

class LocateService extends BaseModel {
  @override
  void notify({List<NotifyTypeEnum>? viewModels}) {
    NotifyService.notify([NotifyTypeEnum.language, ...?viewModels]);
  }

  final List<LanguageOption> supportedLanguages = [
    LanguageOption(code: LanguageEnum.portuguese.code),
    LanguageOption(code: LanguageEnum.english.code),
  ];

  List<Locale> get supportedLocales =>
      LanguageEnum.activeLanguages.map((l) => Locale(l.code)).toList();

  static Locale _locale = Locale(LanguageEnum.english.code);
  Locale get locale => _locale;

  LanguageEnum? _selectedLanguage;

  LanguageEnum get selectedLanguage =>
      _selectedLanguage ?? LanguageEnum.english;

  Future<void> init() async {
    _locale = await getInitialLocale();
    notify(viewModels: [NotifyTypeEnum.home]);
  }

  Future<Locale> getInitialLocale() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedCode = prefs.getString(LocalStorageKeys.localeCode);
      if (savedCode != null) {
        return _validateLocale(Locale(savedCode));
      }

      if (kIsWeb) {
        final locale = PlatformDispatcher.instance.locales.first;
        return _validateLocale(locale);
      } else {
        final systemLocale =
            WidgetsBinding.instance.platformDispatcher.locales.first;
        return _validateLocale(systemLocale);
      }
    } catch (e) {
      return const Locale('en');
    }
  }

  Future<void> changeLocale(String? languageCode) async {
    if (languageCode == null) return;
    _locale = _validateLocale(Locale(languageCode));
    _selectedLanguage = LanguageEnum.fromCode(languageCode);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(LocalStorageKeys.localeCode, _locale.languageCode);
    notify(viewModels: [NotifyTypeEnum.home]);
  }

  static Future<void> clearSavedLocale() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(LocalStorageKeys.localeCode);
  }

  Locale _validateLocale(Locale locale) {
    var loc = supportedLanguages.firstWhereOrNull(
      (e) => e.code == locale.languageCode,
    );

    if (loc != null) {
      return locale;
    }
    return const Locale('en');
  }

  @override
  void clean() {}
}
