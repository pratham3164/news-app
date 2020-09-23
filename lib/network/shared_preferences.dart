import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePrferences {
  static const String isDarkTheme = 'ISDARKTHEME';

  setDarkTheme(value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isDarkTheme, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isDarkTheme) ?? false;
  }
}
