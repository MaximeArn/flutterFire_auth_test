import 'package:flutter/material.dart';

class AppThemes {

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: const ColorScheme.dark(),
    elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.yellow.shade300),
          ),
        ),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    // textTheme: ,
    colorScheme: const ColorScheme.light(),
     elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.yellow),
          ),
        ),
  );
}
