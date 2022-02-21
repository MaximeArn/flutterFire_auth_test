import 'package:flutter/material.dart';

class AppThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColor: const Color.fromRGBO(255, 215, 0, 1),
    colorScheme: const ColorScheme.dark(),
    inputDecorationTheme: const InputDecorationTheme(
      focusColor:  Color.fromRGBO(255, 215, 0, 1),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Color.fromRGBO(255, 215, 0, 1),),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(255, 215, 0, 1),),
      ),
    ),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.yellow,
    colorScheme: const ColorScheme.light(),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.yellow),
      ),
    ),
  );
}
