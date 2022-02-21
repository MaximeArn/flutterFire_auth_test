import 'package:flutter/material.dart';

const gold = Color.fromRGBO(233, 200, 55, 1);

class AppThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColor:  gold,
    colorScheme: const ColorScheme.dark().copyWith(primary: Colors.white),
    inputDecorationTheme: const InputDecorationTheme(
      focusColor: gold,
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: gold,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
           gold,
        ),
      ),
    ),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor:  gold,
    colorScheme: const ColorScheme.light().copyWith(primary: Colors.black),
     inputDecorationTheme: const InputDecorationTheme(
      focusColor: gold,
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: gold,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
         gold,
      )),
    ),
  );
}
