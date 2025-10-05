import 'package:evently_app/core/constant_manager/cache_constant.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsProviders {
  static late SharedPreferences prefs;
  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static void saveTheme(ThemeMode selectedTheme) {
    String savedTheme = selectedTheme == ThemeMode.light ? "Light" : "Dark";
    prefs.setString(CacheConstant.themeKey, savedTheme);
  }

  static ThemeMode getTheme() {
    ThemeMode getSavedTheme = prefs.getString(CacheConstant.themeKey) == "Light"
        ? ThemeMode.light
        : ThemeMode.dark;
    return getSavedTheme;
  }

  static void saveLanaguge(String lanaguge) {
    prefs.setString(CacheConstant.langKey, lanaguge);
  }

  static getSavedLanaguge() {
    String currentLanaguge = prefs.getString(CacheConstant.langKey) ?? "en";
    return currentLanaguge;
  }
}
