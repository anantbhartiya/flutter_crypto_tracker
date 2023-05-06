import 'package:flutter/material.dart';

class ThemeClass {
  Color lightPrimaryColor = const Color.fromARGB(255, 24, 59, 197);
  Color darkPrimaryColor = const Color.fromRGBO(72, 0, 50, 1);
  Color secondaryColor = const Color.fromRGBO(255, 139, 106, 1);
  Color accentColor = const Color.fromRGBO(255, 210, 187, 1);

  static ThemeData lightTheme = ThemeData(
    primaryColor: ThemeData.light().scaffoldBackgroundColor,
    colorScheme: const ColorScheme.light().copyWith(
        primary: _themeClass.lightPrimaryColor,
        secondary: _themeClass.secondaryColor),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: ThemeData.dark().scaffoldBackgroundColor,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: _themeClass.darkPrimaryColor,
    ),
  );
}

ThemeClass _themeClass = ThemeClass();