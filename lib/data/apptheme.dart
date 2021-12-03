import 'package:flutter/material.dart';

class MyTheme {
  static final dartkTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.grey,
    brightness: Brightness.dark,
    primaryColorDark: Colors.grey,
    colorScheme: const ColorScheme.dark(),
    backgroundColor: Colors.grey.shade900,
    scaffoldBackgroundColor: Colors.grey.shade500,
    dividerColor: Colors.black12,
  );

  static final lightTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(),
    backgroundColor: const Color(0xFFE5E5E5),
    dividerColor: Colors.white54,
  );
}
