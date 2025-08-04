import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageKeys {
  static const email = 'email';
  static const userId = 'user_id';
  static const localeCode = 'locale_code';
}

class LocalStorageService {
  static final LocalStorageService _instance = LocalStorageService._internal();
  factory LocalStorageService() => _instance;

  static SharedPreferences? _prefs;

  LocalStorageService._internal();

  Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  // Strings
  Future<void> setString(String key, String value) async {
    await _prefs?.setString(key, value);
  }

  String getString(String key, {String defaultValue = ''}) {
    return _prefs?.getString(key) ?? defaultValue;
  }

  // Bools
  Future<void> setBool(String key, bool value) async {
    await _prefs?.setBool(key, value);
  }

  bool getBool(String key, {bool defaultValue = false}) {
    return _prefs?.getBool(key) ?? defaultValue;
  }

  Future<void> remove(String key) async {
    await _prefs?.remove(key);
  }
}
