import 'package:evently_app/core/prefs_manager/prefs_providers.dart';
import 'package:flutter/material.dart';

class LanagugeProvider extends ChangeNotifier{
  String currentLang = PrefsProviders.getSavedLanaguge();
  bool get isEnglish => currentLang == "en";
  void changeAppLanaguge(String newLang){
    if(currentLang == newLang) return;
    currentLang = newLang;
    PrefsProviders.saveLanaguge(currentLang);
    notifyListeners();
  }
}