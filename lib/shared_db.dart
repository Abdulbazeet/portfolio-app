import 'package:shared_preferences/shared_preferences.dart';

class ThemeDb {
  static const String _themeKey = "isDarkMode";

  static Future<void> storeTheme(bool isDark) async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    await sp.setBool(_themeKey, isDark);
    // sp.
  }

  static Future<bool?> getTheme() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    return sp.getBool(_themeKey);
    // sp.
  }
  
}
