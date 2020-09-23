import 'package:flutter/cupertino.dart';
import 'package:newsapp/network/shared_preferences.dart';

class DarkThemeProvider extends ChangeNotifier {
  DarkThemePrferences theme = DarkThemePrferences();
  bool _isDarkTheme = false;

  bool get isDarkTheme => _isDarkTheme;
  set toggleTheme(bool value) {
    _isDarkTheme = value;
    theme.setDarkTheme(value);
    notifyListeners();
  }
}
