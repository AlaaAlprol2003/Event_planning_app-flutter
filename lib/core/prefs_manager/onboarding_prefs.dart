import 'package:shared_preferences/shared_preferences.dart';

class OnboardingPrefs {
  static Future<bool> getIsFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool("is_first_time") ?? true;
     
  }

  static Future<bool> setIsFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool("is_first_time", false);
     
  }
}
