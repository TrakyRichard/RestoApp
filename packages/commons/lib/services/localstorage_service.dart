import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../commons.dart';

class LocalStorageService {
  static LocalStorageService? _instance;
  static SharedPreferences? _preferences;
  static const String themeModeKey = 'themeMode';
  static const String isOldUserKey = 'isOldUser';

  ThemeMode get themeMode => _getThemeModeFromDisk(themeModeKey);
  set themeMode(ThemeMode value) => _saveThemeModeToDisk(themeModeKey, value);
  bool get isOldUser => _getIsOldUserFromDisk(isOldUserKey);

  set isOldUser(bool value) => _saveIsOldUserToDisk(isOldUserKey, value);

  ThemeMode _getThemeModeFromDisk(String key) {
    var value = _preferences?.getString(key);
    logger.v(
        'LocalStorageService:_getThemeModeFromDisk. key: $key value: $value');
    return value != null
        ? EnumToString.fromString(ThemeMode.values, value) ?? ThemeMode.system
        : ThemeMode.system;
  }

  void _saveThemeModeToDisk(String key, ThemeMode themeMode) {
    _preferences!.setString(key, EnumToString.convertToString(themeMode));
  }

  static Future<LocalStorageService> getInstance() async {
    _instance ??= LocalStorageService();

    _preferences ??= await SharedPreferences.getInstance();
    return _instance!;
  }

  _getIsOldUserFromDisk(String isOldUserKey) {
    return _preferences?.getBool(isOldUserKey) ?? false;
  }

  _saveIsOldUserToDisk(String isOldUserKey, bool value) {
    _preferences!.setBool(isOldUserKey, value);
  }
}
