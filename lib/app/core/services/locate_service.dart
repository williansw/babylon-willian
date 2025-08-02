import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart' show kIsWeb, PlatformDispatcher;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageOption {
  final String code;
  final String flag;

  const LanguageOption({required this.code, required this.flag});
}

class LocateService extends ChangeNotifier {
  static const String _localeKey = 'locale_code';
  final List<LanguageOption> supportedLanguages = [
    LanguageOption(code: 'pt', flag: ''),
    LanguageOption(code: 'en', flag: ''),
  ];

  Locale? _locale;
  Locale? get locale => _locale;

  Future<void> init() async {
    _locale = await getInitialLocale();
    notifyListeners();
  }

  Future<Locale> getInitialLocale() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedCode = prefs.getString(_localeKey);
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
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, _locale!.languageCode);
    notifyListeners();
  }

  static Future<void> clearSavedLocale() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_localeKey);
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
}
