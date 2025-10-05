import 'package:evently_app/core/prefs_manager/prefs_providers.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
   ThemeMode currentTheme = PrefsProviders.getTheme();
   bool get isDark => currentTheme == ThemeMode.dark;

  void changeAppTheme(ThemeMode newTheme) {
    if(currentTheme == newTheme) return;
    currentTheme = newTheme;
    PrefsProviders.saveTheme(currentTheme);
    notifyListeners();
  }
}
