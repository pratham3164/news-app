import 'package:flutter/material.dart';

class Styles {
  static ThemeData themedata(bool isDarkTheme, BuildContext context) {
    return ThemeData(
        primaryColor: isDarkTheme ? Color(0xff282e43) : Colors.white,
        accentColor: isDarkTheme ? Color(0xfffa4a2a) : Colors.pinkAccent,
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
        scaffoldBackgroundColor: isDarkTheme ? Color(0xff282e43) : Colors.white,
        cardColor: isDarkTheme ? Color(0xff282e43) : Colors.white,
        iconTheme: IconThemeData(color: Colors.grey),
        inputDecorationTheme: InputDecorationTheme(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
          color: isDarkTheme ? Color(0xfffa4a2a) : Colors.black,
        ))));
  }
}
