import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {
  static final box = GetStorage();
  static const _key = 'themeMode';

  static ThemeMode get theme => _loadThemeFromBox();

  static ThemeMode _loadThemeFromBox() {
    final int? theme = box.read(_key);
    if (theme != null) {
      return ThemeMode.values[theme];
    }
    return ThemeMode.light;
  }

  static _saveTheme(ThemeMode themeMode) => box.write(_key, themeMode);

  static void changeAndSaveTheme(ThemeMode themeMode) {
    Get.changeThemeMode(themeMode);
    _saveTheme(themeMode);
  }
}
